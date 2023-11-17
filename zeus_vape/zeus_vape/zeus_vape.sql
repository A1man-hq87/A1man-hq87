-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 28, 2023 at 09:44 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `zeus_vape`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'unpaid',
  `address` text DEFAULT NULL,
  `tracking_num` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `uid`, `product_id`, `amount`, `status`, `address`, `tracking_num`, `date`) VALUES
(3, 3, 5, 3, 'Order Received', 'Magical Land, Lot 192, 82000 Mountain, Not Earth', '620001441192675', '2022-05-05'),
(4, 3, 3, 12, 'Order Received', 'Lot 197, Lorong 21, Taman King Kong, 90000 Ulo, Malaysia', '620001441192675', '2022-05-05'),
(5, 3, 6, 12, 'paid', 'Lot 192, Lorong 21, Taman Kojo, 29000, Malaysia', NULL, '2022-05-05'),
(6, 3, 5, 1, 'paid', 'Taman Mage, Lot 21, 90000, Joling, Hiking', NULL, '2022-05-05');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `categories_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categories_id`, `name`) VALUES
(1, 'Fruit Seed'),
(2, 'Vegetable Seed'),
(3, 'Vegetable'),
(4, 'Fruit'),
(5, 'Meat'),
(6, 'Flower');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `picture` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` text NOT NULL,
  `categories_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `name`, `picture`, `price`, `description`, `categories_id`) VALUES
(2, 'Watermelon Seed (x100)', '20220503163334.jpg', '5.50', 'Watermelon Seeds imported from USA!\r\n\r\nNO SEEDS!\r\nSWEET!', 1),
(3, 'Minecraft Potato (1KG)', '20220503163543.jpg', '20.00', 'VERY GOOD!!!!\r\n\r\nEAT ME!!!', 3),
(4, 'Minecraft Melon (1KG)', '20220503163755.jpg', '5.50', 'Square? Why not?\r\n', 4),
(5, 'Banana (1KG)', '20220503163946.jpg', '8.50', 'Banana? You want big or small?', 4),
(6, 'Sun Flower Seed MEGA (x10)', '20220505192102.jpg', '21.20', 'This is just testing!\r\n\r\nSUN FLOWER SEED!!!', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `uid` int(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `permission` varchar(255) NOT NULL DEFAULT 'member',
  `profile_pic` varchar(255) NOT NULL DEFAULT 'user.jpg',
  `join_date` date DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`uid`, `email`, `username`, `password`, `permission`, `profile_pic`, `join_date`) VALUES
(3, 'limwilson2013@gmail.com', 'Cat2246MC', '123456', 'member', '20220503215023.png', '2022-05-04'),
(4, 'admin@gmail.com', 'Admin', '123456', 'System Admin', 'user.jpg', '2022-05-04'),
(5, 'john@gmail.com', 'John Wick', '123456', 'member', 'user.jpg', '2022-05-06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categories_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `categories_id` (`categories_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`uid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `categories_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `uid` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`categories_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
