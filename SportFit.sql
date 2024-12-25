-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Дек 25 2024 г., 18:07
-- Версия сервера: 8.0.30
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `SportFit`
--

-- --------------------------------------------------------

--
-- Структура таблицы `BRANDS`
--

CREATE TABLE `BRANDS` (
  `BRAND_ID` int NOT NULL,
  `NAME` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `BRANDS`
--

INSERT INTO `BRANDS` (`BRAND_ID`, `NAME`) VALUES
(1, 'Nike'),
(2, 'Adidas'),
(3, 'Puma'),
(4, 'Under Armour'),
(5, 'Reebok'),
(6, 'Asics');

-- --------------------------------------------------------

--
-- Структура таблицы `CATEGORIES`
--

CREATE TABLE `CATEGORIES` (
  `CATEGORY_ID` int NOT NULL,
  `NAME` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `CATEGORIES`
--

INSERT INTO `CATEGORIES` (`CATEGORY_ID`, `NAME`) VALUES
(1, 'Фитнес'),
(2, 'Бег'),
(3, 'Йога'),
(4, 'Тренажеры'),
(5, 'Аксессуары'),
(6, 'Питание');

-- --------------------------------------------------------

--
-- Структура таблицы `CLIENTS`
--

CREATE TABLE `CLIENTS` (
  `C_NO` int NOT NULL,
  `FIO` varchar(40) NOT NULL,
  `ADDR` varchar(30) NOT NULL,
  `CITY` varchar(15) NOT NULL,
  `PHONE` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `CLIENTS`
--

INSERT INTO `CLIENTS` (`C_NO`, `FIO`, `ADDR`, `CITY`, `PHONE`) VALUES
(1, 'Иванов Иван Иванович', 'ул. Ленина, 10', 'Москва', '89001234567'),
(2, 'Петров Петр Петрович', 'ул. Садовая, 5', 'Санкт-Петербург', '89007654321'),
(3, 'Смирнов Алексей Александрович', 'ул. Гагарина, 15', 'Екатеринбург', '89121234567'),
(4, 'Савельева Мария Ивановна', 'пр. Победы, 25', 'Новосибирск', '89137654321');

-- --------------------------------------------------------

--
-- Структура таблицы `ORDERS`
--

CREATE TABLE `ORDERS` (
  `ORDER_ID` int NOT NULL,
  `C_NO` int NOT NULL,
  `ORDER_DATE` date NOT NULL,
  `STATUS` varchar(20) NOT NULL,
  `TOTAL_PRICE` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `ORDERS`
--

INSERT INTO `ORDERS` (`ORDER_ID`, `C_NO`, `ORDER_DATE`, `STATUS`, `TOTAL_PRICE`) VALUES
(1, 1, '2024-12-01', 'Доставлено', '7999.99'),
(3, 1, '2024-12-23', 'Оплачено', '7499.99'),
(4, 3, '2024-12-24', 'В обработке', '8999.00');

-- --------------------------------------------------------

--
-- Структура таблицы `PRODUCTS`
--

CREATE TABLE `PRODUCTS` (
  `PRODUCT_ID` int NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `PRICE` decimal(10,2) NOT NULL,
  `STOCK` int NOT NULL,
  `CATEGORY_ID` int NOT NULL,
  `BRAND_ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `PRODUCTS`
--

INSERT INTO `PRODUCTS` (`PRODUCT_ID`, `NAME`, `PRICE`, `STOCK`, `CATEGORY_ID`, `BRAND_ID`) VALUES
(1, 'Кроссовки Nike Air Max', '7999.99', 50, 2, 1),
(2, 'Коврик для йоги', '1499.50', 100, 3, 2),
(3, 'Гантели 5 кг', '3499.00', 30, 1, 3),
(4, 'Тренажер для пресса', '8999.00', 25, 1, 1),
(5, 'Сумка для фитнеса', '2499.00', 40, 2, 2),
(6, 'Протеин 2 кг', '1299.00', 70, 3, 3);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `BRANDS`
--
ALTER TABLE `BRANDS`
  ADD PRIMARY KEY (`BRAND_ID`);

--
-- Индексы таблицы `CATEGORIES`
--
ALTER TABLE `CATEGORIES`
  ADD PRIMARY KEY (`CATEGORY_ID`);

--
-- Индексы таблицы `CLIENTS`
--
ALTER TABLE `CLIENTS`
  ADD PRIMARY KEY (`C_NO`);

--
-- Индексы таблицы `ORDERS`
--
ALTER TABLE `ORDERS`
  ADD PRIMARY KEY (`ORDER_ID`),
  ADD KEY `C_NO` (`C_NO`);

--
-- Индексы таблицы `PRODUCTS`
--
ALTER TABLE `PRODUCTS`
  ADD PRIMARY KEY (`PRODUCT_ID`),
  ADD KEY `CATEGORY_ID` (`CATEGORY_ID`),
  ADD KEY `BRAND_ID` (`BRAND_ID`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `BRANDS`
--
ALTER TABLE `BRANDS`
  MODIFY `BRAND_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `CATEGORIES`
--
ALTER TABLE `CATEGORIES`
  MODIFY `CATEGORY_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `CLIENTS`
--
ALTER TABLE `CLIENTS`
  MODIFY `C_NO` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `ORDERS`
--
ALTER TABLE `ORDERS`
  MODIFY `ORDER_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `PRODUCTS`
--
ALTER TABLE `PRODUCTS`
  MODIFY `PRODUCT_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `ORDERS`
--
ALTER TABLE `ORDERS`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`C_NO`) REFERENCES `CLIENTS` (`C_NO`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `PRODUCTS`
--
ALTER TABLE `PRODUCTS`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `CATEGORIES` (`CATEGORY_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`BRAND_ID`) REFERENCES `BRANDS` (`BRAND_ID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
