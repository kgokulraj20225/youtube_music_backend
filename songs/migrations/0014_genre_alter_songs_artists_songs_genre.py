# Generated by Django 5.0.3 on 2025-07-07 06:13

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('songs', '0013_alter_queue_position'),
    ]

    operations = [
        migrations.CreateModel(
            name='Genre',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('genre', models.CharField(default='melody', max_length=40)),
                ('description', models.TextField()),
            ],
        ),
        migrations.AlterField(
            model_name='songs',
            name='artists',
            field=models.ManyToManyField(related_name='songs_artist', to='songs.artist'),
        ),
        migrations.AddField(
            model_name='songs',
            name='genre',
            field=models.ManyToManyField(related_name='songs_genre', to='songs.genre'),
        ),
    ]
