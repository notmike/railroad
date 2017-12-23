# run this from django shell
import csv
from testrails.models import Stations_Test
data = csv.reader(open("data/railroad1_stations.csv"), delimiter=",")
 
for row in data:
    s = Stations_Test()
    s.station_name = row[1]
    s.station_symbol = row[2]
    s.save()
