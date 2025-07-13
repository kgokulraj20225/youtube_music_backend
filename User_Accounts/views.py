from django.shortcuts import render
from rest_framework import status # type: ignore
from rest_framework.decorators import api_view
from rest_framework.response import Response 
from .models import *
from .serializers import *
from django.http import Http404, JsonResponse
from django.views.decorators.csrf import csrf_exempt
from rest_framework.views import APIView # type: ignore
from rest_framework.response import Response
from django.http import HttpResponse
from rest_framework.permissions import IsAuthenticated
from rest_framework.authentication import TokenAuthentication
from rest_framework import status,generics
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework_simplejwt.tokens import RefreshToken
from rest_framework.permissions import AllowAny, IsAuthenticated
from django.shortcuts import get_object_or_404
from django.db.models import Q
from django.views.generic import ListView
# Create your views here.


class user_post_get(generics.ListCreateAPIView):
    queryset=UserProfile.objects.all()
    serializer_class=User_accountSerializer


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