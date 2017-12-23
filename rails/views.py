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
        date_year = request.POST.get("date_year")
        date_month = request.POST.get("date_month")
        date_day = request.POST.get("date_day")
        date = date_year+"-"+date_month+"-"+date_day
        time_of_day = request.POST.get("time-of-day")
        out_arg1 = ""
        with connection.cursor() as cursor:
            ret = cursor.callproc("get_avail_trains", [date, fromStation, toStation,time_of_day, 'W', out_arg1])# calls PROCEDURE named LOG_MESSAGE which resides in MY_UTIL Package
            # ret = cursor.callproc("get_avail_trains", ['2017-12-21', 'BOS', 'WAS','AFT', 'W', out_arg1])# calls PROCEDURE named LOG_MESSAGE which resides in MY_UTIL Package
            cursor.execute  ("SELECT * from avail_trains")
            row = cursor.fetchall()
    data = []
    for e in row:
        # (1, 1, 3, datetime.date(2017, 12, 26), 'AFT', 1, None)
        temp = {}
        temp["train_id"] = e[0]
        temp["start_station"] = e[1]
        temp["end_station"] = e[2]
        temp["travel_date"] = e[3]
        temp["time_of_day"] = e[4]
        temp["seats_free"] = e[5]
        temp["chosen"] = e[6]
        data.append(temp)
    return render(request, 'main/index.html', {"avail_trains":data})

def book_ticket(request):
    pass

def my_custom_sql():
    with connection.cursor() as cursor:
        cursor.execute("SELECT station_name from stations")
        row = cursor.fetchall()
    print (row)
    return row