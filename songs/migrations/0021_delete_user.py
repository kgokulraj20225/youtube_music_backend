# Generated by Django 5.0.3 on 2025-07-13 13:46

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('songs', '0020_user_name'),
    ]

    operations = [
        migrations.DeleteModel(
            name='user',
        ),
    ]
