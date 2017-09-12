-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 09, 2016 at 05:19 AM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bbcomics`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `buyer_id`, `product_id`) VALUES
(9, 0, 1),
(10, 0, 1),
(11, 0, 1),
(12, 0, 1),
(13, 0, 1),
(14, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `id` int(11) NOT NULL,
  `event_type_id` int(11) NOT NULL,
  `user_1_id` int(11) NOT NULL,
  `user_2_id` int(11) DEFAULT NULL,
  `product_1_id` int(11) DEFAULT NULL,
  `product_2_id` int(11) DEFAULT NULL,
  `data_1` text,
  `data_2` text,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `event_type`
--

CREATE TABLE `event_type` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `event_type`
--

INSERT INTO `event_type` (`id`, `name`) VALUES
(1, 'add_product'),
(2, 'follow_user'),
(3, 'reviewed_product');

-- --------------------------------------------------------

--
-- Table structure for table `follow`
--

CREATE TABLE `follow` (
  `id` int(11) NOT NULL,
  `follower_id` int(11) NOT NULL,
  `followee_id` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(30) NOT NULL,
  `title` varchar(200) NOT NULL,
  `ptype` varchar(50) NOT NULL,
  `category` varchar(50) NOT NULL,
  `description` text,
  `price` decimal(10,2) NOT NULL,
  `quantity` int(100) NOT NULL,
  `img-url` varchar(200) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creator_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `title`, `ptype`, `category`, `description`, `price`, `quantity`, `img-url`, `date_created`, `creator_id`) VALUES
(1, 'The BAmazing Spiderman', 'new', 'marvel', 'The Amazing Spiderman fights his greatest foe yet Green Goblin...', '7.99', 10, '1.jpg', '2016-11-16 03:39:03', 1),
(2, 'killingjoke', 'new', 'dc', 'Joker is running loose again and this time Batman means to end it...', '10.00', 2, 'killingjoke.jpg', '2016-10-16 15:20:57', 2),
(3, 'rai', 'hot', 'misc', 'Rai takes on his greatest foe yet.', '5.99', 20, 'rai.jpg', '2016-10-16 15:21:15', 1),
(4, 'capamerican', 'recommended', 'marvel', 'Captain America is revived from the grave!', '6.99', 6, 'cap.jpg', '2016-10-16 15:20:45', 1),
(5, 'xmen', 'featured', 'marvel', 'Logan vs. Scott', '8.99', 7, 'wolverine.jpg', '2016-10-16 15:21:34', 2),
(6, 'onepiece', 'new', 'manga', 'Upon Gold D. Rogers Execution, young aspiring pirates explore to find his treasure, One Piece. A young pirate named Monkey D. Luffy, determined, ventures the grand line to find nakama and become the pirate king', '20.99', 20, 'onepiece.jpg', '2016-10-16 15:21:06', 2),
(7, 'daredevil', 'hot', 'marvel', 'Matt Mardock is a blind lawyer who secretly fights crime in the city of Hell''s Kitchen. With heightened senses and acrobatic techniques, villains fear him through the name Daredevil.', '8.99', 4, 'daredevil.jpg', '2016-10-16 15:20:52', 2),
(8, 'alphaflight', 'hot', 'marvel', 'Alpha Flying Plane fighters does stuff.', '1.99', 1, 'alphaflight.jpg', '2016-10-16 15:20:09', 1),
(9, 'ultraspiderman', 'recommended', 'marvel', 'Peter Parkers back in an all new attire. Black spider man! With the symbiote fusion Spiderman is the all new Ultimate Spiderman!', '12.50', 15, 'ultspiderman.jpg', '2016-10-16 15:21:27', 2),
(10, 'superman', 'featured', 'dc', 'Superman, secretly disguised as Clark Kent, must fight his greatest foe Lex Luthor from mind-controlling everyone in Metropolis.', '20.25', 2, 'superman.jpg', '2016-10-16 15:21:20', 2),
(11, 'battle', 'featured', 'misc', 'Battle battle battle and more battling', '0.99', 99, 'battle.jpg', '2016-10-16 15:20:25', 1),
(12, 'blueex', 'recommended', 'manga', 'Blue-ex is a blue person.', '7.99', 0, 'blueex.jpg', '2016-10-16 15:20:37', 1),
(13, 'Walking Dead Comic', 'display', 'walkingdead', 'WalkingDeadBanner', '0.00', 0, 'WDComic.jpg', '2016-10-16 16:44:19', 1),
(14, 'walkingdeadissue1', 'new', 'walkingdead', 'Rick Grimes wakes up to a world of zombies and must find his family and survive.', '7.99', 3, 'wd1.jpg', '2016-10-16 16:13:35', 1),
(15, 'walkingdeadissue5', 'new', 'walkingdead', 'Rick Grimes and Carl fight through the zombie horde.', '7.99', 4, 'wd5.jpg', '2016-10-16 16:13:35', 1),
(16, 'walkingdeadissue106', 'hot', 'walkingdead', 'Carl gets trained to hold a pistol and fight against walkers.', '7.99', 6, 'wd106.jpg', '2016-10-16 16:13:35', 1),
(17, 'walkingdeadissue140', 'hot', 'walkingdead', 'Maggie deals with the grief of losing her family on the farm. Hershel is still in shock.', '7.99', 7, 'wd140.jpeg', '2016-10-16 16:13:35', 1),
(18, 'walkingdeadissue66', 'recommended', 'walkingdead', 'Rick and his group arrive at Hershel''s farm, run by Hershel, an ex-doctor. IS this the start of a new beginning?', '7.99', 5, 'wd66.jpg', '2016-10-16 16:13:35', 1),
(19, 'walkingdeadissue17', 'recommended', 'walkingdead', 'Rick and his friends leave Atlanta and go north of Georgia.', '7.99', 10, 'wd17.png', '2016-10-16 16:13:35', 1),
(20, 'walkingdeadissue75', 'featured', 'walkingdead', 'Rick and Seth get in a fight to be the leader of the group. Only one can stand on top while the other meets their demise.', '7.99', 1, 'wd75.jpg', '2016-10-16 16:13:35', 1),
(21, 'walkingdeadissue114', 'featured', 'walkingdead', 'Rick and his friends arrive at a Prison. It''s heavily fortified. What awaits them at this new location?', '7.99', 8, 'wd114.jpg', '2016-10-16 16:13:35', 2),
(22, 'walkingdeadissue10', 'new', 'walkingdead', 'Jim travels alone, soon meeting his death from being bitten. Jim tries to find peace before he passes.', '7.99', 1, 'wd10.jpg', '2016-10-16 16:13:35', 2),
(39, 'delete this', '', '', '', '0.00', 0, NULL, '2016-11-16 03:39:30', 4);

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `id` int(11) NOT NULL,
  `reviewer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `review` text NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `username` varchar(100) NOT NULL,
  `pw` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `role` varchar(30) NOT NULL DEFAULT 'user',
  `description` varchar(500) DEFAULT NULL,
  `gender` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `pw`, `email`, `role`, `description`, `gender`) VALUES
(1, 'Carlos', 'Gallegos', 'pacog94', 'gamecube1', 'pacog94@vt.edu', 'user', 'Hello my name is Carlos. I love comics', ''),
(2, 'Matt', 'B', 'mattb', 'mattb', 'mattb@vt.edu', 'user', 'Mattb, here. I like marvel and dc comics!', 'female'),
(3, 'Fiona', 'Kim', 'fionak', 'pw', 'vldsao@gmail.com', 'user', NULL, 'other'),
(4, 'root', 'root', 'root', 'root', 'root', 'admin', 'ADMIN HAS CONTROL OF DELETE and EDIT.', ''),
(5, 'Eunjee', 'Kim', 'eunjeeK', 'hello', 'silver', '', NULL, ''),
(6, 'hello', 'hello', 'hello', 'hello', 'hello', '', NULL, ''),
(7, '4', '4', '4', '4', '4', '', NULL, ''),
(8, '', '', 'matt3', 'matt3', '', '', NULL, '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event_type`
--
ALTER TABLE `event_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `follow`
--
ALTER TABLE `follow`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `follower_id` (`follower_id`),
  ADD UNIQUE KEY `followee_id` (`followee_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `creator_id` (`creator_id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviewer_id` (`reviewer_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `event_type`
--
ALTER TABLE `event_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `follow`
--
ALTER TABLE `follow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
