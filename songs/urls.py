from django.urls import path,include
from .views import *

urlpatterns=[
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
    
]