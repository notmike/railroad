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

-- Dumping data for table railroad.trains: ~40 rows (approximately)
DELETE FROM `trains`;
/*!40000 ALTER TABLE `trains` DISABLE KEYS */;
INSERT INTO `trains` VALUES
	(1, 1, 25, 0, 'MF'),
	(2, 1, 25, 0, 'MF'),
	(3, 1, 25, 0, 'MF'),
	(4, 1, 25, 0, 'MF'),
	(5, 1, 25, 0, 'MF'),
	(6, 1, 25, 0, 'MF'),
	(7, 1, 25, 0, 'MF'),
	(8, 1, 25, 0, 'MF'),
	(9, 25, 1, 1, 'MF'),
	(10, 25, 1, 1, 'MF'),
	(11, 25, 1, 1, 'MF'),
	(12, 25, 1, 1, 'MF'),
	(13, 25, 1, 1, 'MF'),
	(14, 25, 1, 1, 'MF'),
	(15, 25, 1, 1, 'MF'),
	(16, 25, 1, 1, 'MF'),
	(17, 1, 25, 0, 'SSH'),
	(18, 1, 25, 0, 'SSH'),
	(19, 1, 25, 0, 'SSH'),
	(20, 1, 25, 0, 'SSH'),
	(21, 1, 25, 0, 'SSH'),
	(22, 1, 25, 0, 'SSH'),
	(23, 25, 1, 1, 'SSH'),
	(24, 25, 1, 1, 'SSH'),
	(25, 25, 1, 1, 'SSH'),
	(26, 25, 1, 1, 'SSH'),
	(27, 25, 1, 1, 'SSH'),
	(28, 25, 1, 1, 'SSH'),
	(101, 1, 25, 0, 'MF'),
	(102, 1, 25, 0, 'MF'),
	(103, 1, 25, 0, 'MF'),
	(104, 1, 25, 0, 'MF'),
	(105, 1, 25, 0, 'MF'),
	(106, 1, 25, 0, 'MF'),
	(107, 25, 1, 0, 'MF'),
	(108, 25, 1, 0, 'MF'),
	(109, 25, 1, 0, 'MF'),
	(110, 25, 1, 0, 'MF'),
	(111, 25, 1, 0, 'MF'),
	(112, 25, 1, 0, 'MF');
/*!40000 ALTER TABLE `trains` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
