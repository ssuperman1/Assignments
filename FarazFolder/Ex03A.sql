-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 30, 2019 at 09:29 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `EX03A`
--

-- --------------------------------------------------------

--
-- Table structure for table `ASSIGNMENT`
--

CREATE TABLE `ASSIGNMENT` (
  `ProjectID` int(11) NOT NULL,
  `EmployeeNumber` int(11) NOT NULL,
  `HoursWorked` decimal(6,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `DEPARTMENT`
--

CREATE TABLE `DEPARTMENT` (
  `DepartmentName` char(35) NOT NULL,
  `BudgetCode` char(30) NOT NULL,
  `OfficerNumber` char(15) NOT NULL,
  `Phone` char(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `DEPARTMENT`
--

INSERT INTO `DEPARTMENT` (`DepartmentName`, `BudgetCode`, `OfficerNumber`, `Phone`) VALUES
('Accounting', 'BC-500-10', 'BLDG01-120', '360-285-8405'),
('Administration', 'BC-100-10', 'BLDG01-201', '360-285-8100'),
('Finance', '1', '1', '8001231234'),
('Human Resource', '4', '4', '8001231237'),
('Legal', 'BC-200-10', 'BLDG01-220', '360-285-8200'),
('Marketing', '2', '2', '8001231235'),
('Sales', '3', '3', '8001231236');

-- --------------------------------------------------------

--
-- Table structure for table `EMPLOYEE`
--

CREATE TABLE `EMPLOYEE` (
  `EmployeeNumber` int(11) NOT NULL,
  `FirstName` char(25) NOT NULL,
  `LastName` char(35) NOT NULL,
  `Department` char(35) NOT NULL DEFAULT 'Human Resources',
  `Phone` char(12) DEFAULT NULL,
  `Email` varchar(100) NOT NULL,
  `Postition` char(35) NOT NULL,
  `Supervisor` int(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `EMPLOYEE`
--

INSERT INTO `EMPLOYEE` (`EmployeeNumber`, `FirstName`, `LastName`, `Department`, `Phone`, `Email`, `Postition`, `Supervisor`) VALUES
(1, 'Mary', 'Jacobs', 'Administration', '360-285-8110', 'MaryJacobs@WP.com', 'CEO', NULL),
(2, 'Rosalie', 'Jackson', 'Administration', '360-285-8120', 'RosalieJackson@WP.com', 'Adm Asst', 1),
(3, 'Richard', 'Bandalone', 'Legal', '360-285-8210', 'RichardBandalone@WP.com', 'Attorney', 1),
(4, 'George', 'Smith', 'Human Resource', '360-285-8310', 'GeorgeSmith@WP.com', 'HR3', 1),
(5, 'Alan', 'Adams', 'Human Resource', '360-285-8320', 'AlanAdams@WP.com', 'HR1', 4),
(6, 'Ken', 'Evans', 'Finance', '360-285-8410', 'KenEvans@WP.com', 'CFO', 1),
(7, 'Mary', 'Abernathy', 'Finance', '360-285-8420', 'MaryAbernathy@WP.com', 'FA3', 6),
(8, 'Tom', 'Caruthers', 'Accounting', '360-285-8430', 'TomCaruthers@WP.com', 'FA2', 6),
(9, 'Heather', 'Jones', 'Accounting', '360-285-8440', 'HeatherJones@WP.com', 'FA2', 6),
(10, 'Ken', 'Numoto', 'Sales', '360-285-8510', 'KenNumoto@WP.com', 'SM3', 1);

-- --------------------------------------------------------

--
-- Table structure for table `PROJECT`
--

CREATE TABLE `PROJECT` (
  `ProjectID` int(11) NOT NULL,
  `ProjectName` char(50) NOT NULL,
  `Department` char(35) NOT NULL,
  `MaxHours` decimal(8,2) NOT NULL DEFAULT 100.00,
  `StartDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ASSIGNMENT`
--
ALTER TABLE `ASSIGNMENT`
  ADD PRIMARY KEY (`ProjectID`,`EmployeeNumber`),
  ADD KEY `ASSIGN_EMP_FK` (`EmployeeNumber`);

--
-- Indexes for table `DEPARTMENT`
--
ALTER TABLE `DEPARTMENT`
  ADD PRIMARY KEY (`DepartmentName`);

--
-- Indexes for table `EMPLOYEE`
--
ALTER TABLE `EMPLOYEE`
  ADD PRIMARY KEY (`EmployeeNumber`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD KEY `EMP_DEPART_FK` (`Department`),
  ADD KEY `SUPERVISOR_FK` (`Supervisor`);

--
-- Indexes for table `PROJECT`
--
ALTER TABLE `PROJECT`
  ADD PRIMARY KEY (`ProjectID`),
  ADD KEY `PROJ_DEPART_FK` (`Department`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `EMPLOYEE`
--
ALTER TABLE `EMPLOYEE`
  MODIFY `EmployeeNumber` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `PROJECT`
--
ALTER TABLE `PROJECT`
  MODIFY `ProjectID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ASSIGNMENT`
--
ALTER TABLE `ASSIGNMENT`
  ADD CONSTRAINT `ASSIGN_EMP_FK` FOREIGN KEY (`EmployeeNumber`) REFERENCES `EMPLOYEE` (`EmployeeNumber`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `ASSIGN_PROJ_FK` FOREIGN KEY (`ProjectID`) REFERENCES `PROJECT` (`ProjectID`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `EMPLOYEE`
--
ALTER TABLE `EMPLOYEE`
  ADD CONSTRAINT `EMP_DEPART_FK` FOREIGN KEY (`Department`) REFERENCES `DEPARTMENT` (`DepartmentName`) ON UPDATE CASCADE,
  ADD CONSTRAINT `SUPERVISOR_FK` FOREIGN KEY (`Supervisor`) REFERENCES `EMPLOYEE` (`EmployeeNumber`);

--
-- Constraints for table `PROJECT`
--
ALTER TABLE `PROJECT`
  ADD CONSTRAINT `PROJ_DEPART_FK` FOREIGN KEY (`Department`) REFERENCES `DEPARTMENT` (`DepartmentName`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
