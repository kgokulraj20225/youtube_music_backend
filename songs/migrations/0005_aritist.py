# Generated by Django 5.0.3 on 2025-07-04 07:21

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('songs', '0004_songs_duration'),
    ]

    operations = [
        migrations.CreateModel(
            name='Aritist',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('artiest_name', models.CharField(max_length=20)),
                ('artist_bio', models.TextField()),
                ('artist_image', models.FileField(upload_to='artist_img/')),
                ('country', models.CharField(max_length=30)),
                ('songs', models.ManyToManyField(related_name='songs_aritist', to='songs.songs')),
            ],
        ),
    ]
