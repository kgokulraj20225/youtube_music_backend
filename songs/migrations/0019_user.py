# Generated by Django 5.0.3 on 2025-07-13 10:34

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('songs', '0018_alter_like_unique_together_and_more'),
    ]

    operations = [
        migrations.CreateModel(
            name='user',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('liked_songs', models.ManyToManyField(related_name='liked_songs', to='songs.songs')),
            ],
        ),
    ]
