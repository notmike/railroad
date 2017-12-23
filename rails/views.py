from django.shortcuts import render, redirect
from django.http import HttpResponseRedirect, HttpResponse
from django.db import connection

# Create your views here.
def index(request):
    get_avail_trains()
    return render(request, 'main/index.html')

def get_avail_trains():
    out_arg1 = ""
    with connection.cursor() as cursor:
        ret = cursor.callproc("get_avail_trains", ['2017-12-21', 'BOS', 'WAS','AFT', 'W', out_arg1])# calls PROCEDURE named LOG_MESSAGE which resides in MY_UTIL Package
        print (out_arg1)
        print (ret)

def my_custom_sql():
    with connection.cursor() as cursor:
        cursor.execute("SELECT station_name from stations")
        row = cursor.fetchall()
    print (row)
    return row