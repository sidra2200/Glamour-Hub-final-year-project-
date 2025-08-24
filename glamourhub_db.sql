-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 19, 2025 at 08:48 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `glamourhub_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_booking`
--

CREATE TABLE `tbl_booking` (
  `booking_id` int(11) NOT NULL,
  `booking_date` date DEFAULT NULL,
  `booking_time` varchar(100) DEFAULT NULL,
  `fk_user_id` int(11) DEFAULT NULL,
  `booking_status` enum('P','A','R','C','CMP') NOT NULL DEFAULT 'P',
  `booking_total_price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_booking`
--

INSERT INTO `tbl_booking` (`booking_id`, `booking_date`, `booking_time`, `fk_user_id`, `booking_status`, `booking_total_price`) VALUES
(1, '2025-05-18', '11:39', 15, 'C', 2000),
(2, '2025-05-18', '11:44', 15, 'A', 8000);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_booking_detail`
--

CREATE TABLE `tbl_booking_detail` (
  `bd_id` int(11) NOT NULL,
  `fk_booking_id` int(11) DEFAULT NULL,
  `fk_subservice_id` int(11) DEFAULT NULL,
  `fk_staff_id` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_booking_detail`
--

INSERT INTO `tbl_booking_detail` (`bd_id`, `fk_booking_id`, `fk_subservice_id`, `fk_staff_id`) VALUES
(1, 1, 17, 14),
(2, 2, 13, 14);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_feedback`
--

CREATE TABLE `tbl_feedback` (
  `feedback_id` int(11) NOT NULL,
  `feedback_title` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `dateTime` int(11) NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_feedback`
--

INSERT INTO `tbl_feedback` (`feedback_id`, `feedback_title`, `user_id`, `rating`, `dateTime`) VALUES
(1, 'Had a great Experience .Highly recommended!', 3, 4, 2147483647),
(3, 'experience was good', 0, 3, 2147483647),
(4, 'good', 3, 3, 2147483647);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_notifications`
--

CREATE TABLE `tbl_notifications` (
  `n_id` int(11) NOT NULL,
  `n_title` varchar(200) DEFAULT NULL,
  `n_for` enum('A','S','C') DEFAULT NULL,
  `n_for_id` int(11) DEFAULT NULL,
  `n_type` enum('booking','CMP') DEFAULT NULL,
  `n_typeid` int(11) DEFAULT 0,
  `n_createdDateTime` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_notifications`
--

INSERT INTO `tbl_notifications` (`n_id`, `n_title`, `n_for`, `n_for_id`, `n_type`, `n_typeid`, `n_createdDateTime`) VALUES
(1, 'New Booking Request Recieved', 'A', 7, 'booking', 0, '2025-05-18 23:30:25'),
(2, 'New Booking Assigned To You', 'S', 14, 'booking', 0, '2025-05-18 23:31:20'),
(3, 'New Booking Request Recieved', 'A', 7, 'booking', 0, '2025-05-18 23:37:10'),
(4, 'New Booking Request Recieved', 'A', 7, 'booking', 0, '2025-05-18 23:38:56'),
(5, 'New Booking Assigned To You', 'S', 14, 'booking', 0, '2025-05-18 23:39:11'),
(6, 'Saloon Accepted Your Booking', 'C', 15, 'booking', 0, '2025-05-18 23:39:11'),
(7, 'Customer Cancel their Booking', 'A', 7, 'booking', 0, '2025-05-18 23:40:50'),
(8, 'New Booking Request Recieved', 'A', 7, 'booking', 0, '2025-05-18 23:43:53'),
(9, 'New Booking Assigned To You', 'S', 14, 'booking', 0, '2025-05-18 23:44:40'),
(10, 'Saloon Accepted Your Booking', 'C', 15, 'booking', 0, '2025-05-18 23:44:40');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_service`
--

CREATE TABLE `tbl_service` (
  `service_id` int(11) NOT NULL,
  `service_title` varchar(255) DEFAULT NULL,
  `service_image` varchar(255) DEFAULT NULL,
  `service_status` enum('A','B') NOT NULL DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_service`
--

INSERT INTO `tbl_service` (`service_id`, `service_title`, `service_image`, `service_status`) VALUES
(6, 'Mehndi', '944511f88d64a886d1992f031874345d.png', 'A'),
(8, 'Hair', 'IMG-20250222-WA0013.jpg', 'A'),
(9, 'Makeup', 'IMG-20250222-WA0005.jpg', 'A'),
(11, 'Nails', '1745646850772.jpg', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sub_services`
--

CREATE TABLE `tbl_sub_services` (
  `ss_id` int(11) NOT NULL,
  `ss_title` varchar(255) DEFAULT NULL,
  `ss_image` varchar(255) DEFAULT NULL,
  `ss_description` varchar(255) DEFAULT NULL,
  `ss_price` int(11) DEFAULT NULL,
  `ss_duration` varchar(100) DEFAULT NULL,
  `fk_service_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_sub_services`
--

INSERT INTO `tbl_sub_services` (`ss_id`, `ss_title`, `ss_image`, `ss_description`, `ss_price`, `ss_duration`, `fk_service_id`) VALUES
(12, 'bridal makeup', 'IMG-20250216-WA0004.jpg', 'heavy bridal makeup', 5000, '4', 9),
(13, 'hair keratin', '1745646761316.jpg', 'hair keratin treatment', 8000, '4', 8),
(15, 'party mehndi', 'IMG-20250330-WA0037.jpg', 'Bridal mehndi', 5000, '3', 6),
(16, 'Short nails', '1745646850772.jpg', 'short', 10000, '1', 11),
(17, 'hair', 'IMG-20250222-WA0016.jpg', 'hair', 2000, '2', 8);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  `user_cnic` varchar(200) DEFAULT NULL,
  `user_contact` varchar(200) DEFAULT NULL,
  `user_status` enum('A','B') NOT NULL,
  `user_type` enum('A','C','SM') NOT NULL,
  `user_address` varchar(255) DEFAULT NULL,
  `user_speciality` varchar(200) DEFAULT NULL,
  `user_createdDateTime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`user_id`, `user_name`, `user_email`, `user_password`, `user_cnic`, `user_contact`, `user_status`, `user_type`, `user_address`, `user_speciality`, `user_createdDateTime`) VALUES
(1, 'werty', 'abc@gmail.com', 'd1999a2caf49c63987d19e2ee981ead8', '21245789', '65468900', 'A', 'C', NULL, NULL, '2025-03-08 22:43:48'),
(3, 'Javeria Niaz', 'javeria777@gmail.com\r\n', 'e10adc3949ba59abbe56e057f20f883e', 'Javeria777@gmail.com', '0313986599', 'A', 'C', 'islamabad', NULL, '2025-03-16 00:08:47'),
(6, 'test', 'test@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '123211', '032133443', 'A', 'C', NULL, NULL, '2025-04-05 23:40:40'),
(7, 'admin', 'admin@admin.com', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'A', 'A', NULL, NULL, '2025-03-15 23:58:05'),
(10, 'haleema', 'haleema@gmail.com', '1d3c75aaad98cffe18c7afb28f931cb1', '256349508646', '34682903938', 'B', 'SM', 'Islamabad', 'Nails', '2025-04-06 00:41:07'),
(11, 'Ayesha', 'ayesha@gmail.com', '123456', '0312535236', '0762751681', 'A', 'SM', 'islamabad', 'EyeLashes', '2025-04-23 00:38:35'),
(12, 'sana', 'sana@gmail.com', 'f3e9c8e110e1cb09d5f343c1cbf6df41', '06163481', '037297289779', 'A', 'SM', 'karachi', 'Makeup', '2025-04-23 00:40:08'),
(13, 'ayesha', 'Ayesha777@gmail.com', 'a5d4dc2614ce1c0b88947f0b138e6f42', '5203135632', '1344567', 'A', 'SM', 'rawalpindi', 'Mehndi', '2025-04-28 01:53:03'),
(14, 'sidra', 'sidra777@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '0315632566', '123432214', 'A', 'SM', 'islamabad', 'Hair', '2025-04-28 02:00:23'),
(15, 'Javeria', 'javerianiaz777@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '123456789', '032789791', 'A', 'C', NULL, NULL, '2025-04-28 03:07:47'),
(16, 'beenish', 'beenish@gmail.com', '89eb67676d0f1d57064aa062f56906f1', '0312312356', '097578965589', 'A', 'SM', 'islamabad', 'Nails', '2025-05-04 00:25:39'),
(17, 'ehsa', 'esha@gmail.com', '2217b3c7cae4e527463a60aa5bcc1303', '031356325632', '097546890', 'A', 'SM', 'islamabad', 'Makeup', '2025-05-05 01:14:08');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_booking`
--
ALTER TABLE `tbl_booking`
  ADD PRIMARY KEY (`booking_id`);

--
-- Indexes for table `tbl_booking_detail`
--
ALTER TABLE `tbl_booking_detail`
  ADD PRIMARY KEY (`bd_id`);

--
-- Indexes for table `tbl_feedback`
--
ALTER TABLE `tbl_feedback`
  ADD PRIMARY KEY (`feedback_id`);

--
-- Indexes for table `tbl_notifications`
--
ALTER TABLE `tbl_notifications`
  ADD PRIMARY KEY (`n_id`);

--
-- Indexes for table `tbl_service`
--
ALTER TABLE `tbl_service`
  ADD PRIMARY KEY (`service_id`);

--
-- Indexes for table `tbl_sub_services`
--
ALTER TABLE `tbl_sub_services`
  ADD PRIMARY KEY (`ss_id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_booking`
--
ALTER TABLE `tbl_booking`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_booking_detail`
--
ALTER TABLE `tbl_booking_detail`
  MODIFY `bd_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_feedback`
--
ALTER TABLE `tbl_feedback`
  MODIFY `feedback_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_notifications`
--
ALTER TABLE `tbl_notifications`
  MODIFY `n_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_service`
--
ALTER TABLE `tbl_service`
  MODIFY `service_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tbl_sub_services`
--
ALTER TABLE `tbl_sub_services`
  MODIFY `ss_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
