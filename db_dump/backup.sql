-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               10.1.31-MariaDB - mariadb.org binary distribution
-- Операционная система:         Win32
-- HeidiSQL Версия:              9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Дамп структуры базы данных budget_planner
CREATE DATABASE IF NOT EXISTS `budget_planner` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `budget_planner`;

-- Дамп структуры для таблица budget_planner.category
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_user_id_fk` (`user_id`),
  CONSTRAINT `category_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы budget_planner.category: ~31 rows (приблизительно)
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`id`, `name`, `sort_order`, `type`, `user_id`, `icon`) VALUES
	(1, 'Food', 1, 'expence', 1, NULL),
	(2, 'Car', 1, 'expence', 1, NULL),
	(3, 'Bills', 1, 'expence', 1, NULL),
	(4, 'Taxes', 1, 'expence', 1, NULL),
	(5, 'Shopping', 1, 'expence', 1, NULL),
	(6, 'Sports', 1, 'expence', 1, NULL),
	(7, 'Education', 1, 'expence', 1, NULL),
	(8, 'Medicine', 1, 'expence', 1, NULL),
	(9, 'Friends', 1, 'expence', 1, NULL),
	(10, 'Charity', 1, 'expence', 1, NULL),
	(11, 'Salary', 1, 'income', 1, NULL),
	(12, 'Other', 1, 'income', 1, NULL),
	(13, 'Food', 1, 'expence', 2, NULL),
	(14, 'Transport', 1, 'expence', 2, NULL),
	(15, 'Rent', 1, 'expence', 2, NULL),
	(16, 'Clothes', 1, 'expence', 2, NULL),
	(17, 'Sport', 1, 'expence', 2, NULL),
	(18, 'Accessories', 1, 'expence', 2, NULL),
	(19, 'Journeys', 1, 'expence', 2, NULL),
	(20, 'Electronics', 1, 'expence', 2, NULL),
	(21, 'Salary', 1, 'income', 2, NULL),
	(22, 'Other', 1, 'income', 2, NULL),
	(23, 'Cafe', 1, 'expence', 3, NULL),
	(24, 'Travel', 1, 'expence', 3, NULL),
	(25, 'Health', 1, 'expence', 3, NULL),
	(26, 'House', 1, 'expence', 3, NULL),
	(27, 'Insurance', 1, 'expence', 3, NULL),
	(28, 'Salary', 1, 'income', 3, NULL),
	(29, 'Other', 1, 'income', 3, NULL),
	(30, 'Food', 1, 'expence', 3, NULL),
	(31, 'Gifts', 1, 'expence', 2, NULL);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;

-- Дамп структуры для таблица budget_planner.transaction
CREATE TABLE IF NOT EXISTS `transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `wallet_id` int(11) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `transaction_category_id_fk` (`category_id`),
  KEY `transaction_wallet_id_fk` (`wallet_id`),
  CONSTRAINT `transaction_category_id_fk` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `transaction_wallet_id_fk` FOREIGN KEY (`wallet_id`) REFERENCES `wallet` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы budget_planner.transaction: ~31 rows (приблизительно)
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` (`id`, `category_id`, `wallet_id`, `amount`, `type`, `date`, `description`) VALUES
	(1, 1, 1, 12.15, NULL, '2018-09-12', 'Imperial buffet'),
	(2, 2, 1, 20.75, NULL, '2018-09-01', ''),
	(3, 1, 1, 13.15, NULL, '2018-09-02', ''),
	(4, 2, 1, 30.5, NULL, '2018-09-05', ''),
	(5, 1, 1, 55.15, NULL, '2018-09-05', ''),
	(6, 3, 1, 1, NULL, '2018-09-06', ''),
	(7, 6, 1, 5, NULL, '2018-09-07', ''),
	(8, 1, 1, 65.5, NULL, '2018-09-08', ''),
	(9, 1, 1, 25, NULL, '2018-09-08', ''),
	(10, 10, 2, 13.5, NULL, '2018-09-08', ''),
	(11, 6, 2, 11.2, NULL, '2018-09-11', ''),
	(12, 9, 2, 16.5, NULL, '2018-09-11', ''),
	(13, 9, 2, 14.31, NULL, '2018-09-11', ''),
	(14, 7, 2, 1.31, NULL, '2018-09-12', ''),
	(15, 5, 2, 66.67, NULL, '2018-09-12', ''),
	(16, 13, 3, 20.2, NULL, '2018-08-18', ''),
	(17, 20, 3, 55.5, NULL, '2018-09-01', ''),
	(18, 15, 3, 14.2, NULL, '2018-09-02', ''),
	(19, 26, 3, 18.6, NULL, '2018-09-05', ''),
	(20, 13, 3, 65.3, NULL, '2018-09-05', ''),
	(21, 14, 3, 5, NULL, '2018-09-06', ''),
	(22, 15, 3, 9, NULL, '2018-09-07', ''),
	(23, 15, 3, 37.21, NULL, '2018-09-08', ''),
	(24, 16, 3, 14.37, NULL, '2018-09-08', ''),
	(25, 19, 4, 25.55, NULL, '2018-09-11', ''),
	(26, 17, 4, 23.23, NULL, '2018-09-11', ''),
	(27, 17, 4, 47.68, NULL, '2018-09-11', ''),
	(28, 18, 4, 15.94, NULL, '2018-09-12', ''),
	(29, 20, 4, 32.23, NULL, '2018-09-12', ''),
	(30, 30, 3, 12.15, NULL, '2018-09-12', 'Imperial buffet'),
	(32, 13, 4, 16.52, NULL, '2018-09-08', ''),
	(33, 25, 7, 13.32, NULL, '2018-09-12', 'TB test'),
	(34, 24, 8, 41, NULL, '2018-09-12', 'Taxi to airport'),
	(35, 14, 3, 5, NULL, '2018-09-13', 'Bus');
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;

-- Дамп структуры для таблица budget_planner.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_email_uindex` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы budget_planner.user: ~3 rows (приблизительно)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `name`, `password`, `email`) VALUES
	(1, 'Tarlan', '123', 'tabdullayev@mum.edu'),
	(2, 'Zair', '123', 'zolimov@mum.edu'),
	(3, 'Olzhas', '123', 'okalmurzayev@mum.edu');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

-- Дамп структуры для таблица budget_planner.wallet
CREATE TABLE IF NOT EXISTS `wallet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `balance` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wallet_user_id_fk` (`user_id`),
  CONSTRAINT `wallet_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы budget_planner.wallet: ~8 rows (приблизительно)
/*!40000 ALTER TABLE `wallet` DISABLE KEYS */;
INSERT INTO `wallet` (`id`, `name`, `user_id`, `balance`) VALUES
	(1, 'Cash', 1, 157.12),
	(2, 'MidWestOne visa', 1, 400.12),
	(3, 'Cash', 2, 20.5),
	(4, 'Visa *0828', 2, 75.2),
	(5, 'Savings bank account', 2, 600.25),
	(6, 'CreditCard *0393', 2, 1000),
	(7, 'Cash', 3, 81.93),
	(8, 'MidwestOne visa card', 3, 159);
/*!40000 ALTER TABLE `wallet` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
