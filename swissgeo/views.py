from django.shortcuts import render,get_object_or_404
from django.http import HttpResponse
from django.template import loader
from django.http import Http404
from django.core.serializers import serialize

from .models import Canton, Lift, Restaurant, Restroom, Slope, Ticketservice, Liftentrance, Park,Firstaid

# Create your views here.


def index(request):
    return HttpResponse("Hi there this is Switzerland")


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


    
def canton(request,canton_name):
    
    cantons=Canton.objects.filter(name=canton_name)
    return render(request, 'swissgeo/canton.html', {'canton_parts':cantons})

#    return HttpResponse(cantons[1].geom.wkt)

def cantons(request):
    context ={  }
    return render(request,'swissgeo/cantons.html',context)

def cantonsdata(request):
    cantons=Canton.objects.all()
    ser=serialize('geojson',cantons,geometry_field='geom',fields=('name',))
    
    return HttpResponse(ser)


def liftsdata(request):
    lifts = Lift.objects.all()
    ser = serialize('geojson', lifts, geometry_field='geom', fields=('name',))

    return HttpResponse(ser)

def liftentrancesdata(request):
    liftentrances = Liftentrance.objects.all()
    ser = serialize('geojson', liftentrances, geometry_field='geom', fields=('name',))

    return HttpResponse(ser)


def restaurantsdata(request):
    restaurants = Restaurant.objects.all()
    ser = serialize('geojson', restaurants, geometry_field='geom', fields=('name',))

    return HttpResponse(ser)


def restroomsdata(request):
    restrooms = Restroom.objects.all()
    ser = serialize('geojson', restrooms, geometry_field='geom', fields=('name',))

    return HttpResponse(ser)


def slopesdata(request):
    slopes = Slope.objects.all()
    ser = serialize('geojson', slopes, geometry_field='geom', fields=('name',))

    return HttpResponse(ser)


def firstaiddata(request):
    firstaids = Firstaid.objects.all()
    ser = serialize('geojson', firstaids, geometry_field='geom', fields=('name',))

    return HttpResponse(ser)

def parkdata(request):
    parks = Park.objects.all()
    ser = serialize('geojson', parks, geometry_field='geom', fields=('name',))

    return HttpResponse(ser)

def ticketservicesdata(request):
    parks = Park.objects.all()
    ser = serialize('geojson', parks, geometry_field='geom', fields=('name',))

    return HttpResponse(ser)




