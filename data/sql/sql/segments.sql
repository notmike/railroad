-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.2.10-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping data for table railroad.segments: ~24 rows (approximately)
DELETE FROM `segments`;
/*!40000 ALTER TABLE `segments` DISABLE KEYS */;
INSERT INTO `segments` VALUES
	(1, 1, 2, 2.82),
	(2, 2, 3, 4.70),
	(3, 3, 4, 11.75),
	(4, 4, 5, 9.87),
	(5, 5, 6, 6.11),
	(6, 6, 7, 5.17),
	(7, 7, 8, 7.05),
	(8, 8, 9, 8.93),
	(9, 9, 10, 15.51),
	(10, 10, 11, 10.34),
	(11, 11, 12, 12.69),
	(12, 12, 13, 9.87),
	(13, 13, 14, 13.63),
	(14, 14, 15, 7.99),
	(15, 15, 16, 2.35),
	(16, 16, 17, 6.11),
	(17, 17, 18, 10.81),
	(18, 18, 19, 12.69),
	(19, 19, 20, 9.87),
	(20, 20, 21, 12.69),
	(21, 21, 22, 11.75),
	(22, 22, 23, 6.11),
	(23, 23, 24, 6.58),
	(24, 24, 25, 7.05);
/*!40000 ALTER TABLE `segments` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
