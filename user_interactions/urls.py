from django.urls import path
from . import views

urlpatterns = [
    path('rate/<int:movie_id>/', views.rate_movie, name='rate_movie'),
    path('like/<int:movie_id>/', views.like_movie, name='like_movie'),
    path('comment/<int:movie_id>/', views.comment_movie, name='comment_movie'),
    path('add_to_list/<int:movie_id>/', views.add_to_list, name='add_to_list'),
    path('remove_from_list/<int:movie_id>/', views.remove_from_list, name='remove_from_list'),
    path('view_list/', views.view_user_list, name='view_user_list'),
    path('favorite_actors/', views.view_favorite_actors, name='favorite_actors'),
    path('favorite_movies/', views.view_favorite_movies, name='favorite_movies'),
    path('watch/<int:movie_id>/', views.watch_movie, name='watch_movie'),
    path('watch_trailer/<int:movie_id>/', views.watch_trailer, name='watch_trailer'),
    # Actor user interactions
    path('add_actor_to_list/<int:actor_id>/', views.add_actor_to_list, name='add_actor_to_list'),
    path('remove_actor_from_list/<int:actor_id>/', views.remove_actor_from_list, name='remove_actor_from_list'),
    path('check_actor_in_list/<int:actor_id>/', views.check_actor_in_list, name='check_actor_in_list'),
]