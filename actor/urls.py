from django.urls import path
from .views import ActorListView, ActorDetailView

urlpatterns = [
    path('actors/', ActorListView.as_view(), name='actor_list'),
    path('actors/<int:pk>/', ActorDetailView.as_view(), name='actor_detail'),
] 