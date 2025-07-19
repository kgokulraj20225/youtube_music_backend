from django.db import models
from django.contrib.auth.models import User
from django.core.exceptions import ValidationError


# Create your models here.

class UserProfile(models.Model):
    user_name = models.CharField(max_length=100, blank=True,null=True)
    gmail=models.EmailField(unique=True)
    phone_number = models.CharField(max_length=10,blank=True,null=True)
    photo_url = models.ImageField(upload_to='user_photo/',blank=True,null=True)




    def __str__(self):
        return self.user_name    