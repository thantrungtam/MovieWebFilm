from django.contrib import admin
from .models import Movie, Genre

@admin.register(Movie)
class MovieAdmin(admin.ModelAdmin):
    list_display = ('title', 'release_date')
    search_fields = ('title', 'description')
    list_filter = ('genres', 'release_date')

    # fields = ('title', 'description', 'thumbnail', 'video_file', 'release_date', 'genres', 'trailer_file', 'trailer_link')  # thêm dòng này
    fieldsets = (
        (None, {
            'fields': ('title', 'description', 'genres', 'release_date', 'thumbnail')
        }),
        ('Nguồn phim', {
            'fields': ('video_file', 'streaming_link'),
            'description': 'Chọn 1 trong 2: tải file phim lên hoặc nhập link stream từ API.'
        }),
        ('Khác', {
            'fields': ('trailer_file', 'trailer_link', 'youtube_embed_url')
        }),
    )

@admin.register(Genre)
class GenreAdmin(admin.ModelAdmin):
    list_display = ('name',)


