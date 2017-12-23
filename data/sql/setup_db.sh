#!/bin/bash
mysql -u root -p --database=railroad < ./sql/create_db.sql
mysql -u root -p --database=railroad < ./sql/railroad-mixed-schema.sql
mysql -u root -p --database=railroad < ./sql/fare_types.sql
mysql -u root -p --database=railroad < ./sql/seats_free.sql
mysql -u root -p --database=railroad < ./sql/segments.sql
mysql -u root -p --database=railroad < ./sql/stations.sql
mysql -u root -p --database=railroad < ./sql/stops_at.sql
mysql -u root -p --database=railroad < ./sql/trains.sql
mysql -u root -p --database=railroad < ./sql/tickets.sql
mysql -u root -p --database=railroad < ./sql/avail_trains.sql
mysql -u root -p --database=railroad < ./procs/get_avail_trains.sql
mysql -u root -p --database=railroad < ./procs/get_ticket.sql
