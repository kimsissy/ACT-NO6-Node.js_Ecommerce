-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 01, 2024 at 05:23 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `merchandise`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` float(10,2) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `image`) VALUES
(1, 'Taylor Swift T-Shirt Eras Tour', 'A stylish Taylor Swift T-Shirt Eras tour for all the Swifties out there!', 19.99, '/images/era.jpg'),
(2, 'Taylor Swift T-shirt', 'A stylish Taylor Swift Black T-shirt eras tour for all the Swifties out there!', 19.99, '/images/black1.jpg'),
(3, 'Taylor Swift T-shirt Fearless', 'A stylish Taylor Swift Black T-shirt Fearless for all the Swifties out there!', 19.99, '/images/itmfr.jpg'),
(4, 'Taylor Swift T-shirt Speak Now', 'A stylish Taylor Swift Cream T-Shirt Speak Now for all the Swifties out there!', 19.99, '/images/itemspk.jpg'),
(5, 'Taylor Swift Folklore Hoodie', 'A stylish Taylor Swift Cream Folklore Hoodie for all the Swifties out there!', 29.99, '/images/fl.jpg'),
(6, 'Taylor Swift Brown Hoodie', 'A stylish Taylor Swift Brown Hoodie for all the Swifties out there!', 29.99, '/images/brownhoodie.jpg'),
(7, 'Taylor Swift White Hoodie', 'A stylish Taylor Swift White Hoodie for all the Swifties out there!', 29.99, '/images/whitehoodie.jpg'),
(8, 'Taylor Swift Hoodie', 'A stylish Taylor Swift Hoodie for all the Swifties out there!', 29.99, '/images/astighoodie.jpg'),
(9, 'Taylor Swift Red Hoodie', 'Taylor Swift Red Hoodie for all the Red Stan Swiftie!', 25.99, '/images/1727745600557_hoodiered.jpg'),
(10, 'Taylor Swiftie Junior  Jewel', 'A stylish Taylor Swift Junior Jewel all the Swifties out there!', 29.99, '/images/1727745711429_jewel.jpg'),
(12, 'Taylor Swift Keychain', 'Taylor Swift keychain chic, iconic, portable, perfect for every Swiftie.', 3.50, '/images/1727746228168_keychain.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `purchase_date` datetime DEFAULT current_timestamp(),
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`id`, `product_id`, `purchase_date`, `user_id`) VALUES
(1, 2, '2024-09-30 20:55:47', NULL),
(2, 4, '2024-09-30 20:57:19', NULL),
(3, 2, '2024-09-30 21:02:59', NULL),
(4, 2, '2024-09-30 21:14:10', NULL),
(5, 2, '2024-09-30 21:27:41', NULL),
(6, 2, '2024-09-30 21:28:05', NULL),
(7, 2, '2024-09-30 21:28:27', NULL),
(8, 3, '2024-09-30 21:39:15', NULL),
(9, 3, '2024-09-30 21:43:10', NULL),
(10, 3, '2024-09-30 21:46:15', NULL),
(11, 4, '2024-10-01 08:09:54', NULL),
(12, 4, '2024-10-01 08:10:08', NULL),
(13, 4, '2024-10-01 08:10:25', NULL),
(14, 2, '2024-10-01 08:10:57', NULL),
(15, 8, '2024-10-01 08:28:30', NULL),
(16, 6, '2024-10-01 08:28:36', NULL),
(17, 8, '2024-10-01 08:30:59', NULL),
(18, 7, '2024-10-01 08:41:24', NULL),
(19, 3, '2024-10-01 08:51:16', NULL),
(20, 2, '2024-10-01 08:52:00', NULL),
(21, 4, '2024-10-01 09:10:30', NULL),
(22, 7, '2024-10-01 09:36:23', NULL),
(23, 3, '2024-10-01 11:22:21', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `purchases`
--
ALTER TABLE `purchases`
  ADD CONSTRAINT `purchases_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
