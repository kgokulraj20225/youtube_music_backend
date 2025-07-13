from django.urls import path
from .views import *

urlpatterns=[
    path('user_account/',user_post_get.as_view()),
    # path("userlikedsongviewwithoutprefetch/<int:user_id>/",userlikedsongviewwithoutprefetch.as_view()),
    # path("userlikesongviewswithprefetch/<int:user_id>/",userlikesongviewswithprefetch.as_view())
]