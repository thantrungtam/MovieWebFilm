# Generated by Django 5.2 on 2025-04-09 05:57

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('movies', '0006_movie_streaming_link_alter_movie_video_link'),
    ]

    operations = [
        migrations.AddField(
            model_name='movie',
            name='youtube_embed_url',
            field=models.URLField(blank=True, null=True),
        ),
    ]
