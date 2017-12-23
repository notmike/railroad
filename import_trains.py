# run this from django shell
import csv
from testrails.models import Trains_Test
data = csv.reader(open("data/railroad1_trains.csv"), delimiter=",")
 
for row in data:
    t = Trains_Test()
    t.train_start = row[1]
    t.train_end = row[2]
    t.train_direction = row[3]
    t.train_days = row[3]
    t.save()
