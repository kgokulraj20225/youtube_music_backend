from rest_framework import serializers
from .models import *
from User_Accounts.serializers import *
from User_Accounts.models import *

class artistSerializer(serializers.ModelSerializer):
    class Meta:
        model=Artist
        fields="__all__"


class genreSerializer(serializers.ModelSerializer):
    class Meta:
        model=Genre
        fields='__all__'


class songsSerilaizer(serializers.ModelSerializer):
    artists=artistSerializer(many=True,read_only=True)
    artist_id=serializers.PrimaryKeyRelatedField(
        queryset=Artist.objects.all(),
        many=True,
        write_only=True,
        source='artists'
    )
    genre=genreSerializer(many=True,read_only=True)
    genre_id=serializers.PrimaryKeyRelatedField(
        queryset=Genre.objects.all(),
        many=True,
        write_only=True,
        source='genre'
    )
    class Meta:
        model = Songs
        fields='__all__'


class songssSerializer(serializers.ModelSerializer):
    class Meta:
        model=Songs
        fields=['title','id','cover_image']

class user_only(serializers.ModelSerializer):
    class Meta:
        model=UserProfile
        fields=['id','user_name','gmail']

class albumSerializer(serializers.ModelSerializer):
    songs=songsSerilaizer(many=True,read_only=True)
    
    song_id=serializers.PrimaryKeyRelatedField(
        queryset=Songs.objects.all(),
        many=True,
        write_only=True,
        source='songs'
    )
    class Meta:
        model = Album
        fields='__all__'


class playlistSerializer(serializers.ModelSerializer):
    # user=User_accountSerializer(read_only=True)
    songs=songsSerilaizer(many=True,read_only=True)
    # user_id=serializers.PrimaryKeyRelatedField(
    #     queryset=UserProfile.objects.all(),
    #     many=True,
    #     write_only=True,
    #     source='user'
    # )
    song_id=serializers.PrimaryKeyRelatedField(
        queryset=Songs.objects.all(),
        many=True,
        write_only=True,
        source='songs'
    )
    class Meta:
        model = Playlist
        fields=["songs","playlist_name","description","created_at","song_id"]


class playlistsSerializer(serializers.ModelSerializer):
    user=user_data_only(read_only=True)
    songs=songsSerilaizer(many=True,read_only=True)
    user_id=serializers.PrimaryKeyRelatedField(
        queryset=UserProfile.objects.all(),
        write_only=True,
        source='user'
    )
    song_id=serializers.PrimaryKeyRelatedField(
        queryset=Songs.objects.all(),
        many=True,
        write_only=True,
        source='songs'
    )
    class Meta:
        model = Playlist
        fields=["user","songs","playlist_name","description","created_at","song_id","user_id"]


class user_historySerializer(serializers.ModelSerializer):
    song=songssSerializer(read_only=True)
    song_id=serializers.PrimaryKeyRelatedField(
        queryset=Songs.objects.all(),
        write_only=True,
        source="song"
    )
    user=user_only(read_only=True)
    user_id=serializers.PrimaryKeyRelatedField(
        queryset=UserProfile.objects.all(),
        write_only=True,
        source="user"
    )

    class Meta:
        model=History
        fields="__all__"

class user_playbackSerializer(serializers.ModelSerializer):
    song=songssSerializer()
    class Meta:
        model = Playback
        fields="__all__"       



class queueSerializer(serializers.ModelSerializer):
    song=songssSerializer()
    user=user_only()
    class Meta:
        model=Queue
        fields="__all__" 


class likeSerializer(serializers.ModelSerializer):
    song=songssSerializer(read_only=True)
    song_id=serializers.PrimaryKeyRelatedField(
        queryset=Songs.objects.all(),
        write_only=True,
        source="song"
    )
    user=user_only(read_only=True)
    user_id=serializers.PrimaryKeyRelatedField(
        queryset=UserProfile.objects.all(),
        write_only=True,
        source="user"
    )
    class Meta:
        model=Like
        fields='__all__'

class blocked_songsSerializer(serializers.ModelSerializer):
    class Meta:
        model=Block_songs
        fields='__all__'

    




