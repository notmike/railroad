DELIMITER //
DROP PROCEDURE IF EXISTS get_ticket //
/* this assumes an auxiliary table avail_trains see schema in separate file*/
/* this uses railroad3 but with an attribute passenger_mop (method of payment) added to passengers and attribute segment_fare added to segments */
/* this procedure outputs a bool trip_still_avail which you reference as @trip_ok when calling the proc to be accessed from session which is 0 if chosen train not still ok, >0 if chosen train is ok*/
/* for instance get_ticket ('Peter','Barnett', 'credit',@trip_ok);   */

create procedure get_ticket(IN pass_fname varchar(30), IN pass_lname varchar(30), IN pay_method varchar(20), OUT trip_still_avail int)
getting_ticket:  /*label to allow us to leave*/
BEGIN
	
DECLARE this_train int;
DECLARE this_start_station char(3);
DECLARE this_end_station char(3);
DECLARE this_trip_date date;
DECLARE this_passenger int;
DECLARE seg0 int;
DECLARE seg1 int;
-- Missing variables.
DECLARE trip_start_id int(11);
DECLARE trip_end_id int(11);
DECLARE trip_direction tinyint;
-- Reservation variables.
DECLARE current_datetime datetime;
    
    /*
    Your web code must check off customer preference in avail_trains chosen.
    */
    IF NOT EXISTS(SELECT * FROM avail_trains WHERE chosen = 1) THEN
    SET trip_still_avail=2; -- check this status variable in your program. 0 means no good, 1 means good, 2 means no selection made.
        LEAVE getting_ticket;
    ELSE
    SELECT train_id, start_station, end_station, travel_date INTO this_train, this_start_station, this_end_station, this_trip_date FROM avail_trains WHERE chosen = 1;
    END IF;
    
    /*
    Get direction - it is not normal form to store direction in the avail_trains table.
    */
    
    -- Convert symbol to id first.
    SET trip_start_id = (SELECT station_id FROM stations WHERE station_symbol = this_start_station);
    SET trip_end_id = (SELECT station_id FROM stations WHERE station_symbol = this_end_station);
    
    IF trip_start_id < trip_end_id THEN
    SET trip_direction = 0; -- South
    ELSE
    SET trip_direction=1; -- North
    END IF;
    
    /*
    Get start and end segments but store in variables without reference to direction since using 'between'.
    */
    IF trip_direction = 0 THEN
    SET seg0 = (SELECT segment_id FROM segments WHERE seg_n_end = trip_start_id);
        SET seg1 = (SELECT segment_id FROM segments WHERE seg_s_end = trip_end_id);
    ELSE
    SET seg0 = (SELECT segment_id FROM segments WHERE seg_s_end = trip_start_id);
        SET seg1 = (SELECT segment_id FROM segments WHERE seg_n_end = trip_end_id);
    END IF;
    
    /*
    Use SELECT...FOR UPDATE to lock seats_free while doing other stuff. (New feature; needs to be tested)
    */
    
    SET trip_still_avail = (SELECT MIN(freeseat) FROM seats_free WHERE segment_id BETWEEN seg0 and seg1);
    
    IF trip_still_avail <= 0 THEN
    LEAVE getting_ticket;
    ELSE
    IF EXISTS (SELECT passenger_id FROM passengers WHERE lname = pass_lname AND fname = pass_fname) THEN
        SET this_passenger = (SELECT passenger_id FROM passengers WHERE lname = pass_lname AND fname = pass_fname);
        ELSE
        INSERT INTO passengers (lname, fname, preferred_card_number) VALUES(pass_lname, pass_fname, pay_method);
            -- Now get new passenger_id into local variable. Not safe to use max(passenger_id).
            SELECT passenger_id INTO this_passenger FROM passengers where lname = pass_lname AND fname = pass_fname;
        END IF;
        
        -- Now write ticket
        INSERT INTO tickets (trip_starts, trip_ends, trip_train, trip_date, passenger_id, fare) VALUES (this_start_station, this_end_station, this_train, this_trip_date, this_passenger, 20);

        -- Finally decrement seats_free
        UPDATE seats_free SET freeseat = freeseat - 1 WHERE segment_id BETWEEN seg0 and seg1;
        
        -- Write reservation
        SET current_datetime = NOW();
        INSERT INTO reservations (reservation_date, paying_passenger_id) VALUES (current_datetime, this_passenger);
        
    END IF;
    END//
delimiter ;