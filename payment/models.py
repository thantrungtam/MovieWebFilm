from django.db import models
from django.contrib.auth.models import User
from django.utils import timezone

class SubscriptionPlan(models.Model):
    DURATION_CHOICES = [
        (1, '1 tháng'),
        (3, '3 tháng'),
        (6, '6 tháng'),
    ]
    
    name = models.CharField(max_length=100)
    duration_months = models.IntegerField(choices=DURATION_CHOICES)
    price = models.IntegerField()  # Price in VND
    
    def __str__(self):
        return f"{self.name} - {self.get_duration_months_display()}"

class Subscription(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='subscriptions')
    plan = models.ForeignKey(SubscriptionPlan, on_delete=models.CASCADE)
    start_date = models.DateTimeField(default=timezone.now)
    end_date = models.DateTimeField()
    is_active = models.BooleanField(default=True)
    
    def save(self, *args, **kwargs):
        if not self.end_date:
            self.end_date = self.start_date + timezone.timedelta(days=30*self.plan.duration_months)
        super().save(*args, **kwargs)
    
    def is_valid(self):
        return self.is_active and self.end_date > timezone.now()
    
    def __str__(self):
        return f"{self.user.username} - {self.plan.name} ({self.start_date.date()} to {self.end_date.date()})"
    
class Payment(models.Model):
    PAYMENT_STATUS_CHOICES = [
        ('pending', 'Đang chờ xử lý'),
        ('completed', 'Hoàn thành'),
        ('failed', 'Thất bại'),
    ]
    
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    subscription = models.ForeignKey(Subscription, on_delete=models.SET_NULL, null=True, blank=True)
    order_id = models.CharField(max_length=255)
    amount = models.IntegerField()
    payment_status = models.CharField(max_length=20, choices=PAYMENT_STATUS_CHOICES, default='pending')
    created_at = models.DateTimeField(auto_now_add=True)
    
    def __str__(self):
        return f"Payment {self.order_id} - {self.user.username} - {self.get_payment_status_display()}"
    

