from datetime import timedelta
from django.db import models
from django.core.validators import FileExtensionValidator
from mutagen.mp3 import MP3
from User_Accounts.models import UserProfile
from django.utils.timezone import now
from django.db.models import Max



# Create your models here.

class Artist(models.Model):
    artiest_name= models.CharField(max_length=20)
    artist_bio=models.TextField(blank=True)
    artist_image=models.FileField(upload_to='artist_img/',blank=True)
    country=models.CharField(max_length=30,blank=True)


    def __str__(self):
        return self.artiest_name
    

class Genre(models.Model):
    genre=models.CharField(max_length=40,default="melody")
    description=models.TextField()

    def __str__(self):
        return self.genre
    


    
class Songs(models.Model):
    artists=models.ManyToManyField(Artist,related_name="songs_artist")
    genre=models.ManyToManyField(Genre,related_name='songs_genre')
    title =models.CharField(max_length=40)
    duration=models.DurationField(blank=True,null=True)
    release_date=models.DateTimeField(blank=True,null=True)
    songs = models.FileField(upload_to='songs/',validators=[FileExtensionValidator(allowed_extensions=['mp3'])])
    cover_image=models.ImageField(upload_to='songs_img/')
    lyrics=models.TextField(blank=True)
    language=models.CharField(max_length=20)
    views=models.PositiveBigIntegerField(blank=True,null=True)
    likes_count=models.PositiveBigIntegerField(blank=True,null=True)

    def __str__(self):
        return self.title
    
    def save(self, *args, **kwargs):
        if self.songs:
            audio = MP3(self.songs)
            self.duration = timedelta(seconds=int(audio.info.length))
        super().save(*args, **kwargs)


class Album(models.Model):
    artist=models.ManyToManyField(Artist,related_name="album_aritist")
    songs=models.ManyToManyField(Songs,related_name="album_songs")
    title=models.CharField(max_length=20)
    cover_image=models.FileField(upload_to='album_image/')
    description=models.TextField(blank=True)

    def __str__(self):
        return self.title


class Playlist(models.Model):
    user=models.ForeignKey(UserProfile,related_name="playlist_user",on_delete=models.CASCADE)
    songs=models.ManyToManyField(Songs,related_name="playlist_songs")
    playlist_name= models.CharField(max_length=30)
    description=models.TextField(null=True,blank=True)
    created_at= models.DateTimeField(auto_now_add=True)
    is_public=models.BooleanField(default=True)

    def __str__(self):
        return self.playlist_name
    

class History(models.Model):
    user=models.ForeignKey(UserProfile,related_name='history_user',on_delete=models.CASCADE)
    song=models.ForeignKey(Songs,related_name='histroy_song',on_delete=models.CASCADE)
    played_at=models.DateTimeField(auto_now_add=True)

    class Meta:
        ordering=['-played_at']

    def __str__(self):
        return f'{self.user.user_name} played{self.song.songs}'
    

class Playback(models.Model):
    user=models.ForeignKey(UserProfile,related_name="playback_user",on_delete=models.CASCADE)
    song=models.ForeignKey(Songs,related_name="playback_user",on_delete=models.CASCADE)
    play_at=models.DateTimeField(auto_now_add=True)
    duration_played=models.DurationField()

    def __str__(self):
        return f'{self.user.user_name} song name {self.song.songs} played duration {self.duration_played}'
    

class Queue(models.Model):
    user=models.ForeignKey(UserProfile,related_name="queue_user",on_delete=models.CASCADE)
    song =models.ForeignKey(Songs,related_name="queue_song",on_delete=models.CASCADE)
    added_at= models.DateTimeField(auto_now_add=True)
    position= models.IntegerField(blank=True,null=True)

    def save(self, *args, **kwargs):
        if self.position is None:
            last_position = Queue.objects.filter(user=self.user).aggregate(Max('position'))['position__max'] or 0
            self.position = last_position + 1
        super().save(*args, **kwargs)

    def __str__(self):
        return f"{self.user} - {self.song} (Position {self.position})"

    def __int__(self):
        return self.song.id
    
class Like(models.Model):
    user=models.ForeignKey(UserProfile,related_name="like_user",on_delete=models.CASCADE)
    song=models.ForeignKey(Songs,related_name="like_song",on_delete=models.CASCADE)
    like_at=models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f'user name {self.user.user_name}  song name{self.song.title}'
    
    class Meta:
        unique_together = ('user', 'song')

    





    



        








    
