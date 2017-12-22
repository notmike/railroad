from django.db import models

# Create your models here.
class FareTypes_Test(models.Model):
    fare_id = models.AutoField(primary_key=True)
    fare_name = models.CharField(max_length=20, blank=True, null=True)
    rate = models.DecimalField(max_digits=3, decimal_places=2, blank=True, null=True)

    def __str__(self):
    	return self.fare_name

    class Meta:
        db_table = 'fare_types_test'


class Stations_Test(models.Model):
    station_id = models.AutoField(primary_key=True)
    station_name = models.CharField(max_length=40)
    station_symbol = models.CharField(unique=True, max_length=3)

    def __str__(self):
    	return self.station_name

    class Meta:
        db_table = 'stations_test'


class Passengers_Test(models.Model):
    passenger_id = models.AutoField(primary_key=True)
    fname = models.CharField(max_length=30, blank=True, null=True)
    lname = models.CharField(max_length=100, blank=True, null=True)
    email = models.CharField(max_length=100, blank=True, null=True)
    password = models.CharField(max_length=100, blank=True, null=True)
    preferred_card_number = models.CharField(max_length=16, blank=True, null=True)
    preferred_billing_address = models.CharField(max_length=100, blank=True, null=True)

    def __str__(self):
    	return self.fname + " " + self.lname

    class Meta:
        db_table = 'passengers_test'


class Trains_Test(models.Model):
    train_id = models.AutoField(primary_key=True)
    train_start = models.ForeignKey(Stations_Test, on_delete=models.DO_NOTHING, related_name='train_start')
    train_end = models.ForeignKey(Stations_Test, on_delete=models.DO_NOTHING, related_name='train_end')
    train_direction = models.IntegerField(blank=True, null=True)
    train_days = models.IntegerField(blank=True, null=True)

    def __str__(self):
    	return self.train_id

    class Meta:
        db_table = 'trains_test'


class Reservations_Test(models.Model):
    reservation_id = models.AutoField(primary_key=True)
    reservation_date = models.DateTimeField(blank=True, null=True)
    paying_passenger = models.ForeignKey(Passengers_Test, on_delete=models.DO_NOTHING)
    card_number = models.CharField(max_length=16, blank=True, null=True)
    billing_address = models.CharField(max_length=100, blank=True, null=True)

    def __str__(self):
    	return self.reservation_id

    class Meta:
        db_table = 'reservations_test'


class Segments_Test(models.Model):
    segment_id = models.AutoField(primary_key=True)
    seg_n_end = models.ForeignKey(Stations_Test, on_delete=models.DO_NOTHING, related_name='seg_n_end')
    seg_s_end = models.ForeignKey(Stations_Test, on_delete=models.DO_NOTHING, related_name='seg_s_end')
    seg_fare = models.DecimalField(max_digits=7, decimal_places=2)

    def __str__(self):
    	return self.segment_id

    class Meta:
        db_table = 'segments_test'


class SeatsFree_Test(models.Model):
    train = models.ForeignKey(Trains_Test, on_delete=models.DO_NOTHING, primary_key=True)
    segment = models.ForeignKey(Segments_Test, on_delete=models.DO_NOTHING)
    seat_free_date = models.DateField()
    freeseat = models.IntegerField()

    def __str__(self):
    	return self.seat_free_date

    class Meta:
        db_table = 'seats_free_test'
        unique_together = (('train', 'segment', 'seat_free_date'),)


class StopsAt_Test(models.Model):
    train = models.ForeignKey(Trains_Test, on_delete=models.DO_NOTHING, primary_key=True)
    station = models.ForeignKey(Stations_Test, on_delete=models.DO_NOTHING)
    time_in = models.TimeField(blank=True, null=True)
    time_out = models.TimeField(blank=True, null=True)

    def __str__(self):
    	return self.time_in + " " + self.time_out 

    class Meta:
        db_table = 'stops_at_test'
        unique_together = (('train', 'station'),)


class Trips_Test(models.Model):
    trip_id = models.AutoField(primary_key=True)
    trip_date = models.DateField()
    trip_seg_start = models.ForeignKey(Segments_Test, on_delete=models.DO_NOTHING, related_name='trip_seg_start')
    trip_seg_ends = models.ForeignKey(Segments_Test, on_delete=models.DO_NOTHING, related_name='trip_seg_ends')
    fare_type = models.ForeignKey(FareTypes_Test, on_delete=models.DO_NOTHING, related_name='fare_type')
    fare = models.DecimalField(max_digits=7, decimal_places=2)
    trip_train = models.ForeignKey(Trains_Test, on_delete=models.DO_NOTHING)
    reservation = models.ForeignKey(Reservations_Test, on_delete=models.DO_NOTHING)

    def __str__(self):
    	return self.trip_id
    	
    class Meta:
        db_table = 'trips_test'