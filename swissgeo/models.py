from django.db import models
from django.contrib.gis.db import models

# Create your models here.

class Firstaid(models.Model):
    id = models.BigIntegerField(primary_key=True)
    geom = models.MultiPointField(srid=21781, blank=True, null=True)
    name = models.CharField(max_length=80, blank=True, null=True)
    altitude = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'FirstAid'


class Lift(models.Model):
    id = models.BigIntegerField(primary_key=True)
    geom = models.MultiLineStringField(srid=21781, blank=True, null=True)
    fid = models.BigIntegerField(blank=True, null=True)
    name = models.CharField(max_length=80, blank=True, null=True)
    length = models.CharField(max_length=80, blank=True, null=True)
    time = models.CharField(max_length=80, blank=True, null=True)
    type = models.CharField(max_length=80, blank=True, null=True)
    altitude = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'Lift '


class Liftentrance(models.Model):
    id = models.BigIntegerField(primary_key=True)
    geom = models.MultiPointField(srid=21781, blank=True, null=True)
    name = models.CharField(max_length=80, blank=True, null=True)
    altitude = models.CharField(max_length=80, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'LiftEntrance'


class Park(models.Model):
    id = models.BigIntegerField(primary_key=True)
    geom = models.MultiPolygonField(srid=21781, blank=True, null=True)
    name = models.CharField(max_length=80, blank=True, null=True)
    altitude = models.CharField(max_length=80, blank=True, null=True)
    places = models.BigIntegerField(blank=True, null=True)
    full = models.CharField(max_length=10, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'Park'


class Restaurant(models.Model):
    id = models.BigIntegerField(primary_key=True)
    geom = models.MultiPolygonField(srid=21781, blank=True, null=True)
    name = models.CharField(max_length=80, blank=True, null=True)
    altitude = models.CharField(max_length=80, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'Restaurant'


class Restroom(models.Model):
    id = models.BigIntegerField(primary_key=True)
    geom = models.MultiPointField(srid=21781, blank=True, null=True)
    name = models.CharField(max_length=80, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'Restroom'


class Slope(models.Model):
    id = models.BigIntegerField(primary_key=True)
    geom = models.MultiPolygonField(srid=21781, blank=True, null=True)
    name = models.CharField(max_length=80, blank=True, null=True)
    altitude = models.CharField(max_length=80, blank=True, null=True)
    length = models.BigIntegerField(blank=True, null=True)
    drop = models.BigIntegerField(blank=True, null=True)
    difficulty = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'Slope'


class Ticketservice(models.Model):
    id = models.BigIntegerField(primary_key=True)
    geom = models.MultiPolygonField(srid=21781, blank=True, null=True)
    name = models.CharField(max_length=80, blank=True, null=True)
    altitude = models.CharField(max_length=80, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'TicketService'



    
class Canton(models.Model):
    name=models.CharField(max_length=200)
    geom=models.MultiPolygonField(srid=21781,null=True)
    
    
    class Meta:
        db_table = "cantons"
        
    def __str__(self):
        return self.name