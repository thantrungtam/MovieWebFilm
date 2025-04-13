from django.db import models
from django.urls import reverse
from django.utils.text import slugify

# Create your models here.

class Actor(models.Model):
    GENDER_CHOICES = [
        ('Male', 'Nam'),
        ('Female', 'Nữ'),
        ('Other', 'Khác'),
    ]
    
    name = models.CharField(max_length=100, verbose_name="Tên")
    birthdate = models.DateField(verbose_name="Ngày sinh")
    biography = models.TextField(blank=True, verbose_name="Tiểu sử")
    alternate_name = models.CharField(max_length=100, blank=True, verbose_name="Tên khác")
    introduction = models.TextField(blank=True, verbose_name="Giới thiệu")
    gender = models.CharField(max_length=10, choices=GENDER_CHOICES, blank=True, verbose_name="Giới tính")
    image = models.ImageField(upload_to='actor_images/', null=True, blank=True, verbose_name="Hình ảnh")
    
    class Meta:
        verbose_name = "Diễn viên"
        verbose_name_plural = "Diễn viên"
        ordering = ['name']
    
    def __str__(self):
        return self.name
        
    def get_absolute_url(self):
        return reverse('actor_detail', kwargs={'pk': self.pk})
    
    def get_movie_count(self):
        return self.movies.count()
    get_movie_count.short_description = "Số phim đã tham gia"
    
    def get_age(self):
        from datetime import date
        today = date.today()
        born = self.birthdate
        age = today.year - born.year - ((today.month, today.day) < (born.month, born.day))
        return age
    get_age.short_description = "Tuổi"
    
    def save(self, *args, **kwargs):
        # Ensure alternate_name is not empty for searching
        if not self.alternate_name:
            self.alternate_name = self.name
        super().save(*args, **kwargs)
