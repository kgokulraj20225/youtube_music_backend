from django.db.models import Q
from django.http import Http404, HttpResponse, JsonResponse
from django.shortcuts import get_object_or_404, render
from django.views.decorators.csrf import csrf_exempt
from django.views.generic import ListView
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import status  # type: ignore
from rest_framework import generics
from rest_framework.authentication import TokenAuthentication
from rest_framework.decorators import api_view
from rest_framework.permissions import AllowAny, IsAuthenticated
from rest_framework.response import Response
from rest_framework.views import APIView  # type: ignore
from rest_framework_simplejwt.tokens import RefreshToken

from .models import *
from .serializers import *

# Create your views here.


class user_post_get(generics.ListCreateAPIView):
    queryset=UserProfile.objects.all()
    serializer_class=User_accountSerializer
    # filter_backends = [DjangoFilterBackend]
    filterset_fields=['user_name']



class user_auth_login(APIView):
    permission_classes=[AllowAny]

    def post(self,request):
        user_name=request.data.get('user_name')
        gmail=request.data.get('gmail')

        if not user_name or not gmail:
            return Response({"message":"please provid the user name and gmail"},404)
        
        user=UserProfile.objects.filter(user_name=user_name,gmail=gmail).first()

        if not user:
            return Response({"message":"Invalid credentials"})
        
        refresh=RefreshToken.for_user(user)
        return Response({
            'refresh':str(refresh),
            'access':str(refresh.access_token),
        },status=status.HTTP_200_OK)
    
class user_auth_logout(APIView):
    permission_classes=[IsAuthenticated]

    def post(self,requst):
        try:
            requst.user.auth_token.delete()
        except AttributeError:
            pass

        return Response({"success":"logged out successfully"},status=status.HTTP_200_OK)
    


# class userlikedsongviewwithoutprefetch(APIView):

#     def get(self,request,user_id):
#         try:
#             userss = UserProfile.objects.get(id=user_id)
#             serializer=userlikedSerializer(userss)
#             return Response(serializer.data,200)
#         except UserProfile.DoesNotExist:
#             return Response({"error":"user not found"},404)
        

# class userlikesongviewswithprefetch(APIView):
#     def get(self,request,user_id):
#         userss=UserProfile.objects.prefetch_related("liked_songs__genre").get(id=user_id)
#         serializer=userlikedSerializer(userss)
#         return Response(serializer.data,200)