# Generated by Django 5.0.3 on 2025-07-05 17:22

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('User_Accounts', '0009_rename_display_name_userprofile_user_name_and_more'),
        ('songs', '0010_playback'),
    ]

    operations = [
        migrations.CreateModel(
            name='Queue',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('added_at', models.DateTimeField(auto_now_add=True)),
                ('position', models.IntegerField()),
                ('song', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='queue_song', to='songs.songs')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='queue_user', to='User_Accounts.userprofile')),
            ],
        ),
    ]
