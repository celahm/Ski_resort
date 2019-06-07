from django.urls import path

from . import views

urlpatterns = [
    path('', views.skiresort, name='skiresort'),
    path('liftsdata', views.liftsdata, name='liftsdata'),
    path('liftentrancesdata', views.liftentrancesdata, name='liftentrancesdata'),
    path('restaurantsdata', views.restaurantsdata, name='restaurantsdata'),
    path('restroomsdata', views.restroomsdata, name='restroomsdata'),
    path('slopesdata', views.slopesdata, name='slopesdata'),
    path('firstaiddata', views.firstaiddata, name='firstaiddata'),
    path('parkdata', views.parkdata, name='parkdata'),
    path('ticketsservicedata', views.ticketservicesdata, name='ticketsservicedata'),
]