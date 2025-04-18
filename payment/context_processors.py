from .models import Subscription
from django.utils import timezone

def user_subscription_status(request):
    """
    Context processor to provide user subscription status to all templates
    """
    context = {
        'is_premium': False,
        'subscription': None
    }
    
    if request.user.is_authenticated:
        # Check if user has an active subscription
        subscription = Subscription.objects.filter(
            user=request.user,
            is_active=True,
            end_date__gt=timezone.now()
        ).first()
        
        if subscription:
            context['is_premium'] = True
            context['subscription'] = subscription
    
    return context 