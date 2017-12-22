from django.contrib import admin

# Register your models here.
from rails.models import FareTypes, Passengers, Reservations, SeatsFree, Segments, Stations, StopsAt, Trains, Trips

admin.site.register(FareTypes)
admin.site.register(Passengers)
admin.site.register(Reservations)
admin.site.register(SeatsFree)
admin.site.register(Segments)
admin.site.register(Stations)
admin.site.register(StopsAt)
admin.site.register(Trains)
admin.site.register(Trips)
