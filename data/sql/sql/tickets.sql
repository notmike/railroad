-- phpMyAdmin SQL Dump
-- version 4.7.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 23, 2017 at 07:09 AM
-- Server version: 10.2.7-MariaDB
-- PHP Version: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `railroad3`
--

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `trip_id` int(11) NOT NULL,
  `trip_starts` int(11) NOT NULL,
  `trip_ends` int(11) NOT NULL,
  `trip_train` int(11) NOT NULL,
  `trip_date` date DEFAULT NULL,
  `passenger_id` int(11) NOT NULL,
  `round_trip` tinyint(1) DEFAULT NULL,
  `return_train` int(11) DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `fare` decimal(4,2) NOT NULL,
  `cancelled` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`trip_id`),
  ADD KEY `trip_starts` (`trip_starts`),
  ADD KEY `trip_ends` (`trip_ends`),
  ADD KEY `trip_train` (`trip_train`),
  ADD KEY `passenger_id` (`passenger_id`),
  ADD KEY `return_train` (`return_train`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `trip_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`trip_starts`) REFERENCES `stations` (`station_id`),
  ADD CONSTRAINT `tickets_ibfk_2` FOREIGN KEY (`trip_ends`) REFERENCES `stations` (`station_id`),
  ADD CONSTRAINT `tickets_ibfk_3` FOREIGN KEY (`trip_train`) REFERENCES `trains` (`train_id`),
  ADD CONSTRAINT `tickets_ibfk_4` FOREIGN KEY (`passenger_id`) REFERENCES `passengers` (`passenger_id`),
  ADD CONSTRAINT `tickets_ibfk_5` FOREIGN KEY (`return_train`) REFERENCES `trains` (`train_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
