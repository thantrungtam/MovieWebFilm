from django.contrib import admin
from django import forms
from .models import Movie, Genre, Episode
from actor.models import Actor

class ActorInline(admin.TabularInline):
    model = Movie.actors.through
    verbose_name = "Diễn viên"
    verbose_name_plural = "Danh sách diễn viên"
    extra = 1

class EpisodeInline(admin.TabularInline):
    model = Episode
    verbose_name = "Tập phim"
    verbose_name_plural = "Danh sách các tập"
    extra = 1
    fields = ('episode_number', 'title', 'video_file', 'video_link', 'streaming_link', 'thumbnail', 'duration')

@admin.register(Movie)
class MovieAdmin(admin.ModelAdmin):
    list_display = ('title', 'release_date', 'is_premium', 'movie_type', 'screening_schedule')
    search_fields = ('title', 'description')
    list_filter = ('genres', 'release_date', 'is_premium', 'movie_type')
    filter_horizontal = ('genres',)  # Keep genres as horizontal filter
    inlines = [ActorInline, EpisodeInline]

    # fields = ('title', 'description', 'thumbnail', 'video_file', 'release_date', 'genres', 'trailer_file', 'trailer_link')  # thêm dòng này
    fieldsets = (
        (None, {
            'fields': ('title', 'description', 'genres', 'release_date', 'thumbnail', 'is_premium', 'movie_type')
        }),
        ('Nguồn phim', {
            'fields': ('video_file', 'streaming_link'),
            'description': 'Chọn 1 trong 2: tải file phim lên hoặc nhập link stream từ API.'
        }),
        ('Lịch chiếu', {
            'fields': ('screening_schedule',),
            'description': 'Thời gian chiếu phim (để trống nếu không có lịch chiếu).'
        }),
        ('Khác', {
            'fields': ('trailer_file', 'trailer_link', 'youtube_embed_url')
        }),
    )
    
    def get_exclude(self, request, obj=None):
        # Exclude actors field from the form as we're using the inline
        return ['actors']

@admin.register(Genre)
class GenreAdmin(admin.ModelAdmin):
    list_display = ('name',)

@admin.register(Episode)
class EpisodeAdmin(admin.ModelAdmin):
    list_display = ('movie', 'episode_number', 'title', 'duration')
    list_filter = ('movie',)
    search_fields = ('title', 'movie__title')
    fields = ('movie', 'episode_number', 'title', 'description', 'video_file', 'video_link', 'streaming_link', 'thumbnail', 'duration')




