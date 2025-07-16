from django.urls import path,include
from .views import *
from drf_spectacular.views import SpectacularAPIView, SpectacularRedocView, SpectacularSwaggerView

urlpatterns=[
    path('api/schema/', SpectacularAPIView.as_view(), name='schema'),
    # Optional UI:
    path('api/schema/swagger-ui/', SpectacularSwaggerView.as_view(url_name='schema'), name='swagger-ui'),
    path('api/schema/redoc/', SpectacularRedocView.as_view(url_name='schema'), name='redoc'),
    path('songs_views/',songs_views.as_view()),
    path('songs_edit_view/<int:pk>/',songs_edit_view.as_view()),
    path('artist_views/',artist_views.as_view()),
    path('album_views/',album_views.as_view()),
    path('playlist_views/',playlist_views.as_view()),
    path('history_views/',history_views.as_view()),
    path('history_viewss/<int:pk>/',history_viewss.as_view()),
    path('calcuate_user_playback/',calcuate_user_playback.as_view()),
    path('queue_views/',queue_views.as_view()), 
    path('genre_views/', genre_views.as_view({'get': 'list', 'post': 'create'})),
    path('genre_views/<int:pk>/', genre_views.as_view({'get': 'retrieve', 'put': 'update', 'delete': 'destroy'})),
    path("like_views/",like_views.as_view()),
    path("like_viewss/<int:pk>/",like_viewss.as_view()),
    path("user_add_like/",user_add_like.as_view()),
    path("user_remove_like/",user_remove_like.as_view()),
    path("demo_queue/",demo_queue.as_view()),
    path("user_individual_history/",user_individual_history.as_view()),
    path("get_genre_songs/",get_genre_songs.as_view()),
    path("get_artist_songs/",get_artist_songs.as_view()),
    path("blocked_songs/",blocked_songs.as_view()),
    path("unblock_songs/",unblock_songs.as_view()),
    path("get_song_with_block/",get_song_without_block.as_view()),
]