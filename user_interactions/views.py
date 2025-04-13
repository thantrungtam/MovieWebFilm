from django.shortcuts import redirect, get_object_or_404, render
from django.contrib.auth.decorators import login_required
from .models import Rating, Like, Comment, UserList
from movies.models import Movie
from actor.models import Actor
from django.contrib import messages
from django.http import JsonResponse

@login_required
def rate_movie(request, movie_id):
    if request.method == 'POST':
        movie = get_object_or_404(Movie, id=movie_id)
        value = request.POST.get('rating')
        
        # Check if the value is not None and is a valid rating
        if value is not None and value.isdigit() and 1 <= int(value) <= 5:
            Rating.objects.update_or_create(user=request.user, movie=movie, defaults={'value': int(value)})
        else:
            messages.error(request, "Invalid rating value. Please provide a rating between 1 and 5.")
            return redirect('movie_detail', pk=movie_id)
        
    return redirect('movie_detail', pk=movie_id)


@login_required
def like_movie(request, movie_id):
    movie = get_object_or_404(Movie, id=movie_id)
    like, created = Like.objects.get_or_create(user=request.user, movie = movie)
    if not created:
        like.delete()
    return redirect('movie_detail', pk=movie_id)


@login_required
def comment_movie(request, movie_id):
    if request.method == 'POST':
        movie = get_object_or_404(Movie, id=movie_id)
        content = request.POST.get('content')
        Comment.objects.create(user=request.user, movie=movie, content=content)
    return redirect('movie_detail', pk=movie_id)


@login_required
def add_to_list(request, movie_id):
    movie = get_object_or_404(Movie, id=movie_id)
    user_list, created = UserList.objects.get_or_create(user=request.user)
    if movie not in user_list.movies.all():
        user_list.movies.add(movie)
        messages.success(request, f'{movie.title} was added to your list!')
    else:
        messages.info(request, f'{movie.title} is already in your list.')
    return redirect('movie_detail', pk = movie_id)

@login_required
def remove_from_list(request, movie_id):
    movie = get_object_or_404(Movie, id = movie_id)
    user_list = get_object_or_404(UserList, user = request.user)
    if movie in user_list.movies.all():
        user_list.movies.remove(movie)
        messages.success(request, f'{movie.title} was removed from your list!')
    else:
        messages.error(request, f'{movie.title} is not in your list.')
    return redirect('movie_detail', pk = movie_id)

@login_required
def add_actor_to_list(request, actor_id):
    actor = get_object_or_404(Actor, id=actor_id)
    user_list, created = UserList.objects.get_or_create(user=request.user)
    
    # Debug information
    is_ajax = request.headers.get('X-Requested-With') == 'XMLHttpRequest'
    method = request.method
    headers = {key: value for key, value in request.headers.items()}
    
    if actor not in user_list.actors.all():
        user_list.actors.add(actor)
        if is_ajax:
            return JsonResponse({
                'status': 'success', 
                'message': f'{actor.name} đã được thêm vào bộ sưu tập!',
                'debug': {
                    'is_ajax': is_ajax,
                    'method': method,
                    'user': str(request.user),
                    'actor_id': actor_id
                }
            })
        messages.success(request, f'{actor.name} đã được thêm vào bộ sưu tập!')
    else:
        if is_ajax:
            return JsonResponse({
                'status': 'info', 
                'message': f'{actor.name} đã có trong bộ sưu tập!',
                'debug': {
                    'is_ajax': is_ajax,
                    'method': method,
                    'user': str(request.user),
                    'actor_id': actor_id
                }
            })
        messages.info(request, f'{actor.name} đã có trong bộ sưu tập!')
    
    return redirect('actor_detail', pk=actor_id)

@login_required
def remove_actor_from_list(request, actor_id):
    actor = get_object_or_404(Actor, id=actor_id)
    user_list = get_object_or_404(UserList, user=request.user)
    
    # Debug information
    is_ajax = request.headers.get('X-Requested-With') == 'XMLHttpRequest'
    method = request.method
    
    if actor in user_list.actors.all():
        user_list.actors.remove(actor)
        if is_ajax:
            return JsonResponse({
                'status': 'success', 
                'message': f'{actor.name} đã bị xóa khỏi bộ sưu tập!',
                'debug': {
                    'is_ajax': is_ajax,
                    'method': method,
                    'user': str(request.user),
                    'actor_id': actor_id
                }
            })
        messages.success(request, f'{actor.name} đã bị xóa khỏi bộ sưu tập!')
    else:
        if is_ajax:
            return JsonResponse({
                'status': 'error', 
                'message': f'{actor.name} không có trong bộ sưu tập!',
                'debug': {
                    'is_ajax': is_ajax,
                    'method': method,
                    'user': str(request.user),
                    'actor_id': actor_id
                }
            })
        messages.error(request, f'{actor.name} không có trong bộ sưu tập!')
    
    return redirect('actor_detail', pk=actor_id)

@login_required
def check_actor_in_list(request, actor_id):
    # Process the request regardless of AJAX or not
    actor = get_object_or_404(Actor, id=actor_id)
    user_list, created = UserList.objects.get_or_create(user=request.user)
    is_in_list = actor in user_list.actors.all()
    
    is_ajax = request.headers.get('X-Requested-With') == 'XMLHttpRequest'
    
    if is_ajax:
        return JsonResponse({
            'status': 'success',
            'is_in_list': is_in_list,
            'in_list': is_in_list,  # For backward compatibility
            'debug': {
                'is_ajax': is_ajax,
                'method': request.method,
                'user': str(request.user),
                'actor_id': actor_id
            }
        })
    
    # For non-AJAX requests, redirect to actor detail
    return redirect('actor_detail', pk=actor_id)

@login_required
def view_user_list(request):
    user_list, created = UserList.objects.get_or_create(user=request.user)
    return render(request, 'view_user_list.html', {'user_list': user_list})

@login_required
def view_favorite_movies(request):
    user_list, created = UserList.objects.get_or_create(user=request.user)
    return render(request, 'favorite_movies.html', {'user_list': user_list})

@login_required
def view_favorite_actors(request):
    user_list, created = UserList.objects.get_or_create(user=request.user)
    return render(request, 'favorite_actors.html', {'user_list': user_list})

@login_required
def watch_movie(request, movie_id):
    movie = get_object_or_404(Movie, pk=movie_id)
    return render(request, 'watch_movie.html', {'movie': movie})

@login_required
def watch_trailer(request, movie_id):
    movie = get_object_or_404(Movie, pk=movie_id)
    return render(request, 'watch_trailer.html', {'movie': movie})