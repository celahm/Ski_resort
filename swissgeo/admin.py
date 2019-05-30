from django.contrib import admin
from django.contrib.gis import admin

# Register your models here.

from .models import Canton, Lift, Restaurant, Restroom, Slope, Ticketservice, Liftentrance, Park,Firstaid

# register model classes
admin.site.register(Lift)
admin.site.register(Restroom)
admin.site.register(Restaurant)
admin.site.register(Slope)
admin.site.register(Ticketservice)
admin.site.register(Liftentrance)
admin.site.register(Park)
admin.site.register(Firstaid)

# also register Geo classes
#admin.site.register(Canton, admin.GeoModelAdmin)
admin.site.register(Canton, admin.OSMGeoAdmin)