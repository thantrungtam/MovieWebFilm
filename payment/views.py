import hashlib
import hmac
import json
import urllib
import urllib.parse
import urllib.request
import random
import uuid
import requests
from datetime import datetime, timedelta
from django.conf import settings
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse, HttpResponseRedirect, JsonResponse
from django.shortcuts import render, redirect, get_object_or_404
from django.urls import reverse
from django.utils import timezone
from urllib.parse import quote as urlquote
from .vnpay import vnpay

from .models import SubscriptionPlan, Subscription, Payment
from .forms import PaymentForm


def index(request):
    return render(request, "index.html", {"title": "Danh sách demo"})


def hmacsha512(key, data):
    byteKey = key.encode('utf-8')
    byteData = data.encode('utf-8')
    return hmac.new(byteKey, byteData, hashlib.sha512).hexdigest()


def payment(request):

    if request.method == 'POST':
        # Process input data and build url payment
        form = PaymentForm(request.POST)
        if form.is_valid():
            order_type = form.cleaned_data['order_type']
            order_id = form.cleaned_data['order_id']
            amount = form.cleaned_data['amount']
            order_desc = form.cleaned_data['order_desc']
            bank_code = form.cleaned_data['bank_code']
            language = form.cleaned_data['language']
            ipaddr = get_client_ip(request)
            # Build URL Payment
            vnp = vnpay()
            vnp.requestData['vnp_Version'] = '2.1.0'
            vnp.requestData['vnp_Command'] = 'pay'
            vnp.requestData['vnp_TmnCode'] = settings.VNPAY_TMN_CODE
            vnp.requestData['vnp_Amount'] = amount * 100
            vnp.requestData['vnp_CurrCode'] = 'VND'
            vnp.requestData['vnp_TxnRef'] = order_id
            vnp.requestData['vnp_OrderInfo'] = order_desc
            vnp.requestData['vnp_OrderType'] = order_type
            # Check language, default: vn
            if language and language != '':
                vnp.requestData['vnp_Locale'] = language
            else:
                vnp.requestData['vnp_Locale'] = 'vn'
                # Check bank_code, if bank_code is empty, customer will be selected bank on VNPAY
            if bank_code and bank_code != "":
                vnp.requestData['vnp_BankCode'] = bank_code

            vnp.requestData['vnp_CreateDate'] = datetime.now().strftime('%Y%m%d%H%M%S')  # 20150410063022
            vnp.requestData['vnp_IpAddr'] = ipaddr
            vnp.requestData['vnp_ReturnUrl'] = settings.VNPAY_RETURN_URL
            vnpay_payment_url = vnp.get_payment_url(settings.VNPAY_PAYMENT_URL, settings.VNPAY_HASH_SECRET_KEY)
            print(vnpay_payment_url)
            return redirect(vnpay_payment_url)
        else:
            print("Form input not validate")
    else:
        return render(request, "payment.html", {"title": "Thanh toán"})


# def payment_ipn(request):
#     inputData = request.GET
#     if inputData:
#         vnp = vnpay()
#         vnp.responseData = inputData.dict()
#         order_id = inputData['vnp_TxnRef']
#         amount = inputData['vnp_Amount']
#         order_desc = inputData['vnp_OrderInfo']
#         vnp_TransactionNo = inputData['vnp_TransactionNo']
#         vnp_ResponseCode = inputData['vnp_ResponseCode']
#         vnp_TmnCode = inputData['vnp_TmnCode']
#         vnp_PayDate = inputData['vnp_PayDate']
#         vnp_BankCode = inputData['vnp_BankCode']
#         vnp_CardType = inputData['vnp_CardType']
#         if vnp.validate_response(settings.VNPAY_HASH_SECRET_KEY):
#             # Check & Update Order Status in your Database
#             # Your code here
#             firstTimeUpdate = True
#             totalamount = True
#             if totalamount:
#                 if firstTimeUpdate:
#                     if vnp_ResponseCode == '00':
#                         print('Payment Success. Your code implement here')
#                     else:
#                         print('Payment Error. Your code implement here')

#                     # Return VNPAY: Merchant update success
#                     result = JsonResponse({'RspCode': '00', 'Message': 'Confirm Success'})
#                 else:
#                     # Already Update
#                     result = JsonResponse({'RspCode': '02', 'Message': 'Order Already Update'})
#             else:
#                 # invalid amount
#                 result = JsonResponse({'RspCode': '04', 'Message': 'invalid amount'})
#         else:
#             # Invalid Signature
#             result = JsonResponse({'RspCode': '97', 'Message': 'Invalid Signature'})
#     else:
#         result = JsonResponse({'RspCode': '99', 'Message': 'Invalid request'})

#     return result

def payment_ipn(request):
    inputData = request.GET
    if inputData:
        vnp = vnpay()
        vnp.responseData = inputData.dict()
        order_id = inputData['vnp_TxnRef']
        amount = int(inputData['vnp_Amount']) // 100  # VNPay gửi *100
        vnp_ResponseCode = inputData['vnp_ResponseCode']

        if vnp.validate_response(settings.VNPAY_HASH_SECRET_KEY):
            try:
                payment = Payment.objects.get(order_id=order_id)

                if payment.payment_status != 'pending':
                    return JsonResponse({'RspCode': '02', 'Message': 'Order already updated'})

                if payment.amount != amount:
                    return JsonResponse({'RspCode': '04', 'Message': 'Invalid amount'})

                if vnp_ResponseCode == '00':
                    payment.payment_status = 'completed'
                else:
                    payment.payment_status = 'failed'
                
                payment.save()

                return JsonResponse({'RspCode': '00', 'Message': 'Confirm Success'})
            except Payment.DoesNotExist:
                return JsonResponse({'RspCode': '01', 'Message': 'Order not found'})
        else:
            return JsonResponse({'RspCode': '97', 'Message': 'Invalid Signature'})
    else:
        return JsonResponse({'RspCode': '99', 'Message': 'Invalid request'})



def payment_return(request):
    inputData = request.GET
    if inputData:
        vnp = vnpay()
        vnp.responseData = inputData.dict()
        order_id = inputData['vnp_TxnRef']
        amount = int(inputData['vnp_Amount']) / 100
        order_desc = inputData['vnp_OrderInfo']
        vnp_TransactionNo = inputData['vnp_TransactionNo']
        vnp_ResponseCode = inputData['vnp_ResponseCode']
        vnp_TmnCode = inputData['vnp_TmnCode']
        vnp_PayDate = inputData['vnp_PayDate']
        vnp_BankCode = inputData['vnp_BankCode']
        vnp_CardType = inputData['vnp_CardType']
        if vnp.validate_response(settings.VNPAY_HASH_SECRET_KEY):
            if vnp_ResponseCode == "00":
                return render(request, "payment_return.html", {"title": "Kết quả thanh toán",
                                                               "result": "Thành công", "order_id": order_id,
                                                               "amount": amount,
                                                               "order_desc": order_desc,
                                                               "vnp_TransactionNo": vnp_TransactionNo,
                                                               "vnp_ResponseCode": vnp_ResponseCode})
            else:
                return render(request, "payment_return.html", {"title": "Kết quả thanh toán",
                                                               "result": "Lỗi", "order_id": order_id,
                                                               "amount": amount,
                                                               "order_desc": order_desc,
                                                               "vnp_TransactionNo": vnp_TransactionNo,
                                                               "vnp_ResponseCode": vnp_ResponseCode})
        else:
            return render(request, "payment_return.html",
                          {"title": "Kết quả thanh toán", "result": "Lỗi", "order_id": order_id, "amount": amount,
                           "order_desc": order_desc, "vnp_TransactionNo": vnp_TransactionNo,
                           "vnp_ResponseCode": vnp_ResponseCode, "msg": "Sai checksum"})
    else:
        return render(request, "payment_return.html", {"title": "Kết quả thanh toán", "result": ""})


def get_client_ip(request):
    x_forwarded_for = request.META.get('HTTP_X_FORWARDED_FOR')
    if x_forwarded_for:
        ip = x_forwarded_for.split(',')[0]
    else:
        ip = request.META.get('REMOTE_ADDR')
    return ip

n = random.randint(10**11, 10**12 - 1)
n_str = str(n)
while len(n_str) < 12:
    n_str = '0' + n_str


def query(request):
    if request.method == 'GET':
        return render(request, "query.html", {"title": "Kiểm tra kết quả giao dịch"})

    url = settings.VNPAY_API_URL
    secret_key = settings.VNPAY_HASH_SECRET_KEY
    vnp_TmnCode = settings.VNPAY_TMN_CODE
    vnp_Version = '2.1.0'

    vnp_RequestId = n_str
    vnp_Command = 'querydr'
    vnp_TxnRef = request.POST['order_id']
    vnp_OrderInfo = 'kiem tra gd'
    vnp_TransactionDate = request.POST['trans_date']
    vnp_CreateDate = datetime.now().strftime('%Y%m%d%H%M%S')
    vnp_IpAddr = get_client_ip(request)

    hash_data = "|".join([
        vnp_RequestId, vnp_Version, vnp_Command, vnp_TmnCode,
        vnp_TxnRef, vnp_TransactionDate, vnp_CreateDate,
        vnp_IpAddr, vnp_OrderInfo
    ])

    secure_hash = hmac.new(secret_key.encode(), hash_data.encode(), hashlib.sha512).hexdigest()

    data = {
        "vnp_RequestId": vnp_RequestId,
        "vnp_TmnCode": vnp_TmnCode,
        "vnp_Command": vnp_Command,
        "vnp_TxnRef": vnp_TxnRef,
        "vnp_OrderInfo": vnp_OrderInfo,
        "vnp_TransactionDate": vnp_TransactionDate,
        "vnp_CreateDate": vnp_CreateDate,
        "vnp_IpAddr": vnp_IpAddr,
        "vnp_Version": vnp_Version,
        "vnp_SecureHash": secure_hash
    }

    headers = {"Content-Type": "application/json"}

    response = requests.post(url, headers=headers, data=json.dumps(data))

    if response.status_code == 200:
        response_json = json.loads(response.text)
    else:
        response_json = {"error": f"Request failed with status code: {response.status_code}"}

    return render(request, "query.html", {"title": "Kiểm tra kết quả giao dịch", "response_json": response_json})

def refund(request):
    if request.method == 'GET':
        return render(request, "refund.html", {"title": "Hoàn tiền giao dịch"})

    url = settings.VNPAY_API_URL
    secret_key = settings.VNPAY_HASH_SECRET_KEY
    vnp_TmnCode = settings.VNPAY_TMN_CODE
    vnp_RequestId = n_str
    vnp_Version = '2.1.0'
    vnp_Command = 'refund'
    vnp_TransactionType = request.POST['TransactionType']
    vnp_TxnRef = request.POST['order_id']
    vnp_Amount = request.POST['amount']
    vnp_OrderInfo = request.POST['order_desc']
    vnp_TransactionNo = '0'
    vnp_TransactionDate = request.POST['trans_date']
    vnp_CreateDate = datetime.now().strftime('%Y%m%d%H%M%S')
    vnp_CreateBy = 'user01'
    vnp_IpAddr = get_client_ip(request)

    hash_data = "|".join([
        vnp_RequestId, vnp_Version, vnp_Command, vnp_TmnCode, vnp_TransactionType, vnp_TxnRef,
        vnp_Amount, vnp_TransactionNo, vnp_TransactionDate, vnp_CreateBy, vnp_CreateDate,
        vnp_IpAddr, vnp_OrderInfo
    ])

    secure_hash = hmac.new(secret_key.encode(), hash_data.encode(), hashlib.sha512).hexdigest()

    data = {
        "vnp_RequestId": vnp_RequestId,
        "vnp_TmnCode": vnp_TmnCode,
        "vnp_Command": vnp_Command,
        "vnp_TxnRef": vnp_TxnRef,
        "vnp_Amount": vnp_Amount,
        "vnp_OrderInfo": vnp_OrderInfo,
        "vnp_TransactionDate": vnp_TransactionDate,
        "vnp_CreateDate": vnp_CreateDate,
        "vnp_IpAddr": vnp_IpAddr,
        "vnp_TransactionType": vnp_TransactionType,
        "vnp_TransactionNo": vnp_TransactionNo,
        "vnp_CreateBy": vnp_CreateBy,
        "vnp_Version": vnp_Version,
        "vnp_SecureHash": secure_hash
    }

    headers = {"Content-Type": "application/json"}

    response = requests.post(url, headers=headers, data=json.dumps(data))

    if response.status_code == 200:
        response_json = json.loads(response.text)
    else:
        response_json = {"error": f"Request failed with status code: {response.status_code}"}

    return render(request, "refund.html", {"title": "Kết quả hoàn tiền giao dịch", "response_json": response_json})

@login_required
def subscription_plans(request):
    """
    Display available subscription plans to the user
    """
    plans = SubscriptionPlan.objects.all().order_by('price')
    
    # Get user's current subscription if any
    current_subscription = Subscription.objects.filter(
        user=request.user, 
        is_active=True, 
        end_date__gt=timezone.now()
    ).first()
    
    return render(request, 'payment/subscription_plans.html', {
        'plans': plans,
        'current_subscription': current_subscription
    })

@login_required
def process_subscription(request, plan_id):
    """
    Process the subscription and redirect to VNPay payment
    """
    plan = get_object_or_404(SubscriptionPlan, id=plan_id)
    
    # Generate a unique order ID
    order_id = str(uuid.uuid4().int)[:12]
    
    # Create payment record
    payment = Payment.objects.create(
        user=request.user,
        order_id=order_id,
        amount=plan.price,
        payment_status='pending'
    )
    
    # Prepare VNPay payment
    vnp = vnpay()
    vnp.requestData['vnp_Version'] = '2.1.0'
    vnp.requestData['vnp_Command'] = 'pay'
    vnp.requestData['vnp_TmnCode'] = settings.VNPAY_TMN_CODE
    vnp.requestData['vnp_Amount'] = plan.price * 100  # Amount in VND, multiply by 100
    vnp.requestData['vnp_CurrCode'] = 'VND'
    vnp.requestData['vnp_TxnRef'] = order_id
    vnp.requestData['vnp_OrderInfo'] = f"Payment for {plan.name} subscription - {plan.duration_months} months"
    vnp.requestData['vnp_OrderType'] = 'billpayment'
    vnp.requestData['vnp_Locale'] = 'vn'
    vnp.requestData['vnp_CreateDate'] = datetime.now().strftime('%Y%m%d%H%M%S')
    vnp.requestData['vnp_IpAddr'] = get_client_ip(request)
    vnp.requestData['vnp_ReturnUrl'] = request.build_absolute_uri(reverse('payment:vnpay_return'))
    
    # Store plan_id in session for later use
    request.session['subscription_plan_id'] = plan.id
    request.session['payment_id'] = payment.id
    
    # Get the payment URL and redirect to VNPay
    vnpay_payment_url = vnp.get_payment_url(settings.VNPAY_PAYMENT_URL, settings.VNPAY_HASH_SECRET_KEY)
    return redirect(vnpay_payment_url)

@login_required
def vnpay_return(request):
    """
    Handle the return from VNPay payment gateway
    """
    input_data = request.GET
    if input_data:
        vnp = vnpay()
        vnp.responseData = input_data.dict()
        
        # Get payment details from VNPay response
        order_id = input_data.get('vnp_TxnRef', '')
        amount = int(input_data.get('vnp_Amount', 0)) / 100  # Convert back from amount * 100
        vnp_response_code = input_data.get('vnp_ResponseCode', '')
        
        # Get the payment record
        payment = get_object_or_404(Payment, order_id=order_id)
        
        if vnp.validate_response(settings.VNPAY_HASH_SECRET_KEY):
            if vnp_response_code == "00":
                # Payment successful
                plan_id = request.session.get('subscription_plan_id')
                if not plan_id:
                    return render(request, 'payment/payment_failed.html', {
                        'message': 'Session expired or invalid plan.'
                    })
                
                plan = get_object_or_404(SubscriptionPlan, id=plan_id)
                
                # Update payment status
                payment.payment_status = 'completed'
                payment.save()
                
                # Create or update subscription
                start_date = timezone.now()
                end_date = start_date + timedelta(days=30 * plan.duration_months)
                
                # Check if user already has an active subscription
                existing_subscription = Subscription.objects.filter(
                    user=request.user, 
                    is_active=True
                ).first()
                
                if existing_subscription:
                    # Extend the existing subscription
                    if existing_subscription.end_date > timezone.now():
                        # If subscription is still active, add months to current end date
                        end_date = existing_subscription.end_date + timedelta(days=30 * plan.duration_months)
                    existing_subscription.plan = plan
                    existing_subscription.end_date = end_date
                    existing_subscription.save()
                    subscription = existing_subscription
                else:
                    # Create new subscription
                    subscription = Subscription.objects.create(
                        user=request.user,
                        plan=plan,
                        start_date=start_date,
                        end_date=end_date,
                        is_active=True
                    )
                
                # Update payment with subscription reference
                payment.subscription = subscription
                payment.save()
                
                # Clear session data
                if 'subscription_plan_id' in request.session:
                    del request.session['subscription_plan_id']
                if 'payment_id' in request.session:
                    del request.session['payment_id']
                
                return redirect('payment:subscription_success')
            else:
                # Payment failed
                payment.payment_status = 'failed'
                payment.save()
                return redirect('payment:payment_failed')
        else:
            # Invalid signature
            payment.payment_status = 'failed'
            payment.save()
            return render(request, 'payment/payment_failed.html', {
                'message': 'Invalid payment signature'
            })
    
    return render(request, 'payment/payment_failed.html', {
        'message': 'Invalid payment data'
    })

@login_required
def subscription_success(request):
    """
    Display subscription success page
    """
    subscription = Subscription.objects.filter(
        user=request.user, 
        is_active=True
    ).order_by('-start_date').first()
    
    return render(request, 'payment/subscription_success.html', {
        'subscription': subscription
    })

@login_required
def payment_failed(request):
    """
    Display payment failed page
    """
    return render(request, 'payment/payment_failed.html')

@login_required
def cancel_payment(request):
    """
    Handle payment cancellation
    """
    # If payment was initiated but canceled
    if 'payment_id' in request.session:
        payment_id = request.session['payment_id']
        try:
            payment = Payment.objects.get(id=payment_id)
            payment.payment_status = 'failed'
            payment.save()
        except Payment.DoesNotExist:
            pass
        
        # Clear session data
        if 'subscription_plan_id' in request.session:
            del request.session['subscription_plan_id']
        if 'payment_id' in request.session:
            del request.session['payment_id']
    
    return redirect('payment:subscription_plans')

@login_required
def user_subscriptions(request):
    """
    Display user's subscription history
    """
    subscriptions = Subscription.objects.filter(
        user=request.user
    ).order_by('-start_date')
    
    payments = Payment.objects.filter(
        user=request.user
    ).order_by('-created_at')
    
    return render(request, 'payment/user_subscriptions.html', {
        'subscriptions': subscriptions,
        'payments': payments
    })


