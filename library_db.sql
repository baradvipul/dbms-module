-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 27, 2025 at 07:10 AM
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
-- Database: `library_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `author_id` int(11) NOT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`author_id`, `first_name`, `last_name`, `country`) VALUES
(1, 'Rohan', 'Sharma', 'India'),
(2, 'Amit', 'Verma', 'India'),
(3, 'Suresh', 'Patel', 'India'),
(4, 'Vikram', 'Rao', 'India'),
(5, 'Arjun', 'Kumari', 'India'),
(6, 'Neha', 'Joshi', 'India'),
(7, 'Pooja', 'Desai', 'India'),
(8, 'Karan', 'Mehta', 'India'),
(9, 'Ishita', 'Kapoor', 'India'),
(10, 'Rajeev', '', 'India');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `book_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `author` varchar(200) NOT NULL,
  `publisher` varchar(200) NOT NULL,
  `year_of_publication` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `genre` varchar(100) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`book_id`, `title`, `author`, `publisher`, `year_of_publication`, `price`, `genre`, `author_id`) VALUES
(1, 'Dark Souls', 'Rohan Sharma', 'Bandai Namco', 2011, 4999, 'Action RPG', 1),
(2, 'Lies of P', 'Amit Verma', 'Neowiz', 2023, 4599, 'Souls-like', 2),
(3, 'Bloodborne', 'Suresh Patel', 'FromSoftware', 2015, 3999, 'Gothic Action', 3),
(4, 'Sekiro', 'Vikram Rao', 'Activision', 2019, 4299, 'Action Adventure', 4),
(5, 'Star Wars Jedi', 'Arjun Kumari', 'EA', 2020, 4999, 'Sci-Fi Action', 5),
(6, 'Remnant', 'Rajeev', 'Perfect World', 2019, 3799, 'Co-op RPG', 6);

--
-- Triggers `books`
--
DELIMITER $$
CREATE TRIGGER `book_delete_tri` AFTER DELETE ON `books` FOR EACH ROW BEGIN
    INSERT INTO delete_log (book_id, title, author)
    VALUES (OLD.book_id, OLD.title, OLD.author);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_log` AFTER UPDATE ON `books` FOR EACH ROW BEGIN
    INSERT INTO update_log (book_id, old_title, new_title, old_price, new_price)
    VALUES 
    (
        OLD.book_id,
        OLD.title,
        NEW.title,
        OLD.price,
        NEW.price
    );
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `books_summary`
-- (See below for the actual view)
--
CREATE TABLE `books_summary` (
`title` varchar(255)
,`author` varchar(200)
,`price` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `delete_log`
--

CREATE TABLE `delete_log` (
  `log_id` int(11) NOT NULL,
  `book_id` int(11) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `author` varchar(100) DEFAULT NULL,
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `delete_log`
--

INSERT INTO `delete_log` (`log_id`, `book_id`, `title`, `author`, `deleted_at`) VALUES
(1, 3, 'Bloodborne', 'Suresh Patel', '2025-11-27 06:02:39'),
(2, 6, 'Remnant', 'Rajeev', '2025-11-27 06:02:39');

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `member_id` int(11) NOT NULL,
  `member_name` varchar(100) NOT NULL,
  `date_of_membership` date NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`member_id`, `member_name`, `date_of_membership`, `email`) VALUES
(1, 'Vipul', '2024-01-15', 'vipul@gmail.com'),
(2, 'priyankar', '2023-07-20', 'priyankar@gmail.com'),
(3, 'Kunal', '2022-11-05', 'kunal@gmail.com'),
(4, 'uday', '2021-03-12', 'uday@gmail.com'),
(5, 'Arav', '2020-09-28', 'arav@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `members_backup`
--

CREATE TABLE `members_backup` (
  `member_id` int(11) NOT NULL,
  `member_name` varchar(100) NOT NULL,
  `date_of_membership` date NOT NULL,
  `email` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `members_backup`
--

INSERT INTO `members_backup` (`member_id`, `member_name`, `date_of_membership`, `email`) VALUES
(1, 'Vipul', '2024-01-15', 'vipul@gmail.com'),
(2, 'priyakar', '2023-05-10', 'priyankar@gmail.com'),
(3, 'Rohit', '2022-08-22', 'rohit@gmail.com'),
(4, 'uaday', '2021-02-14', 'uday@gmail.com'),
(5, 'kishor', '2020-12-30', 'kishor@gmail.com');

-- --------------------------------------------------------

--
-- Stand-in structure for view `members_before_2020`
-- (See below for the actual view)
--
CREATE TABLE `members_before_2020` (
`member_id` int(11)
,`member_name` varchar(100)
,`date_of_membership` date
,`email` varchar(100)
);

-- --------------------------------------------------------

--
-- Table structure for table `update_log`
--

CREATE TABLE `update_log` (
  `log_id` int(11) NOT NULL,
  `book_id` int(11) DEFAULT NULL,
  `old_title` varchar(200) DEFAULT NULL,
  `new_title` varchar(200) DEFAULT NULL,
  `old_price` int(11) DEFAULT NULL,
  `new_price` int(11) DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `update_log`
--

INSERT INTO `update_log` (`log_id`, `book_id`, `old_title`, `new_title`, `old_price`, `new_price`, `update_time`) VALUES
(1, 1, 'Dark Souls', 'Dark Souls Remastered', 4999, 5299, '2025-11-27 06:09:06'),
(2, 2, 'Lies of P', 'Lies of P Deluxe', 4599, 4899, '2025-11-27 06:09:06'),
(3, 3, 'Bloodborne', 'Bloodborne', 3999, 3799, '2025-11-27 06:09:06'),
(4, 4, 'Sekiro', 'Sekiro Shadows Die Twice', 4299, 4499, '2025-11-27 06:09:06'),
(5, 5, 'Star Wars Jedi', 'Star Wars Jedi Fallen Order', 4999, 5299, '2025-11-27 06:09:06'),
(6, 6, 'Remnant', 'Remnant II', 3799, 4099, '2025-11-27 06:09:06');

-- --------------------------------------------------------

--
-- Structure for view `books_summary`
--
DROP TABLE IF EXISTS `books_summary`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `books_summary`  AS SELECT `books`.`title` AS `title`, `books`.`author` AS `author`, `books`.`price` AS `price` FROM `books` ;

-- --------------------------------------------------------

--
-- Structure for view `members_before_2020`
--
DROP TABLE IF EXISTS `members_before_2020`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `members_before_2020`  AS SELECT `members`.`member_id` AS `member_id`, `members`.`member_name` AS `member_name`, `members`.`date_of_membership` AS `date_of_membership`, `members`.`email` AS `email` FROM `members` WHERE year(`members`.`date_of_membership`) < 2020 ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`author_id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`book_id`);

--
-- Indexes for table `delete_log`
--
ALTER TABLE `delete_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`member_id`);

--
-- Indexes for table `update_log`
--
ALTER TABLE `update_log`
  ADD PRIMARY KEY (`log_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `delete_log`
--
ALTER TABLE `delete_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `update_log`
--
ALTER TABLE `update_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
