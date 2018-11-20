-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Ноя 20 2018 г., 04:47
-- Версия сервера: 10.1.31-MariaDB
-- Версия PHP: 5.6.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `budget_planner`
--

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id`, `name`, `sort_order`, `type`, `user_id`, `icon`, `parent_id`) VALUES
(1, 'Food', 1, 'expence', 1, 'fa-cutlery', 0),
(2, 'Car', 1, 'expence', 1, 'fa-car', 0),
(3, 'Bills', 1, 'expence', 1, 'fa-money', 0),
(4, 'Taxes', 1, 'expence', 1, 'fa-money', 3),
(5, 'Shopping', 1, 'expence', 1, 'fa-shopping-cart', 0),
(6, 'Sports', 1, 'expence', 1, 'fa-bicycle', 0),
(7, 'Education', 1, 'expence', 1, 'fa-book', 0),
(8, 'Medicine', 1, 'expence', 1, 'fa-medkit', 0),
(9, 'Friends', 1, 'expence', 1, 'fa-users', 0),
(10, 'Charity', 1, 'expence', 1, 'fa-thumbs-up', 0),
(11, 'Salary', 1, 'income', 1, 'fa-money', 0),
(12, 'Other', 1, 'income', 1, 'fa-bars', 0),
(13, 'Food', 1, 'expence', 2, 'fa-cutlery', 0),
(14, 'Transport', 1, 'expence', 2, 'fa-bus', 0),
(15, 'Rent', 1, 'expence', 2, 'fa-home', 0),
(16, 'Clothes', 1, 'expence', 2, 'fa-user-secret', 0),
(17, 'Sport', 1, 'expence', 2, 'fa-spotify', 0),
(18, 'Accessories', 1, 'expence', 2, 'fa-headphones', 20),
(19, 'Journeys', 1, 'expence', 2, 'fa-plane', 0),
(20, 'Electronics', 1, 'expence', 2, 'fa-laptop', 0),
(21, 'Salary', 1, 'income', 2, 'fa-money', 0),
(22, 'Other', 1, 'income', 2, 'fa-bar', 0),
(23, 'Cafe', 1, 'expence', 3, 'fa-cutlery', 0),
(24, 'Travel', 1, 'expence', 3, 'fa-plane', 0),
(25, 'Health', 1, 'expence', 3, 'fa-medkit', 0),
(26, 'House', 1, 'expence', 3, 'fa-home', 0),
(27, 'Insurance', 1, 'expence', 3, 'fa-file-excel-o', 0),
(28, 'Salary', 1, 'income', 3, 'fa-money', 0),
(29, 'Other', 1, 'income', 3, 'fa-bar', 0),
(30, 'Food', 1, 'expence', 3, 'fa-cutlery', 0),
(31, 'Gifts', 1, 'expence', 2, 'fa-gift', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `transaction`
--

CREATE TABLE `transaction` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `wallet_id` int(11) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `transaction`
--

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

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `email`) VALUES
(1, 'Tarlan', '123', 'tabdullayev@mum.edu'),
(2, 'Zair', '123', 'zolimov@mum.edu'),
(3, 'Olzhas', '123', 'okalmurzayev@mum.edu');

-- --------------------------------------------------------

--
-- Структура таблицы `wallet`
--

CREATE TABLE `wallet` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `balance` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `wallet`
--

INSERT INTO `wallet` (`id`, `name`, `user_id`, `balance`) VALUES
(1, 'Cash', 1, 157.12),
(2, 'MidWestOne visa', 1, 400.12),
(3, 'Cash', 2, 20.5),
(4, 'Visa *0828', 2, 75.2),
(5, 'Savings bank account', 2, 600.25),
(6, 'CreditCard *0393', 2, 1000),
(7, 'Cash', 3, 81.93),
(8, 'MidwestOne visa card', 3, 159),
(9, 'asd', 1, 123),
(10, 'asddd', 1, 22);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_user_id_fk` (`user_id`);

--
-- Индексы таблицы `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_category_id_fk` (`category_id`),
  ADD KEY `transaction_wallet_id_fk` (`wallet_id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_email_uindex` (`email`);

--
-- Индексы таблицы `wallet`
--
ALTER TABLE `wallet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wallet_user_id_fk` (`user_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT для таблицы `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `wallet`
--
ALTER TABLE `wallet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `category_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `transaction_category_id_fk` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `transaction_wallet_id_fk` FOREIGN KEY (`wallet_id`) REFERENCES `wallet` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `wallet`
--
ALTER TABLE `wallet`
  ADD CONSTRAINT `wallet_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
