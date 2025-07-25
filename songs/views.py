from datetime import timedelta

from django.db.models import F, Max, Q
from django.http import Http404, HttpResponse, JsonResponse
from django.shortcuts import get_object_or_404, render
from django.utils import timezone
from django.views.decorators.csrf import csrf_exempt
from django.views.generic import ListView
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import status  # type: ignore
from rest_framework import filters, generics, pagination, viewsets
from rest_framework.authentication import (SessionAuthentication,
                                           TokenAuthentication)
from rest_framework.decorators import api_view
from rest_framework.pagination import (LimitOffsetPagination,
                                       PageNumberPagination)
from rest_framework.permissions import *
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.views import APIView  # type: ignore
from rest_framework_simplejwt.tokens import RefreshToken

from User_Accounts.models import UserProfile

from .filters import *
from .models import *
from .models import Playback, Songs
from .serializers import *


# Create your views here.
# all song crud part
class songs_views(generics.ListCreateAPIView):
    permission_classes=[DjangoModelPermissions]
    # authentication_classes=[JWTAuthentication]
     
    queryset=Songs.objects.prefetch_related('artists','genre').order_by('pk')
    serializer_class=songsSerilaizer
    filter_backends=[DjangoFilterBackend,
                     filters.SearchFilter,
                     filters.OrderingFilter
                     ]
    search_fields=['title','=artists__artiest_name','=genre__genre']
    ordering_fields=('title','id')
    filterset_class=artist
    pagination_class=PageNumberPagination
    pagination_class.page_size=6
    pagination_class.page_size_query_param='size'
    pagination_class.max_page_size=4



class songs_edit_view(generics.RetrieveUpdateDestroyAPIView):
    queryset=Songs.objects.all()
    serializer_class=songsSerilaizer


# song_play count all code

class song_views(APIView):
    def post(self,request):
        songs_id=request.data.get('song_id')

        try:
            song=Songs.objects.get(id=songs_id)
        except Songs.DoesNotExist:
            return Response({"err":"the song not found"})
        
        if song:
            song.views+=1
            song.save()
            return Response({"message":"views count increase successfully"})

class song_view_count(APIView):
    def post(self,request):
        user_id=request.data.get("user_id")
        song_id=request.data.get("song_id")

        try:
            user=UserProfile.objects.get(id=user_id)
            song=Songs.objects.get(id=song_id)
        except UserProfile.DoesNotExist and Songs.DoesNotExist:
            return Response({"err":"the user or song not found"})
        
        one_minute=timezone.now()-timedelta(minutes=1)

        song_play=Song_play.objects.filter(
            user=user,
            song=song,
            play_at__gte=one_minute
        ).exists()
        if song_play:
            return Response({"message":"the views add already"})
        
        Song_play.objects.create(user=user,song=song)

        if song.views is None:
            song.views=0


        song.views =song.views+1
        song.save()
        return Response({"message":"views add successfully"},200)

    

    
    def get(self,request):
        song=Song_play.objects.all()
        serializer=song_playSerializer(song,many=True)
        return Response(serializer.data,200)




# all genre crud part

class genre_views(viewsets.ModelViewSet):
    queryset=Genre.objects.all()
    serializer_class=genreSerializer



class artist_views(generics.ListCreateAPIView):
    queryset=Artist.objects.all()
    serializer_class=artistSerializer

class album_views(generics.ListCreateAPIView):
    queryset=Album.objects.prefetch_related(
        "songs__artists",
        "songs__genre",
        # "artist",
        
    ).all()
    serializer_class=albumSerializer

class playlist_views(generics.ListCreateAPIView):
    authentication_classes=[TokenAuthentication]
    permission_classes=[IsAuthenticated]
    queryset=Playlist.objects.select_related("user").prefetch_related("songs__artists","songs__genre")
    serializer_class=playlistsSerializer


class history_views(generics.ListCreateAPIView):
    queryset=History.objects.select_related("user","song")
    serializer_class=user_historySerializer

class history_viewss(generics.RetrieveUpdateDestroyAPIView):
    queryset=History.objects.select_related('song','user').all()
    serializer_class=user_historySerializer


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
        queryset=Playback.objects.select_related("user","song")
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
        queryset=Queue.objects.select_related("user","song").order_by('position')
        serializer=queueSerializer(queryset,many=True)
        return Response(serializer.data,status=status.HTTP_200_OK)


class demo_queaue(APIView):
    def post(self,request):
        user=request.data.get('user_id')
        # next_songs=request.data.get('next_songs')
        current_songs=request.data.get('cur_song')


        try:
            users=UserProfile.objects.get(id=user)
            # next_songss=Songs.objects.get(id=next_songs)
            current_songss=Songs.objects.get(id=current_songs)
        
        except (UserProfile.DoesNotExist,Songs.DoesNotExist):
            return Response({"message":"the error found in the song,user"})
        
        try:
            nextt=Queue.objects.get(user=users,song=current_songss)
            
        except Queue.DoesNotExist:
            return Response({"message":"the error fosgjgund in the song,user"})
        

        current_position=nextt.position

        # Queue.objects.filter(user=user,position__gt=current_position).update(position=F('position')+1)
        querysets=Queue.objects.filter(user=user,position__gt=current_position)

        for obj in querysets:
            obj.position+=1
            obj.save()



        # queue_item,created=Queue.objects.get_or_create(
        #     user=user,
        #     song=next_songss,
        #     defaults={'position': current_position + 1}
        # )

        # if not created:
        #     # If already in queue, just update its position
        #     queue_item.position = current_position + 1
        #     queue_item.save()

        serializer = queueSerializer(querysets,many=True)
        return Response(serializer.data,201)
    

class demo_queue(APIView):
    def post(self, request):
        user_id = request.data.get("user_id")
        next_song_id = request.data.get("song_id")  # Song to play next
        current_song_id = request.data.get("current_song_id")  # Currently playing song

        try:
            user = UserProfile.objects.get(id=user_id)
            next_song = Songs.objects.get(id=next_song_id)
            current_song = Songs.objects.get(id=current_song_id)
        except (UserProfile.DoesNotExist, Songs.DoesNotExist):
            return Response({"error": "User or song not found"}, status=404)

        try:
            current_queue_item = Queue.objects.get(user=user, song=current_song)
        except Queue.DoesNotExist:
            return Response({"error": "Current song not in queue"}, status=404)
        

        current_position = current_queue_item.position

        # Step 1: Shift all songs after current_position by +1
        Queue.objects.filter(user=user, position__gt=current_position).update(position=F('position') + 1)

        # Step 2: Insert new song at position current_position + 1
        queue_item, created = Queue.objects.get_or_create(
            user=user,
            song=next_song,
            defaults={'position': current_position + 1}
        )

        if not created:
            # If already in queue, just update its position
            queue_item.position = current_position + 1
            queue_item.save()

        return Response({"message": "Song scheduled to play next"}, status=201)

    
# like full crud part
class like_views(generics.ListCreateAPIView):
    queryset=Like.objects.select_related("user","song")
    serializer_class=likeSerializer

class like_viewss(generics.RetrieveUpdateDestroyAPIView):
    queryset=Like.objects.select_related("user","song")
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


        



class user_individual_history(generics.ListAPIView):
    permission_classes=[IsAuthenticated]
    authentication_classes=[SessionAuthentication]
    serializer_class=user_historySerializer

    def get_queryset(self):
        song =2
        user=1
        return History.objects.filter(song=song,user=user).select_related('user', 'song')
    
    # def get_queryset(self):
    #     user = self.request.user
    #     try:
    #         user_profile = UserProfile.objects.get(user=user)
    #     except UserProfile.DoesNotExist:
    #         return History.objects.none()  # or raise an appropriate exception
    #     return History.objects.filter(user=user_profile).select_related('user', 'song')


    
class get_genre_songs(APIView):

    def get(self,request):
        genres=request.query_params.get('genre')

        if not genres:
            return Response({"error":"not genre"})
        
        songs=Songs.objects.filter(genre=genres)
        serializer=songsSerilaizer(songs,many=True)
        return Response(serializer.data,200)


class get_artist_songs(generics.ListAPIView):
    queryset=Songs.objects.prefetch_related('artists')
    serializer_class =songsSerilaizer
    filterset_class=artist

class blocked_songs(APIView):
    def post(self,request):
        song_id=request.data.get('song_id')
        user_id=request.data.get('user_id')

        if Block_songs.objects.filter(user=user_id,song=song_id).exists():
            return Response({"message":"this songs already blocked"},200)
        
        try:
            song=Songs.objects.get(id=song_id)
            user=UserProfile.objects.get(id=user_id)
            Block_songs.objects.get_or_create(user=user,song=song)
            return Response({"message":"the songs blocked successfully"})
        except UserProfile.DoesNotExist and Songs.DoesNotExist:
            return Response({"message":"the user and songs not found"})
        
    def get(self,request):
        blockedsong=Block_songs.objects.filter(user=1)
        serializer=blocked_songsSerializer(blockedsong,many=True)
        return Response(serializer.data,200)
    
class unblock_songs(APIView):
    def post(self,request):
        user_id=request.data.get("user_id")
        song_id=request.data.get("song_id")

        try:
            user=UserProfile.objects.get(id=user_id)
            song=Songs.objects.get(id=song_id)
        except Songs.DoesNotExist:
            return Response({"error":"the song found"},400)
        except UserProfile.DoesNotExist:
            return Response({"error":"the user found"},400)
        
        unblock=Block_songs.objects.filter(user=user,song=song)

        if unblock.exists():
            unblock.delete()
            return Response({"message":"this song unblock successfully"},200)
        else:
            return Response({"message":"this song not blocked"},400)

class get_song_without_block(APIView):
    def get(self,request):
        blockeds_song=Block_songs.objects.filter(user=1).values_list("song",flat=True)
        songs=Songs.objects.exclude(id__in=blockeds_song)
        serializer=songssSerializer(songs,many=True)
        return Response(serializer.data,200)
    

    
 