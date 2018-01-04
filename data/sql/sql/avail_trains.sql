create table avail_trains
(train_id int,
start_station int,
end_station int,
travel_date date,
time_of_day char(3),
seats_free tinyint,
chosen tinyint, 
PRIMARY KEY (train_id, start_station, end_station, travel_date));

