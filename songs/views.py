from django.shortcuts import render
from rest_framework import status # type: ignore
from rest_framework.decorators import api_view
from rest_framework.response import Response 
from .models import *
from User_Accounts.models import UserProfile
from .serializers import *
from django.http import Http404, JsonResponse
from django.views.decorators.csrf import csrf_exempt
from rest_framework.views import APIView # type: ignore
from rest_framework.response import Response
from django.http import HttpResponse
from rest_framework.permissions import IsAuthenticated
from rest_framework.authentication import TokenAuthentication
from rest_framework import status,generics,viewsets
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework_simplejwt.tokens import RefreshToken
from rest_framework.permissions import AllowAny, IsAuthenticated
from django.shortcuts import get_object_or_404
from django.db.models import Q
from django.views.generic import ListView
from django.utils import timezone
from datetime import timedelta
from .models import Songs,Playback
from django.db.models import Max
from django.db.models import F


# Create your views here.
# all song crud part
class songs_views(generics.ListCreateAPIView):
    queryset=Songs.objects.all()
    serializer_class=songsSerilaizer

class songs_edit_view(generics.RetrieveUpdateDestroyAPIView):
    queryset=Songs.objects.all()
    serializer_class=songsSerilaizer

# all genre crud part

class genre_views(viewsets.ModelViewSet):
    queryset=Genre.objects.all()
    serializer_class=genreSerializer



class artist_views(generics.ListCreateAPIView):
    queryset=Artist.objects.all()
    serializer_class=artistSerializer

class album_views(generics.ListCreateAPIView):
    queryset=Album.objects.all()
    serializer_class=albumSerializer

class playlist_views(generics.ListCreateAPIView):
    queryset=Playlist.objects.all()
    serializer_class=playlistSerializer


class history_views(generics.ListCreateAPIView):
    queryset=History.objects.all()
    serializer_class=user_historySerializer


class calcuate_user_playback(APIView):
    permission_classes = [AllowAny]  # ensure user is logged in
    
# from rest_framework.views import APIView
# from rest_framework.response import Response
# from rest_framework import status
# from datetime import timedelta

# from .models import Playback, Songs
# from User_Accounts.models import UserProfile
# from .serializers import user_playbackSerializer

class calcuate_user_playback(APIView):

    def post(self, request):
        user_id = request.data.get("user")
        song_id = request.data.get("song_id")
        duration_seconds = request.data.get("duration_seconds")

        if not user_id or not song_id or not duration_seconds:
            return Response({"error": "user, song_id, and duration_seconds are required"}, status=status.HTTP_400_BAD_REQUEST)

        try:
            user_profile = UserProfile.objects.get(id=user_id)
        except UserProfile.DoesNotExist:
            return Response({"error": "UserProfile not found"}, status=status.HTTP_404_NOT_FOUND)

        try:
            song = Songs.objects.get(id=song_id)
        except Songs.DoesNotExist:
            return Response({"error": "Song not found"}, status=status.HTTP_404_NOT_FOUND)

        duration = timedelta(seconds=int(duration_seconds))



        playback = Playback.objects.create(
            user=user_profile,
            song=song,
            duration_played=duration
        )

        serializer = user_playbackSerializer(playback)
        return Response(serializer.data, status=status.HTTP_201_CREATED)


    def get(self,request):
        queryset=Playback.objects.all()
        serializer=user_playbackSerializer(queryset,many=True)
        return Response(serializer.data,status=status.HTTP_200_OK)
    

class queue_views(APIView):

    def post(self,request):
        user=request.data.get("user")
        song_id=request.data.get("song_id")
        


        try:
            main_user=UserProfile.objects.get(id=user)
        except UserProfile.DoesNotExist:
            return Response ({'error':'no user'})
        

        try:
            main_song=Songs.objects.get(id=song_id)
        except Songs.DoesNotExist:
            return Response ({'error':'no songs'})
        
        old_position= Queue.objects.filter(user=main_user).aggregate(Max('position'))['position__max'] or 0
        new_position=old_position+1

        queues=Queue.objects.create(
            user=main_user,
            song=main_song,
            position=new_position
        )

        serializer=queueSerializer(queues)
        return Response(serializer.data,status=status.HTTP_201_CREATED)
    
    def get(self,request):
        queryset=Queue.objects.filter(position__gte=7)
        serializer=queueSerializer(queryset,many=True)
        return Response(serializer.data,status=status.HTTP_200_OK)
    
# like full crud part
class like_views(generics.ListCreateAPIView):
    queryset=Like.objects.all()
    serializer_class=likeSerializer

class like_viewss(generics.RetrieveUpdateDestroyAPIView):
    queryset=Like.objects.all()
    serializer_class=likeSerializer

class user_add_like(APIView):

    def post(self, request):
        user_id = request.data.get('user')
        song_id = request.data.get('song')

        try:
            song = Songs.objects.get(id=song_id)
        except Songs.DoesNotExist:
            return Response({'error': 'Song not found'}, status=404)

        try:
            user = UserProfile.objects.get(id=user_id)
        except UserProfile.DoesNotExist:
            return Response({'error': 'User not found'}, status=404)

        if Like.objects.filter(user=user, song=song).exists():
            return Response({'message': 'Already liked'}, status=400)

        Like.objects.create(user=user, song=song)
        song.likes_count += 1
        song.save()

        return Response({'message': 'Song liked'}, status=201)


class user_remove_like(APIView):

    def post(self,request):
        uid=request.data.get("user_id")
        sid=request.data.get("song_id")

        try:
            song=Songs.objects.get(id=sid)
        except Songs.DoesNotExist:
            return Response({"message":"song not found"})
        
        try:
            user=UserProfile.objects.get(id=uid)
        except UserProfile.DoesNotExist:
            return Response({"message":"user not found"})
        
        like=Like.objects.filter(user=user,song=song)
         
        if like.exists():
            like.delete()
            if song.likes_count>0:
                song.likes_count -=1
                song.save()

        return Response({'message': 'Song dislike'}, status=200)
        
        


        

            
