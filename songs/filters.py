import django_filters
from .models import *

class artist(django_filters.FilterSet):
    artist=django_filters.CharFilter(field_name='artists__artiest_name',lookup_expr='icontains')

    class Meta:
        models=Songs
        fields="__all__"
