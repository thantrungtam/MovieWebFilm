from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth import update_session_auth_hash, login
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from .forms import UserProfileForm, UserCreationForm
from .models import EmailConfirmationToken
from django.core.mail import send_mail
from django.template.loader import render_to_string
from django.utils.html import strip_tags
from django.conf import settings
from django.contrib.auth.models import User
from django.urls import reverse


@login_required
def my_account(request):
    if request.method == 'POST':
        form = UserProfileForm(request.POST, request.FILES, instance=request.user)
        if form.is_valid():
            user = form.save()
            # Handle password change
            current_password = form.cleaned_data.get('current_password')
            new_password = form.cleaned_data.get('new_password')
            if current_password and new_password:
                if user.check_password(current_password):
                    user.set_password(new_password)
                    update_session_auth_hash(request, user)  # Important to keep user logged in
                    messages.success(request, 'Your password was successfully updated!')
                else:
                    messages.error(request, 'Current password is incorrect.')
                    return render(request, 'my_account.html', {'form': form})
            
            messages.success(request, 'Your profile was successfully updated!')
            return redirect('my_account')
    else:
        form = UserProfileForm(instance=request.user)
    return render(request, 'my_account.html', {'form': form})


def register(request):
    if request.method == 'POST':
        form = UserCreationForm(request.POST, request.FILES)
        if form.is_valid():
            user = form.save()
            # Tạo token xác thực
            token = EmailConfirmationToken.objects.create(user=user)
            
            # Xây dựng link xác nhận
            confirmation_link = request.build_absolute_uri(
                reverse('confirm_email', kwargs={'token': token.token})
            )
            
            # Chuẩn bị nội dung email
            html_message = render_to_string('email/confirm_email.html', {
                'user': user,
                'confirmation_link': confirmation_link
            })
            plain_message = strip_tags(html_message)
            
            # Gửi email xác nhận
            send_mail(
                subject='Xác nhận đăng ký tài khoản Mẹt Phim',
                message=plain_message,
                from_email=settings.DEFAULT_FROM_EMAIL,
                recipient_list=[user.email],
                html_message=html_message,
                fail_silently=False,
            )
            
            # Hiển thị thông báo rõ ràng hơn về việc cần xác nhận email
            messages.success(request, f'Đăng ký thành công! Chúng tôi đã gửi một email đến <strong>{user.email}</strong>. Vui lòng kiểm tra hộp thư (và thư mục spam) để xác nhận tài khoản của bạn.')
            
            # Hiển thị trang riêng về xác nhận email thay vì chuyển hướng đến trang đăng nhập
            return render(request, 'registration_success.html', {'email': user.email})
    else:
        form = UserCreationForm()
    return render(request, 'register.html', {'form': form})


def confirm_email(request, token):
    token_obj = get_object_or_404(EmailConfirmationToken, token=token)
    
    # Kiểm tra token có còn hiệu lực không
    if not token_obj.is_valid:
        messages.error(request, 'Link xác nhận đã hết hạn. Vui lòng đăng ký lại.')
        return redirect('register')
    
    # Kích hoạt tài khoản
    user = token_obj.user
    user.is_active = True
    user.save()
    
    # Xóa token
    token_obj.delete()
    
    messages.success(request, 'Xác nhận email thành công! Bạn có thể đăng nhập ngay bây giờ.')
    return redirect('login')


def resend_confirmation(request):
    if request.method == 'POST':
        email = request.POST.get('email')
        try:
            user = User.objects.get(email=email, is_active=False)
            
            # Xóa token cũ nếu có
            EmailConfirmationToken.objects.filter(user=user).delete()
            
            # Tạo token mới
            token = EmailConfirmationToken.objects.create(user=user)
            
            # Xây dựng link xác nhận
            confirmation_link = request.build_absolute_uri(
                reverse('confirm_email', kwargs={'token': token.token})
            )
            
            # Chuẩn bị nội dung email
            html_message = render_to_string('email/confirm_email.html', {
                'user': user,
                'confirmation_link': confirmation_link
            })
            plain_message = strip_tags(html_message)
            
            # Gửi email xác nhận
            send_mail(
                subject='Xác nhận đăng ký tài khoản Mẹt Phim',
                message=plain_message,
                from_email=settings.DEFAULT_FROM_EMAIL,
                recipient_list=[user.email],
                html_message=html_message,
                fail_silently=False,
            )
            
            messages.success(request, f'Email xác nhận đã được gửi lại đến <strong>{email}</strong>. Vui lòng kiểm tra hộp thư của bạn.')
        except User.DoesNotExist:
            messages.error(request, 'Không tìm thấy tài khoản chưa kích hoạt với email này.')
        
    return render(request, 'resend_confirmation.html')


