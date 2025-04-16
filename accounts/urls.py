# urls.py
from django.urls import path
from django.contrib.auth.views import LoginView, LogoutView
from .forms import CustomLoginForm
from . import views


urlpatterns = [
    path('login/', LoginView.as_view(template_name='login.html', authentication_form=CustomLoginForm), name='login'),
    path('logout/', LogoutView.as_view(next_page='login'), name='logout'),
    path('account/', views.my_account, name='my_account'),
    path('register/', views.register, name='register'),
    path('confirm-email/<uuid:token>/', views.confirm_email, name='confirm_email'),
    path('resend-confirmation/', views.resend_confirmation, name='resend_confirmation'),
]
