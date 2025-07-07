from django.urls import path
from .views import *

urlpatterns=[
    path('user_account/',user_post_get.as_view()),
]