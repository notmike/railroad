from django.contrib import admin

# Register your models here.
from testrails.models import FareTypes_Test, Passengers_Test, Reservations_Test, SeatsFree_Test, Segments_Test, Stations_Test, StopsAt_Test, Trains_Test, Trips_Test

admin.site.register(FareTypes_Test)
admin.site.register(Passengers_Test)
admin.site.register(Reservations_Test)
admin.site.register(SeatsFree_Test)
admin.site.register(Segments_Test)
admin.site.register(Stations_Test)
admin.site.register(StopsAt_Test)
admin.site.register(Trains_Test)
admin.site.register(Trips_Test)
