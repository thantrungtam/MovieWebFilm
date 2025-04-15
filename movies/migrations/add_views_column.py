from django.db import migrations, models

class Migration(migrations.Migration):

    dependencies = [
        ('movies', '0010_delete_actor_movie_actors'),
    ]

    operations = [
        migrations.AddField(
            model_name='movie',
            name='views',
            field=models.IntegerField(default=0),
        ),
    ] 