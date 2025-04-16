from django import forms
from django.contrib.auth import get_user_model, authenticate
from django.contrib.auth.forms import UserChangeForm, AuthenticationForm, UserCreationForm as BaseUserCreationForm
from .models import Profile
from django.core.exceptions import ValidationError

class CustomLoginForm(AuthenticationForm):
    username = forms.CharField(
        label="Tên đăng nhập hoặc Email",
        widget=forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Nhập tên đăng nhập hoặc địa chỉ email'})
    )
    password = forms.CharField(
        label="Mật khẩu",
        widget=forms.PasswordInput(attrs={'class': 'form-control', 'placeholder': 'Nhập mật khẩu'})
    )
    
    def clean(self):
        username = self.cleaned_data.get('username')
        password = self.cleaned_data.get('password')

        if username is not None and password:
            # Kiểm tra xem người dùng đang đăng nhập bằng email hay username
            if '@' in username:
                # Tìm user bằng email
                UserModel = get_user_model()
                try:
                    user = UserModel.objects.get(email=username)
                    if user:
                        # Nếu tìm thấy, dùng username của user để xác thực
                        self.user_cache = authenticate(self.request, username=user.username, password=password)
                except UserModel.DoesNotExist:
                    raise ValidationError(
                        self.error_messages['invalid_login'],
                        code='invalid_login',
                        params={'username': self.username_field.verbose_name},
                    )
            else:
                # Đăng nhập bình thường bằng username
                self.user_cache = authenticate(self.request, username=username, password=password)
                
            if self.user_cache is None:
                raise ValidationError(
                    self.error_messages['invalid_login'],
                    code='invalid_login',
                    params={'username': self.username_field.verbose_name},
                )
            else:
                self.confirm_login_allowed(self.user_cache)

        return self.cleaned_data

User = get_user_model()

class UserProfileForm(forms.ModelForm):
    current_password = forms.CharField(widget=forms.PasswordInput(), required=False)
    new_password = forms.CharField(widget=forms.PasswordInput(), required=False)
    confirm_password = forms.CharField(widget=forms.PasswordInput(), required=False)
    profile_picture = forms.ImageField(required=False)

    class Meta:
        model = User
        fields = ['username', 'email', 'first_name', 'last_name']

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        if self.instance:
            try:
                user_profile = self.instance.profile
            except Profile.DoesNotExist:
                user_profile = None

            if user_profile:
                self.fields['profile_picture'].initial = user_profile.profile_photo

    def clean(self):
        cleaned_data = super().clean()
        new_password = cleaned_data.get("new_password")
        confirm_password = cleaned_data.get("confirm_password")
        if new_password and new_password != confirm_password:
            raise forms.ValidationError("The new passwords do not match.")
        return cleaned_data

    def save(self, commit=True):
        user = super().save(commit=False)
        if commit:
            user.save()
            profile, created = Profile.objects.get_or_create(user=user)
            if self.cleaned_data.get('profile_picture'):
                profile.profile_photo = self.cleaned_data['profile_picture']
            profile.save()
        return user

class UserCreationForm(BaseUserCreationForm):
    email = forms.EmailField(required=True, help_text="Bắt buộc. Nhập địa chỉ email hợp lệ.")
    first_name = forms.CharField(max_length=30, required=False, help_text="Không bắt buộc.")
    last_name = forms.CharField(max_length=30, required=False, help_text="Không bắt buộc.")
    profile_picture = forms.ImageField(required=False, help_text="Không bắt buộc. Tải lên ảnh đại diện.")
    
    class Meta:
        model = User
        fields = ('username', 'email', 'first_name', 'last_name', 'password1', 'password2')
    
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        # Thêm các classes cho các trường để styling
        for field_name in self.fields:
            self.fields[field_name].widget.attrs.update({'class': 'form-control'})
    
    def clean_email(self):
        email = self.cleaned_data.get('email')
        if User.objects.filter(email=email).exists():
            raise forms.ValidationError("Email này đã được sử dụng. Vui lòng chọn email khác.")
        return email
    
    def save(self, commit=True):
        user = super().save(commit=False)
        user.email = self.cleaned_data['email']
        user.first_name = self.cleaned_data['first_name']
        user.last_name = self.cleaned_data['last_name']
        user.is_active = False  # Người dùng sẽ không active cho đến khi xác thực email
        
        if commit:
            user.save()
            # Tạo profile khi đăng ký
            profile = Profile.objects.create(user=user)
            if self.cleaned_data.get('profile_picture'):
                profile.profile_photo = self.cleaned_data['profile_picture']
                profile.save()
                
        return user
