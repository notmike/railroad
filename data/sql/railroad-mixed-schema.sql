-- phpMyAdmin SQL Dump
-- version 4.7.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 23, 2017 at 06:58 AM
-- Server version: 10.2.7-MariaDB
-- PHP Version: 5.5.38

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `railroad1`
--

-- --------------------------------------------------------

--
-- Table structure for table `fare_types`
--

CREATE TABLE `fare_types` (
  `fare_id` int(11) NOT NULL,
  `fare_name` varchar(20) DEFAULT NULL,
  `rate` decimal(3,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Table structure for table `passengers`
--

CREATE TABLE `passengers` (
  `passenger_id` int(11) NOT NULL,
  `fname` varchar(30) DEFAULT NULL,
  `lname` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `preferred_card_number` varchar(16) DEFAULT NULL,
  `preferred_billing_address` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE `reservations` (
  `reservation_id` int(11) NOT NULL,
  `reservation_date` datetime DEFAULT NULL,
  `paying_passenger_id` int(11) NOT NULL,
  `card_number` varchar(16) DEFAULT NULL,
  `billing_address` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `seats_free`
--

CREATE TABLE `seats_free` (
  `train_id` int(11) NOT NULL,
  `segment_id` int(11) NOT NULL,
  `seat_free_date` date NOT NULL,
  `freeseat` int(11) NOT NULL DEFAULT 448
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `segments`
--

CREATE TABLE `segments` (
  `segment_id` int(11) NOT NULL,
  `seg_n_end` int(11) NOT NULL,
  `seg_s_end` int(11) NOT NULL,
  `seg_fare` decimal(7,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stations`
--

CREATE TABLE `stations` (
  `station_id` int(11) NOT NULL,
  `station_name` varchar(40) NOT NULL,
  `station_symbol` char(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stops_at`
--

CREATE TABLE `stops_at` (
  `train_id` int(11) NOT NULL,
  `station_id` int(11) NOT NULL,
  `time_in` time DEFAULT NULL,
  `time_out` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `trains`
--

CREATE TABLE `trains` (
  `train_id` int(11) NOT NULL,
  `train_starts` int(11) NOT NULL,
  `train_ends` int(11) NOT NULL,
  `direction` tinyint(1) DEFAULT NULL,
  `train_days` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `trips`
--

CREATE TABLE `trips` (
  `trip_id` int(11) NOT NULL,
  `trip_date` date NOT NULL,
  `trip_seg_start` int(11) NOT NULL,
  `trip_seg_ends` int(11) NOT NULL,
  `fare_type` int(11) NOT NULL,
  `fare` decimal(7,2) NOT NULL,
  `trip_train_id` int(11) NOT NULL,
  `reservation_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `fare_types`
--
ALTER TABLE `fare_types`
  ADD PRIMARY KEY (`fare_id`);

--
-- Indexes for table `passengers`
--
ALTER TABLE `passengers`
  ADD PRIMARY KEY (`passenger_id`);

--
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `paying_passenger_id` (`paying_passenger_id`);

--
-- Indexes for table `seats_free`
--
ALTER TABLE `seats_free`
  ADD PRIMARY KEY (`train_id`,`segment_id`,`seat_free_date`),
  ADD KEY `segment_id` (`segment_id`);

--
-- Indexes for table `segments`
--
ALTER TABLE `segments`
  ADD PRIMARY KEY (`segment_id`),
  ADD KEY `seg_n_end` (`seg_n_end`),
  ADD KEY `seg_s_end` (`seg_s_end`);

--
-- Indexes for table `stations`
--
ALTER TABLE `stations`
  ADD PRIMARY KEY (`station_id`),
  ADD UNIQUE KEY `station_sym_ind` (`station_symbol`);

--
-- Indexes for table `stops_at`
--
ALTER TABLE `stops_at`
  ADD PRIMARY KEY (`train_id`,`station_id`),
  ADD KEY `station_id` (`station_id`);

--
-- Indexes for table `trains`
--
ALTER TABLE `trains`
  ADD PRIMARY KEY (`train_id`),
  ADD KEY `train_starts` (`train_starts`),
  ADD KEY `train_ends` (`train_ends`);

--
-- Indexes for table `trips`
--
ALTER TABLE `trips`
  ADD PRIMARY KEY (`trip_id`),
  ADD KEY `trip_seg_start` (`trip_seg_start`),
  ADD KEY `trip_seg_ends` (`trip_seg_ends`),
  ADD KEY `trip_train_id` (`trip_train_id`),
  ADD KEY `reservation_id` (`reservation_id`),
  ADD KEY `fare_type` (`fare_type`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `fare_types`
--
ALTER TABLE `fare_types`
  MODIFY `fare_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `passengers`
--
ALTER TABLE `passengers`
  MODIFY `passenger_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `reservation_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `segments`
--
ALTER TABLE `segments`
  MODIFY `segment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `stations`
--
ALTER TABLE `stations`
  MODIFY `station_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `trains`
--
ALTER TABLE `trains`
  MODIFY `train_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `trips`
--
ALTER TABLE `trips`
  MODIFY `trip_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`paying_passenger_id`) REFERENCES `passengers` (`passenger_id`);

--
-- Constraints for table `seats_free`
--
ALTER TABLE `seats_free`
  ADD CONSTRAINT `seats_free_ibfk_1` FOREIGN KEY (`segment_id`) REFERENCES `segments` (`segment_id`),
  ADD CONSTRAINT `seats_free_ibfk_2` FOREIGN KEY (`train_id`) REFERENCES `trains` (`train_id`);

--
-- Constraints for table `segments`
--
ALTER TABLE `segments`
  ADD CONSTRAINT `segments_ibfk_1` FOREIGN KEY (`seg_n_end`) REFERENCES `stations` (`station_id`),
  ADD CONSTRAINT `segments_ibfk_2` FOREIGN KEY (`seg_s_end`) REFERENCES `stations` (`station_id`);

--
-- Constraints for table `stops_at`
--
ALTER TABLE `stops_at`
  ADD CONSTRAINT `stops_at_ibfk_1` FOREIGN KEY (`train_id`) REFERENCES `trains` (`train_id`),
  ADD CONSTRAINT `stops_at_ibfk_2` FOREIGN KEY (`station_id`) REFERENCES `stations` (`station_id`);

--
-- Constraints for table `trains`
--
ALTER TABLE `trains`
  ADD CONSTRAINT `trains_ibfk_1` FOREIGN KEY (`train_starts`) REFERENCES `stations` (`station_id`),
  ADD CONSTRAINT `trains_ibfk_2` FOREIGN KEY (`train_ends`) REFERENCES `stations` (`station_id`);

--
-- Constraints for table `trips`
--
ALTER TABLE `trips`
  ADD CONSTRAINT `trips_ibfk_1` FOREIGN KEY (`trip_seg_start`) REFERENCES `segments` (`segment_id`),
  ADD CONSTRAINT `trips_ibfk_2` FOREIGN KEY (`trip_seg_ends`) REFERENCES `segments` (`segment_id`),
  ADD CONSTRAINT `trips_ibfk_3` FOREIGN KEY (`trip_train_id`) REFERENCES `trains` (`train_id`),
  ADD CONSTRAINT `trips_ibfk_4` FOREIGN KEY (`reservation_id`) REFERENCES `reservations` (`reservation_id`),
  ADD CONSTRAINT `trips_ibfk_5` FOREIGN KEY (`fare_type`) REFERENCES `fare_types` (`fare_id`);
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
