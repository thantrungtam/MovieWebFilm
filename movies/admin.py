from django.contrib import admin
from django import forms
from .models import Movie, Genre
from actor.models import Actor

class ActorInline(admin.TabularInline):
    model = Movie.actors.through
    verbose_name = "Diễn viên"
    verbose_name_plural = "Danh sách diễn viên"
    extra = 1

@admin.register(Movie)
class MovieAdmin(admin.ModelAdmin):
    list_display = ('title', 'release_date', 'is_premium')
    search_fields = ('title', 'description')
    list_filter = ('genres', 'release_date', 'is_premium')
    filter_horizontal = ('genres',)  # Keep genres as horizontal filter
    inlines = [ActorInline]

    # fields = ('title', 'description', 'thumbnail', 'video_file', 'release_date', 'genres', 'trailer_file', 'trailer_link')  # thêm dòng này
    fieldsets = (
        (None, {
            'fields': ('title', 'description', 'genres', 'release_date', 'thumbnail', 'is_premium')
        }),
        ('Nguồn phim', {
            'fields': ('video_file', 'streaming_link'),
            'description': 'Chọn 1 trong 2: tải file phim lên hoặc nhập link stream từ API.'
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




