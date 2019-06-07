from django.shortcuts import render
from django.http import HttpResponse
from django.core.serializers import serialize

from .models import Lift, Restaurant, Restroom, Slope, Ticketservice, Liftentrance, Park, Firstaid

# Create your views here.

def skiresort(request):
    lifts = Lift.objects.all()
    print(lifts)
    restrooms = Restroom.objects.all()
    restaurants = Restaurant.objects.all()
    liftEntrances = Liftentrance.objects.all()
    slopes = Slope.objects.all()
    firstAids = Firstaid.objects.all()
    parks = Park.objects.all()
    ticketService = Ticketservice.objects.all()
    return render(request, 'swissgeo/skiresort.html',
                  {
                      'lifts_parts': lifts,
                      'restrooms_parts': restrooms,
                      'restaurants_parts': restaurants,
                      'liftEntrances_parts': liftEntrances,
                      'slopes_parts': slopes,
                      'firstAids_parts': firstAids,
                      'parks_parts': parks,
                      'ticketService_parts': ticketService,

                   })


def liftsdata(request):
    lifts = Lift.objects.all()
    ser = serialize('geojson', lifts, geometry_field='geom', fields=('name', 'altitude', 'type', 'time'))

    return HttpResponse(ser)


def liftentrancesdata(request):
    liftentrances = Liftentrance.objects.all()
    ser = serialize('geojson', liftentrances, geometry_field='geom', fields=('name', 'altitude'))

    return HttpResponse(ser)


def restaurantsdata(request):
    restaurants = Restaurant.objects.all()
    ser = serialize('geojson', restaurants, geometry_field='geom', fields=('name', 'altitude'))

    return HttpResponse(ser)


def restroomsdata(request):
    restrooms = Restroom.objects.all()
    ser = serialize('geojson', restrooms, geometry_field='geom', fields='name')

    return HttpResponse(ser)


def slopesdata(request):
    slopes = Slope.objects.all()
    ser = serialize('geojson', slopes, geometry_field='geom',
                    fields=('name', 'altitude', 'length', 'drop', 'difficulty'))

    return HttpResponse(ser)


def firstaiddata(request):
    firstaids = Firstaid.objects.all()
    ser = serialize('geojson', firstaids, geometry_field='geom', fields=('name', 'altitude'))

    return HttpResponse(ser)


def parkdata(request):
    parks = Park.objects.all()
    ser = serialize('geojson', parks, geometry_field='geom', fields=('name', 'altitude', 'places', 'full'))

    return HttpResponse(ser)


def ticketservicesdata(request):
    ticketservices = Ticketservice.objects.all()
    ser = serialize('geojson', ticketservices, geometry_field='geom', fields=('name', 'altitude'))

    return HttpResponse(ser)

