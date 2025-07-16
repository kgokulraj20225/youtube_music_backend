from django.contrib import admin
from .models import *
# Register your models here.

# class artistinline(admin.TabularInline):
#     model = Aritist

# class songsadmin(admin.ModelAdmin):
#     inlines=[
#         artistinline
#     ]

class songsinline(admin.TabularInline):
    model=Queue

class queueadmin(admin.ModelAdmin):
    inlines=[
        songsinline
    ]
    

admin.site.register(Songs,queueadmin)
admin.site.register(Artist)
admin.site.register(Album)
admin.site.register(Playlist)
admin.site.register(History)
admin.site.register(Playback)
admin.site.register(Queue)
admin.site.register(Genre)
admin.site.register(Like)
admin.site.register(Block_songs)


