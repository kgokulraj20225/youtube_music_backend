# Generated by Django 5.0.3 on 2025-07-04 10:07

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('User_Accounts', '0002_remove_userprofile_user_userprofile_username'),
    ]

    operations = [
        migrations.AlterField(
            model_name='userprofile',
            name='username',
            field=models.CharField(max_length=100),
        ),
    ]
