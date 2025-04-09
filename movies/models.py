from django.db import models
from django.core.validators import MinValueValidator, MaxValueValidator
from django.utils import timezone

class Genre(models.Model):
    name = models.CharField(max_length=50, unique=True)

    def __str__(self):
        return self.name

class Movie(models.Model):
    title = models.CharField(max_length=200)
    description = models.TextField()
    release_date = models.DateField()
    genres = models.ManyToManyField(Genre)
    video_link = models.URLField(null=True, blank=True)
    streaming_link = models.URLField(null=True, blank=True)
    video_file = models.FileField(upload_to='videos/', null=True, blank=True) # them
    thumbnail = models.ImageField(upload_to='movie_thumbnails/')
    views = models.IntegerField(default=0)  # Track the number of views
    created_at = models.DateTimeField(auto_now_add=True)  # Track when the movie was added
    # trailer = models.URLField()
    trailer_file = models.FileField(upload_to='trailers/', null=True, blank=True)
    trailer_link = models.URLField(null=True, blank=True)
    youtube_embed_url = models.URLField(blank=True, null=True)


    def get_like_count(self):
        return self.like_set.count()
    
    def get_average_rating(self):
        ratings = self.rating_set.all()
        if ratings.exists():
            return sum(rating.value for rating in ratings) / ratings.count()
        return 0
    
    def get_comments(self):
        return self.comment_set.all()

    def update_average_rating(self):
        self.average_rating = self.get_average_rating()
        self.save()

    def __str__(self):
        return self.title
