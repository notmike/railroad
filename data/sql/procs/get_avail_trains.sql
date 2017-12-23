DROP PROCEDURE IF EXISTS get_avail_trains;
DELIMITER $$
create procedure get_avail_trains(IN trip_date date, IN trip_start varchar(4), IN trip_end varchar(4), IN time_of_day char(3), IN day_of_week char(1), OUT train_avail tinyint)

find_trains:

BEGIN

DECLARE trip_direction tinyint;

DECLARE seg0 int(11);

DECLARE seg1 int(11);

DECLARE tod_start_time time;

DECLARE tod_end_time time;

DECLARE trip_start_id int(11);

DECLARE trip_end_id int(11);

/*

Get start and end station_id's.

*/

SET trip_start_id = (SELECT station_id FROM stations WHERE station_symbol = trip_start);

SET trip_end_id = (SELECT station_id FROM stations WHERE station_symbol = trip_end);

/*

Get direction.

*/

IF trip_start_id < trip_end_id THEN

SET trip_direction=0;

ELSE

SET trip_direction=1;

END IF;

/*

Get start and end segments.

*/

IF trip_direction = 0 THEN

SET seg0 = (SELECT segment_id FROM segments WHERE seg_n_end = trip_start_id);

    SET seg1 = (SELECT segment_id FROM segments WHERE seg_s_end = trip_end_id);

ELSE

SET seg0 = (SELECT segment_id FROM segments WHERE seg_s_end = trip_start_id);

    SET seg1 = (SELECT segment_id FROM segments WHERE seg_n_end = trip_end_id);

END IF;

/* 

Get time range when client wants to board the train. (Somewhat arbitrary)

*/

IF time_of_day = 'MOR' THEN

SET tod_start_time='06:00';

    SET tod_end_time='12:00';

ELSEIF time_of_day = 'AFT' THEN

SET tod_start_time='12:00';

    SET tod_end_time='18:00';

ELSEIF time_of_day = 'EVE' THEN

SET tod_start_time='18:00';

    SET tod_end_time='00:00';

ELSE

SET tod_start_time='00:00';

    SET tod_end_time='06:00';

END IF;

/*
    Delete records if they exisits from the avail trains
*/

IF EXISTS (SELECT 1 FROM avail_trains) THEN
DELETE FROM avail_trains;
END IF;
/*

Now test for available trains.

*/

IF NOT EXISTS (SELECT trains.train_id FROM trains INNER JOIN stops_at ON trains.train_id = stops_at.train_id INNER JOIN seats_free ON trains.train_id = seats_free.train_id WHERE stops_at.time_out BETWEEN tod_start_time AND tod_end_time AND (SELECT MIN(freeseat) FROM seats_free WHERE segment_id BETWEEN seg0 AND seg1 AND seat_free_date = trip_date) > 0) THEN

SET train_avail=0;

    LEAVE find_trains;

ELSE

SET train_avail=1;

    /*

    Now create a record in avail_trains for each train and trip matching criteria. (Needs to be 

        tested)

    */

    INSERT IGNORE INTO avail_trains (train_id) SELECT trains.train_id FROM trains INNER JOIN stops_at ON trains.train_id = stops_at.train_id INNER JOIN seats_free ON trains.train_id = seats_free.train_id WHERE stops_at.time_out BETWEEN tod_start_time AND tod_end_time AND (SELECT MIN(freeseat) FROM seats_free WHERE segment_id BETWEEN seg0 AND seg1 AND seat_free_date = trip_date) > 0;

    /*

    Create possibly multiple records with just train_id, then update them all with static values.

    */

    UPDATE avail_trains SET start_station = trip_start_id, end_station = trip_end_id, travel_date = trip_date, time_of_day = time_of_day, seats_free = 1;

    

END IF;

END;
$$
DELIMITER ;