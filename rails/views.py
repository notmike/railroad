from django.shortcuts import render, redirect
from django.http import HttpResponseRedirect, HttpResponse
from django.db import connection

# Create your views here.
def index(request):
    return render(request, 'main/index.html')

def get_avail_trains(request):
    row=""
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
        temp["travel_date"] = str(e[3])
        temp["time_of_day"] = e[4]
        temp["seats_free"] = e[5]
        temp["chosen"] = e[6]
        data.append(temp)
    return render(request, 'main/index.html', {"avail_trains":data})

def make_reservation(request):
    t_id=""
    s_station=""
    e_station=""
    t_date=""
    tod=""
    s_free=""
    cho=""
    if request.method == 'POST':
        t_id = request.POST.get("ti")
        s_station = request.POST.get("ss")
        e_station = request.POST.get("es")
        t_date = request.POST.get("trd")
        tod = request.POST.get("tod")
        s_free = request.POST.get("sf")
        cho = request.POST.get("cho")
    data = {}
    data["train_id"] = t_id
    data["start_station"] = s_station
    data["end_station"] = e_station
    data["travel_date"] = t_date
    data["time_of_day"] = tod
    data["seats_free"] = s_free
    data["chosen"] = cho
    return render(request, 'main/reservation.html', {"selected":data})

def view_reservation(request):
    return render(request, 'main/view-res.html')

def book_ticket(request):
    last_name=""
    first_name=""
    payment=""
    t_id=""
    s_station=""
    e_station=""
    t_date=""
    tod=""
    s_free=""
    cho=""
    if request.method=="POST":
        last_name = request.POST.get("lname")
        first_name = request.POST.get("fname")
        payment = request.POST.get("pay")
        t_id = request.POST.get("ti")
        s_station = request.POST.get("ss")
        e_station = request.POST.get("es")
        t_date = request.POST.get("trd")
    with connection.cursor() as cursor:
            # get_ticket('Rafael','Li Chen','Free Ticket', @out_value)
            cursor.execute("update avail_trains set chosen=1 where train_id="+t_id+" and start_station="+s_station+" and end_station="+e_station+" and travel_date='"+str(t_date)+"'")
            ret = cursor.callproc("get_ticket", [first_name, last_name, payment, ""])
            # row = cursor.fetchall()
    return render(request, 'main/reservation.html', {"result":"good to go"})

def my_custom_sql():
    with connection.cursor() as cursor:
        cursor.execute("SELECT station_name from stations")
        row = cursor.fetchall()
    print (row)
    return row
