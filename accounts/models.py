from django.db import models
from django.contrib.auth.models import User
import uuid
from django.utils import timezone
from datetime import timedelta

class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    profile_photo = models.ImageField(upload_to="profile_photos/", null=True, blank=True, default='default_photo.jpg')
    
    def __str__(self):
        return f'{self.user.username} Profile'

class EmailConfirmationToken(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    token = models.UUIDField(default=uuid.uuid4, editable=False, unique=True)
    created_at = models.DateTimeField(auto_now_add=True)
    
    def __str__(self):
        return f'Email confirmation token for {self.user.username}'
    
    @property
    def is_valid(self):
        # Token hết hạn sau 24 giờ
        return self.created_at >= timezone.now() - timedelta(hours=24)
    
