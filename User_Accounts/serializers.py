from rest_framework import serializers
from .models import UserProfile

def get_playlist_serializer():
    from songs.serializers import playlistSerializer
    return playlistSerializer

class User_accountSerializer(serializers.ModelSerializer):
    playlist_user=serializers.SerializerMethodField()
    class Meta:
        model = UserProfile
        fields = '__all__'
        

    def get_playlist_user(self,obj):
        playlistserializer=get_playlist_serializer()
        playlist=obj.playlist_user.all()
        return playlistserializer(playlist,many=True).data

    def validate_phone_number(self, value):
        # value is a string or None
        if value:
            if not value.isdigit():
                raise serializers.ValidationError("Phone number must contain only digits.")
            if len(value) != 10:
                raise serializers.ValidationError("Phone number must be exactly 10 digits.")
        return value
    

class user_data_only(serializers.ModelSerializer):
    class Meta:
        model=UserProfile
        fields='__all__'
