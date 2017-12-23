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

-- Dumping data for table railroad.stations: ~25 rows (approximately)
DELETE FROM `stations`;
/*!40000 ALTER TABLE `stations` DISABLE KEYS */;
INSERT INTO `stations` VALUES
	(1, 'Boston, MA - South Station', 'BOS'),
	(2, 'Boston, MA - Back Bay Station', 'BBY'),
	(3, 'Route 128, MA', 'RTE'),
	(4, 'Providence, RI', 'PVD'),
	(5, 'Kingston, RI', 'KIN'),
	(6, 'Westerly,RI', 'WLY'),
	(7, 'Mystic, CT', 'MYS'),
	(8, 'New London, CT', 'NLC'),
	(9, 'Old Saybrook, CT', 'OSB'),
	(10, 'New Haven, CT', 'NHV'),
	(11, 'Bridgeport, CT', 'BRP'),
	(12, 'Stamford, CT', 'STM'),
	(13, 'New Rochelle, NY', 'NRO'),
	(14, 'New York, NY - Penn Station', 'NYP'),
	(15, 'Newark, NJ', 'NWK'),
	(16, 'Newark Liberty Intl. Air., NJ', 'EWR'),
	(17, 'Metro Park, NJ', 'MET'),
	(18, 'Trenton, NJ', 'TRE'),
	(19, 'Philadelphia, PA - 30th Street Station', 'PHL'),
	(20, 'Wilmington, DE - J.R. Biden, Jr. Station', 'WIL'),
	(21, 'Aberdeen, MD', 'ABE'),
	(22, 'Baltimore, MD - Penn Station', 'BAL'),
	(23, 'BWI Marshall Airport, MD', 'BWI'),
	(24, 'New Carrollton, MD', 'NCR'),
	(25, 'Washington, DC - Union Station', 'WAS');
/*!40000 ALTER TABLE `stations` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
