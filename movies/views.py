from django.views.generic import ListView, DetailView
from django.http import JsonResponse
from .models import Movie, Genre, Episode
from user_interactions.models import UserList, Rating, Like, Comment
from django.db.models import F, Count, Avg
from django.utils import timezone
from datetime import timedelta
from django.shortcuts import render, get_object_or_404, redirect
from django.contrib.auth.decorators import login_required
from django.apps import AppConfig
from django.db.models import Q
from actor.models import Actor
from django.contrib import messages


class HomeView(ListView):
    model = Movie
    template_name = 'home.html'
    context_object_name = 'movies'

    @staticmethod
    def get_recommended_movies(user):
        if not user.is_authenticated:
            return Movie.objects.none()
        
        liked_movies = Movie.objects.filter(like__user=user)
        listed_movies = Movie.objects.filter(user_lists__user=user)
        
        user_genres = set()
        for movie in (liked_movies | listed_movies).distinct():
            user_genres.update(movie.genres.all())
        
        recommended_movies = Movie.objects.filter(genres__in=user_genres).exclude(
            id__in=(liked_movies | listed_movies)
        ).distinct().order_by('-views')[:10]
        
        return recommended_movies

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        movies = Movie.objects.all()
        for movie in movies:
            movie.like_count = movie.get_like_count()
            movie.average_rating = movie.get_average_rating()
        context['movies'] = movies
        trending_movies = get_trending_movies()
        for movie in trending_movies:
            movie.like_count = movie.get_like_count()
            movie.average_rating = movie.get_average_rating()
        context['trending_movies'] = trending_movies
        
        # Add recommended movies to the context
        recommended_movies = self.get_recommended_movies(self.request.user)
        for movie in recommended_movies:
            movie.like_count = movie.get_like_count()
            movie.average_rating = movie.get_average_rating()
        context['recommended_movies'] = recommended_movies
        
        return context

class MovieDetailView(DetailView):
    model = Movie
    template_name = 'movie_detail.html'
    context_object_name = 'movie'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        movie = self.object
        movie.like_count = movie.get_like_count()
        movie.average_rating = movie.get_average_rating()
        movie.comments = movie.get_comments()
        related_movies = self.get_related_movies(movie)
        context['related_movies'] = related_movies
        
        # Add episodes for series movies
        if movie.movie_type == 'series':
            context['episodes'] = movie.episodes.all().order_by('episode_number')
        
        user = self.request.user
        if user.is_authenticated:
            # Check if the movie is in any of the user's lists
            context['in_user_list'] = UserList.objects.filter(user=user, movies=movie).exists()
            
            # Get user's rating for this movie
            try:
                user_rating = Rating.objects.get(user=user, movie=movie)
                context['user_rating'] = user_rating.value
            except Rating.DoesNotExist:
                context['user_rating'] = None

            # Check if user has liked this movie
            context['user_liked'] = Like.objects.filter(user=user, movie=movie).exists()

            # Get user's comment for this movie, if any (changed from get to filter().first())
            user_comment = Comment.objects.filter(user=user, movie=movie).first()
            context['user_comment'] = user_comment.content if user_comment else None

        return context

    def get_related_movies(self, movie):
        genres = movie.genres.all()
        related_movies = Movie.objects.filter(genres__in=genres).exclude(id=movie.id).distinct()[:5]
        for related_movie in related_movies:
            related_movie.like_count = related_movie.get_like_count()
            related_movie.average_rating = related_movie.get_average_rating()
        return related_movies

# def get_trending_movies():
#     one_week_ago = timezone.now() - timedelta(days=100)
#     trending_movies = Movie.objects.filter(views__gt=1000, created_at__gte=one_week_ago).order_by('-views')[:10]
#     return trending_movies
def get_trending_movies():
    trending_movies = Movie.objects.order_by('-views')[:10]
    return trending_movies


class MoviesView(ListView):
    model = Movie
    template_name = 'movies.html'
    context_object_name = 'movies'

    def get_queryset(self):
        movie_type = self.request.GET.get('type', 'all')
        if movie_type == 'series':
            return Movie.objects.filter(movie_type='series')
        elif movie_type == 'single':
            return Movie.objects.filter(movie_type='single')
        else:
            return Movie.objects.all()

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        movies = self.get_queryset()
        for movie in movies:
            movie.like_count = movie.get_like_count()
            movie.average_rating = movie.get_average_rating()
        context['movies'] = movies
        context['genres'] = Genre.objects.all()
        context['current_type'] = self.request.GET.get('type', 'all')
        
        # Featured movies for the slider (using the top 3 trending movies)
        featured_movies = self.get_featured_movies()
        print(f"Number of featured movies: {len(featured_movies)}")  # Debug print
        for movie in featured_movies:
            movie.like_count = movie.get_like_count()
            movie.average_rating = movie.get_average_rating()
            print(f"Featured movie: {movie.title}, Views: {movie.views}")  # Debug print
        context['featured_movies'] = featured_movies
        
        return context

    def get_featured_movies(self):
        # Get top 3 most viewed movies
        featured_movies = Movie.objects.order_by('-views')[:3]
        return featured_movies

    def get_trending_movies(self):
        one_week_ago = timezone.now() - timedelta(days=14)
        trending_movies = Movie.objects.filter(views__gt=1000, created_at__gte=one_week_ago).order_by('-views')[:10]
        return trending_movies  
    


class MovieTrailerView(DetailView):
    model = Movie
    template_name = 'watch_trailer.html'
    context_object_name = 'movie'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        movie = self.object
        movie.like_count = movie.get_like_count()
        movie.average_rating = movie.get_average_rating()
        related_movies = Movie.objects.filter(genres__in=movie.genres.all()).exclude(id=movie.id).distinct()[:6]
        for related in related_movies:
            related.like_count = related.get_like_count()
            related.average_rating = related.get_average_rating()
        context['related_movies'] = related_movies
        return context
    
def search_movies(request):
    query = request.GET.get('q')
    if query:
        # Tìm kiếm phim
        title_matches = Movie.objects.filter(title__icontains=query)
        genre_matches = Movie.objects.filter(genres__name__icontains=query)
        actor_matches = Movie.objects.filter(actors__name__icontains=query)
        
        # Tìm kiếm diễn viên
        actors = Actor.objects.filter(name__icontains=query) | Actor.objects.filter(alternate_name__icontains=query)
        
        # Kết hợp các kết quả phim
        movies = list(title_matches) + list(genre_matches) + list(actor_matches)
        
        # Tính toán match_count để sắp xếp kết quả phim
        movie_counts = {}
        unique_movies = []
        
        for movie in movies:
            if movie.id not in movie_counts:
                movie_counts[movie.id] = 1
                movie.match_count = 1
                # Thêm các thông tin cần thiết cho phim
                movie.like_count = movie.get_like_count()
                movie.average_rating = movie.get_average_rating()
                unique_movies.append(movie)
            else:
                movie_counts[movie.id] += 1
                # Cập nhật match_count cho phim đã có
                for unique_movie in unique_movies:
                    if unique_movie.id == movie.id:
                        unique_movie.match_count = movie_counts[movie.id]
                        break
        
        # Sắp xếp phim theo số lần xuất hiện và lượt xem
        unique_movies.sort(key=lambda x: (-x.match_count, -x.views))
        
        # Thêm thông tin tuổi và số phim cho diễn viên
        for actor in actors:
            actor.age = actor.get_age()
            actor.movie_count = actor.get_movie_count()
        
    else:
        unique_movies = []
        actors = []
        
    return render(request, 'search_results.html', {
        'movies': unique_movies, 
        'actors': actors, 
        'query': query
    })

class ScreeningScheduleView(ListView):
    model = Movie
    template_name = 'screening_schedule.html'
    context_object_name = 'movies'

    def get_queryset(self):
        now = timezone.now()
        # Get movies with screening schedule in the future
        return Movie.objects.filter(screening_schedule__gte=now).order_by('screening_schedule')

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        movies = self.get_queryset()
        for movie in movies:
            movie.like_count = movie.get_like_count()
            movie.average_rating = movie.get_average_rating()
        context['movies'] = movies
        return context

def watch_episode(request, movie_id, episode_number):
    movie = get_object_or_404(Movie, id=movie_id)
    
    # Check if movie has a future screening schedule
    if movie.screening_schedule and movie.screening_schedule > timezone.now():
        messages.info(request, f'Phim "{movie.title}" chưa đến thời gian chiếu. Vui lòng quay lại vào ngày {movie.screening_schedule.strftime("%d/%m/%Y %H:%M")}.')
        return redirect('movie_detail', pk=movie_id)
    
    episode = get_object_or_404(Episode, movie=movie, episode_number=episode_number)
    
    # Check if this is a premium movie
    if movie.is_premium:
        try:
            # Try to import Subscription from payment app
            from payment.models import Subscription
            
            # Check if user has a valid subscription
            subscription = Subscription.objects.filter(
                user=request.user,
                is_active=True,
                end_date__gt=timezone.now()
            ).first()
            
            if not subscription:
                messages.warning(request, 'Bạn cần có gói Premium để xem phim này. Vui lòng nâng cấp tài khoản.')
                return redirect('payment:subscription_plans')
            
            has_premium_access = True
        except Exception as e:
            # Log error and redirect to subscription page
            print(f"Error checking subscription: {str(e)}")
            messages.error(request, 'Không thể xác minh trạng thái Premium. Vui lòng thử lại sau.')
            return redirect('payment:subscription_plans')
    else:
        has_premium_access = True
    
    # Get all episodes for the navigation
    episodes = movie.episodes.all().order_by('episode_number')
    
    # Get next and previous episodes
    next_episode = episodes.filter(episode_number__gt=episode_number).order_by('episode_number').first()
    prev_episode = episodes.filter(episode_number__lt=episode_number).order_by('-episode_number').first()
    
    # Increment view count for the movie
    movie.views += 1
    movie.save()
    
    context = {
        'movie': movie,
        'episode': episode,
        'episodes': episodes,
        'next_episode': next_episode,
        'prev_episode': prev_episode,
        'is_premium_content': movie.is_premium,
        'has_premium_access': has_premium_access,
    }
    
    return render(request, 'watch_episode.html', context)