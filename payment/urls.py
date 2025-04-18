"""vnpay_python URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.10/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.urls import path
from . import views

app_name = 'payment'

urlpatterns = [
    # Display subscription plans
    path('plans/', views.subscription_plans, name='subscription_plans'),
    
    # Payment process
    path('process-subscription/<int:plan_id>/', views.process_subscription, name='process_subscription'),
    path('cancel/', views.cancel_payment, name='cancel_payment'),
    path('success/', views.subscription_success, name='subscription_success'),
    path('failed/', views.payment_failed, name='payment_failed'),
    
    # VNPAY return URL
    path('vnpay-return/', views.vnpay_return, name='vnpay_return'),
    
    # User subscriptions and payment history
    path('my-subscriptions/', views.user_subscriptions, name='user_subscriptions'),
    
    # Original VNPAY demo paths (can be removed later)
    path('', views.index, name='index'),
    path('payment', views.payment, name='payment'),
    path('payment_ipn', views.payment_ipn, name='payment_ipn'),
    path('payment_return', views.payment_return, name='payment_return'),
    path('query', views.query, name='query'),
    path('refund', views.refund, name='refund'),
]
