-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 14, 2015 at 08:37 AM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `zoo_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `animal`
--

CREATE TABLE IF NOT EXISTS `animal` (
  `ani_id` int(5) NOT NULL,
  `ani_name` varchar(25) NOT NULL,
  `sci_name` varchar(25) NOT NULL,
  `dno` int(5) NOT NULL,
  `ani_dob` date DEFAULT NULL,
  `doc_id` int(5) NOT NULL,
  PRIMARY KEY (`ani_id`),
  KEY `doc_id` (`doc_id`),
  KEY `dno` (`dno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `animal`
--

INSERT INTO `animal` (`ani_id`, `ani_name`, `sci_name`, `dno`, `ani_dob`, `doc_id`) VALUES
(11, 'lion', 'Panthera leo', 1, '2010-04-09', 67),
(22, 'tiger', 'Panthera tigris', 1, '2011-04-16', 69),
(33, 'African Pancake', ' Malacochersus torni', 2, '2009-04-11', 71),
(44, 'West African Dw', ' Osteolaemus', 2, '2012-04-16', 70),
(56, 'Rose Tarantula', 'Grammostola rosea', 3, '2013-04-23', 70),
(58, 'Spotted Catfish', 'Agamyxis pectinifron', 4, '2013-05-21', 67),
(60, 'African Grey Parrot', 'Psittacus erithacus', 5, '2012-04-17', 69),
(62, 'Vietnamese Mossy Frog', 'Anura', 6, '2012-10-18', 70),
(63, 'Tiger Salamander', 'Ambystoma tigrinum', 6, '2013-04-17', 71);

-- --------------------------------------------------------

--
-- Table structure for table `avrt`
--

CREATE TABLE IF NOT EXISTS `avrt` (
  `vet_id` int(5) NOT NULL,
  `a_id` int(5) NOT NULL,
  `treatment_type` varchar(25) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`vet_id`,`a_id`,`treatment_type`,`date`),
  KEY `a_id` (`a_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `avrt`
--

INSERT INTO `avrt` (`vet_id`, `a_id`, `treatment_type`, `date`) VALUES
(71, 11, 'vaccination', '2013-09-11'),
(70, 22, 'regular_checkup', '2013-11-14'),
(67, 33, 'regular check up', '2014-04-15'),
(67, 33, 'sickness', '2013-12-18'),
(69, 44, 'regular_checkup', '2012-11-21'),
(70, 56, 'regular_checkup', '2013-02-14'),
(70, 58, 'sickness', '2013-04-02'),
(71, 58, 'regular_checkup', '2012-12-13'),
(71, 62, 'regular_checkup', '2013-04-26'),
(67, 63, 'sickness', '2013-01-17');

-- --------------------------------------------------------

--
-- Table structure for table `dependent`
--

CREATE TABLE IF NOT EXISTS `dependent` (
  `emp_id` int(5) NOT NULL,
  `d_name` varchar(15) NOT NULL,
  `sex` varchar(8) NOT NULL,
  `d_dob` date NOT NULL,
  `relation` varchar(25) NOT NULL,
  KEY `emp_id` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dept`
--

CREATE TABLE IF NOT EXISTS `dept` (
  `dname` varchar(15) NOT NULL,
  `d_no` int(5) NOT NULL,
  `min salary` int(15) NOT NULL,
  `mngr_ssn` int(5) NOT NULL,
  `max salary` int(15) NOT NULL,
  `avg_mntence_cost` int(15) NOT NULL,
  PRIMARY KEY (`d_no`),
  KEY `mngr_ssn` (`mngr_ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dept`
--

INSERT INTO `dept` (`dname`, `d_no`, `min salary`, `mngr_ssn`, `max salary`, `avg_mntence_cost`) VALUES
('mammals', 1, 5000, 111, 25000, 50000),
('reptiles', 2, 8000, 333, 30000, 75000),
('invertibrates', 3, 4000, 555, 18000, 35000),
('fish', 4, 6000, 444, 23000, 65000),
('birds', 5, 7000, 777, 23500, 45000),
('amphibians', 6, 6500, 999, 18000, 40000);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE IF NOT EXISTS `employee` (
  `emp_id` int(5) NOT NULL,
  `emp_fname` varchar(15) NOT NULL,
  `emp_lname` varchar(15) NOT NULL,
  `dob` date NOT NULL,
  `desg` varchar(20) NOT NULL,
  `sex` varchar(8) NOT NULL,
  `salary` int(10) NOT NULL,
  `address` varchar(25) NOT NULL,
  `dept_no` int(5) DEFAULT NULL,
  `pw` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`emp_id`),
  KEY `dept_no` (`dept_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`emp_id`, `emp_fname`, `emp_lname`, `dob`, `desg`, `sex`, `salary`, `address`, `dept_no`, `pw`) VALUES
(111, 'derek', 'shepherd', '1990-04-09', 'manager', 'male', 20000, 'whitefields', 1, NULL),
(222, 'harvey', 'spectar', '1980-04-09', 'worker', 'male', 25000, 'mathikere', 1, '345'),
(333, 'peyton', 'roberts', '1985-06-01', 'manager', 'female', 25000, 'sadhashivnagar', 2, '123'),
(444, 'sheldon', 'cooper', '1970-05-05', 'manager', 'male', 10000, 'rtnagar', 4, NULL),
(555, 'haley', 'scott', '1990-04-04', 'manager', 'female', 25000, 'sadhashivnagar', 3, NULL),
(666, 'kate', 'becket', '1965-12-10', 'worker', 'female', 10000, 'rtnagar', 2, NULL),
(777, 'robin', 'uthappa', '1963-04-07', 'manager', 'female', 25000, 'sadhashivnagar', 5, NULL),
(888, 'dexter', 'smith', '1968-10-10', 'worker', 'male', 10000, 'rtnagar', 3, NULL),
(999, 'barney', 'stinson', '1965-05-05', 'manager', 'male', 10000, 'rtnagar', 6, NULL),
(1010, 'edward', 'cullen', '1980-01-04', 'worker', 'male', 20000, 'whitefields', 4, NULL),
(1111, 'aria', 'kasmer', '1994-04-15', 'worker', 'female', 7000, 'kormangla', 5, NULL),
(1212, 'john', 'Egleston', '1985-04-24', 'worker', 'male', 8000, 'jayanagar', 6, NULL),
(1313, 'paige', 'hayman', '1983-04-15', 'guide', 'female', 5000, 'belandur', NULL, NULL),
(1414, 'ethen', 'hyde', '1994-04-23', 'guide', 'male', 5000, 'hoodi', NULL, NULL),
(1515, 'noah', 'light', '1984-04-17', 'worker', 'female', 8000, 'shivajinagar', 3, NULL),
(9898, 'abc', 'hgj', '2024-12-12', 'worker', 'female', 3555, 'jayanagar', 5, '122');

-- --------------------------------------------------------

--
-- Table structure for table `vet`
--

CREATE TABLE IF NOT EXISTS `vet` (
  `vet_name` varchar(15) NOT NULL,
  `vet_id` int(5) NOT NULL,
  `v_pno` int(12) NOT NULL,
  `v_address` varchar(25) NOT NULL,
  `cfee` int(15) NOT NULL,
  PRIMARY KEY (`vet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vet`
--

INSERT INTO `vet` (`vet_name`, `vet_id`, `v_pno`, `v_address`, `cfee`) VALUES
('oliver', 67, 123456, 'vijay nagar', 1000),
('isabella', 69, 456789, 'shrinivasnagar', 1200),
('caleb', 70, 1234567, 'acs layout', 800),
('lydia', 71, 56889, 'kakdaspura', 1100);

-- --------------------------------------------------------

--
-- Table structure for table `visit`
--

CREATE TABLE IF NOT EXISTS `visit` (
  `guide` int(11) DEFAULT NULL,
  `g_name` varchar(15) NOT NULL,
  `phe_no` int(12) NOT NULL,
  `no_ppl` int(5) NOT NULL,
  `email` text NOT NULL,
  `date_v` date NOT NULL,
  PRIMARY KEY (`g_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `visit`
--

INSERT INTO `visit` (`guide`, `g_name`, `phe_no`, `no_ppl`, `email`, `date_v`) VALUES
(NULL, 'dbms_sir', 2345, 4, 'abc@gmail.com', '2014-12-25'),
(NULL, 'guygh', 45454, 65, 'yguyg', '0000-00-00'),
(NULL, 'ise', 131, 6, 'some@some.com', '2024-02-02'),
(NULL, 'pragna', 5777, 6, 'meera.sandy12@gmail.com', '0000-00-00'),
(NULL, 'Ramana', 8990, 45, 'test@gmail.com', '0000-00-00'),
(NULL, 'sd', 323, 2, 'xsd', '0000-00-00'),
(NULL, 'sdssd', 2242424, 32, 'sdsd', '2012-02-02'),
(NULL, 'sfs', 42, 3, 'sfsf', '0000-00-00'),
(NULL, 'troll', 96644, 4, 'troll@gmail.com', '0000-00-00'),
(NULL, 'vbnm,', 8905678, 3, 'hjkl;', '0000-00-00'),
(NULL, 'ydfasd', 45454, 65, 'arfaf', '0000-00-00');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `animal`
--
ALTER TABLE `animal`
  ADD CONSTRAINT `animal_ibfk_1` FOREIGN KEY (`doc_id`) REFERENCES `vet` (`vet_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `animal_ibfk_2` FOREIGN KEY (`dno`) REFERENCES `dept` (`d_no`);

--
-- Constraints for table `avrt`
--
ALTER TABLE `avrt`
  ADD CONSTRAINT `avrt_ibfk_1` FOREIGN KEY (`vet_id`) REFERENCES `vet` (`vet_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `avrt_ibfk_2` FOREIGN KEY (`a_id`) REFERENCES `animal` (`ani_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dependent`
--
ALTER TABLE `dependent`
  ADD CONSTRAINT `dependent_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`dept_no`) REFERENCES `dept` (`d_no`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
