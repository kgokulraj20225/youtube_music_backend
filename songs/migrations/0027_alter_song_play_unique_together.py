# Generated by Django 5.0.3 on 2025-07-17 15:09

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('songs', '0026_alter_song_play_unique_together'),
    ]

    operations = [
        migrations.AlterUniqueTogether(
            name='song_play',
            unique_together=set(),
        ),
    ]
