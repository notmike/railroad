from django.shortcuts import render, redirect
from django.http import HttpResponseRedirect, HttpResponse
from django.db import connection

# Create your views here.
def index(request):
    
    return render(request, 'main/index.html')

def get_avail_trains(request):
    if request.method == 'POST':
        fromStation = request.POST.get("stationFrom")
        toStation = request.POST.get("stationTo")
        date = request.POST.get("date")
        time_of_day = request.POST.get("time-of-day")
        out_arg1 = ""
        with connection.cursor() as cursor:
            ret = cursor.callproc("get_avail_trains", [date, fromStation, toStation,time_of_day, 'W', out_arg1])# calls PROCEDURE named LOG_MESSAGE which resides in MY_UTIL Package
            # ret = cursor.callproc("get_avail_trains", ['2017-12-21', 'BOS', 'WAS','AFT', 'W', out_arg1])# calls PROCEDURE named LOG_MESSAGE which resides in MY_UTIL Package
            cursor.execute  ("SELECT * from avail_trains")
            row = cursor.fetchall()
    return HttpResponse(row)

def my_custom_sql():
    with connection.cursor() as cursor:
        cursor.execute("SELECT station_name from stations")
        row = cursor.fetchall()
    print (row)
    return row