from django.urls import path
from .views import HomeView, MovieDetailView, MoviesView, MovieTrailerView, ScreeningScheduleView
from . import views

urlpatterns = [
    path('', HomeView.as_view(), name='home'),
    path('movie/<int:pk>/', MovieDetailView.as_view(), name='movie_detail'),
    path('movie/<int:pk>/trailer/', MovieTrailerView.as_view(), name='watch_trailer'),
    path('movie/<int:movie_id>/episode/<int:episode_number>/', views.watch_episode, name='watch_episode'),
    path('movies/', MoviesView.as_view(), name='movies_page'),
    path('search/', views.search_movies, name='search_movies'),
    path('schedule/', ScreeningScheduleView.as_view(), name='screening_schedule'),
]
