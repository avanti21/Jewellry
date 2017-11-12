-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 09, 2017 at 09:08 AM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jewellery`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `AID` varchar(10) NOT NULL,
  `Password` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`AID`, `Password`) VALUES
('admin101', 'admin101');

-- --------------------------------------------------------

--
-- Table structure for table `base`
--

CREATE TABLE `base` (
  `Pure` varchar(5) NOT NULL,
  `Rate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `base`
--

INSERT INTO `base` (`Pure`, `Rate`) VALUES
('G22', 1500),
('G24', 1000),
('S22', 500),
('S24', 500);

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `BID` int(11) NOT NULL,
  `BQuantity` int(11) NOT NULL,
  `BAmount` float NOT NULL,
  `Tax` int(11) NOT NULL,
  `PDate` date NOT NULL,
  `TAmount` float NOT NULL,
  `EID` int(11) NOT NULL,
  `CID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`BID`, `BQuantity`, `BAmount`, `Tax`, `PDate`, `TAmount`, `EID`, `CID`) VALUES
(5001, 3, 27415, 6, '2017-10-08', 29059.9, 1004, 4005),
(5002, 2, 25680, 6, '2017-10-08', 27220.8, 1006, 4006),
(5004, 1, 12840, 6, '2017-10-08', 13610.4, 1006, 4005),
(5005, 1, 3675, 6, '2017-10-08', 3895.5, 1006, 4005),
(5006, 1, 3675, 6, '2017-10-09', 3895.5, 1003, 4006);

--
-- Triggers `bill`
--
DELIMITER $$
CREATE TRIGGER `tr_total` BEFORE UPDATE ON `bill` FOR EACH ROW set NEW.TAmount= (NEW.BAmount + (NEW.BAmount * (NEW.Tax/100)))
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `bill_jewellery`
--

CREATE TABLE `bill_jewellery` (
  `BID` int(11) NOT NULL,
  `JID` int(11) NOT NULL,
  `JQuantity` int(11) NOT NULL,
  `Grams` float NOT NULL,
  `Gold` varchar(5) NOT NULL,
  `JMakeCost` int(11) NOT NULL,
  `JAmount` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bill_jewellery`
--

INSERT INTO `bill_jewellery` (`BID`, `JID`, `JQuantity`, `Grams`, `Gold`, `JMakeCost`, `JAmount`) VALUES
(5001, 3001, 1, 8, 'G22', 7, 12840),
(5001, 3002, 1, 7, 'S24', 5, 3675),
(5001, 3003, 1, 10, 'G24', 9, 10900),
(5002, 3001, 1, 8, 'G22', 7, 12840),
(5002, 3001, 1, 8, 'G22', 7, 12840),
(5004, 3001, 1, 8, 'G22', 7, 12840),
(5005, 3002, 1, 7, 'S24', 5, 3675),
(5006, 3002, 1, 7, 'S24', 5, 3675);

--
-- Triggers `bill_jewellery`
--
DELIMITER $$
CREATE TRIGGER `tr_amount` BEFORE INSERT ON `bill_jewellery` FOR EACH ROW Begin
set @amt= (NEW.JQuantity * (NEW.Grams * (select Rate from base where Pure=NEW.Gold)));

set NEW.JAmount= ( ( ( @amt * NEW.JMakeCost ) / 100 ) + @amt ) ;

end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tr_bill` AFTER INSERT ON `bill_jewellery` FOR EACH ROW BEGIN

update bill set BQuantity= BQuantity + (NEW.JQuantity) where BID=NEW.BID;
update bill set BAmount= BAmount + (NEW.JAmount) where BID=NEW.BID;

update jewel set SQuantity= SQuantity - (NEW.JQuantity) where JID=NEW.JID;


END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `CID` int(11) NOT NULL,
  `CName` varchar(20) NOT NULL,
  `CCont` bigint(10) NOT NULL,
  `CAddr` varchar(50) NOT NULL,
  `CGID` int(11) NOT NULL,
  `EID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CID`, `CName`, `CCont`, `CAddr`, `CGID`, `EID`) VALUES
(4005, 'Karen J. French', 3334394182, 'LandhausstraÃŸe 17\r\n16208 Eberswalde', 5113, 1004),
(4006, 'Marion A. Howard', 8928135665, 'Am Borsigturm 22\r\n41462 Neuss Vogelsang', 2147483647, 1004),
(4007, 'Emella Watson', 9975461047, 'Hamburg,Germany', 13654, 1003);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `EID` int(11) NOT NULL,
  `EPass` varchar(11) NOT NULL,
  `EName` varchar(20) NOT NULL,
  `EAddr` varchar(50) NOT NULL,
  `ECont` bigint(10) NOT NULL,
  `Section` varchar(20) NOT NULL,
  `Shift` int(11) NOT NULL,
  `EGID` varchar(20) NOT NULL,
  `Salary` int(11) NOT NULL,
  `AID` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`EID`, `EPass`, `EName`, `EAddr`, `ECont`, `Section`, `Shift`, `EGID`, `Salary`, `AID`) VALUES
(1001, 'Charlie123', 'Charlie Puth', '21 Street, Central Perk, NYC, USA', 1212121212, 'Ring', 2, '1111-2222-3333', 25000, 'admin101'),
(1002, 'Shawn123', 'Shawn Mendens', '44 Shirley Ave. \r\nWest Chicago, IL 60185', 1111111111, 'Bangles', 2, '1234-1234-1234', 15000, 'admin101'),
(1003, 'lily123', 'Lily Cerny', '4 Goldfield Rd. \r\nHonolulu, HI 96815', 2147483647, 'Anklets', 1, '111-222-333', 20000, 'admin101'),
(1004, 'Paul123', 'Paul Walker', '71 Pilgrim Avenue \r\nChevy Chase, MD 20815', 123456789, 'Magalsutra', 1, '4444455555', 35000, 'admin101'),
(1005, 'Gallert', 'Ross', '70 Bowman St. \r\nSouth Windsor, CT 06074', 1346588, 'Hearings', 1, '1212112', 12000, 'admin101'),
(1006, 'Ned123', 'Ned Stark', ' 13 ,Lord of winterfall,GOT ', 7387018471, 'Bangles', 2, '123456', 30000, 'admin101'),
(1008, 'Adam123', 'Adam Gilchrist', '4 Goldfield Rd. \r\nHonolulu, HI 96815', 9970171798, 'Antic Jewellery', 1, '123455678', 40000, 'admin101'),
(1009, 'Francesca', 'Francesca Cole', '51 St Maurices Road\r\nPRINCES RISBOROUGH\r\nHP27 3SW', 4152483455, 'Mangalsutra', 2, '070 2824 0436', 10000, 'admin101'),
(1010, 'Courtney123', 'Courtney Quinn', '39 Cunnery Rd\r\nMANDALLY\r\nPH35 5DU', 78, 'Necklace', 2, 'CY 22 29 94 C', 13000, 'admin101'),
(1014, 'Niels123', 'Niels C. Villadsen', '11 Southend Avenue\r\nBLACKDOWN\r\nDT8 9FJ', 7739579416, 'Necklace', 2, 'AG 89 04 81 A', 16000, 'admin101'),
(1015, 'Sander123', 'Sander L. Olesen', '91 Argyll Road\r\nLLANBEDR\r\nLL45 5WT', 7929531778, 'Antic Jewellery', 2, 'RR 40 08 06 C', 15000, 'admin101'),
(1016, 'Saber123', 'Saber Pinneau', '28 South Western Terrace\r\nMINFFORDD\r\nLL40 3BL', 7824793587, 'Rings', 1, 'W 18 90 89 C', 8000, 'admin101');

-- --------------------------------------------------------

--
-- Table structure for table `jewel`
--

CREATE TABLE `jewel` (
  `JID` int(11) NOT NULL,
  `TOJ` varchar(20) NOT NULL,
  `Gold` varchar(5) NOT NULL,
  `Grams` float NOT NULL,
  `SQuantity` int(11) NOT NULL,
  `MakeCost` int(11) NOT NULL,
  `AID` varchar(10) NOT NULL,
  `SID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jewel`
--

INSERT INTO `jewel` (`JID`, `TOJ`, `Gold`, `Grams`, `SQuantity`, `MakeCost`, `AID`, `SID`) VALUES
(3001, 'Ring', 'G22', 8, 183, 4, 'admin101', 2001),
(3002, 'Earings', 'S24', 7, 232, 5, 'admin101', 2001),
(3003, 'Bangles', 'G24', 10, 77, 9, 'admin101', 2001);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `SID` int(11) NOT NULL,
  `SName` varchar(20) NOT NULL,
  `Company` varchar(20) NOT NULL,
  `Compcode` int(11) NOT NULL,
  `SAddr` varchar(50) NOT NULL,
  `SCont` bigint(10) NOT NULL,
  `AID` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`SID`, `SName`, `Company`, `Compcode`, `SAddr`, `SCont`, `AID`) VALUES
(2001, 'Matrin Garande', 'Shining diamonds', 0, '20 East Street, Melbourne, USA', 2147483647, 'admin101');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`AID`),
  ADD UNIQUE KEY `passunique` (`Password`);

--
-- Indexes for table `base`
--
ALTER TABLE `base`
  ADD PRIMARY KEY (`Pure`);

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`BID`),
  ADD KEY `BEID` (`EID`),
  ADD KEY `BCID` (`CID`);

--
-- Indexes for table `bill_jewellery`
--
ALTER TABLE `bill_jewellery`
  ADD KEY `ID` (`JID`,`BID`),
  ADD KEY `constraint8` (`BID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CID`),
  ADD UNIQUE KEY `CGID` (`CGID`),
  ADD KEY `CID` (`CID`),
  ADD KEY `constraint3` (`EID`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`EID`),
  ADD UNIQUE KEY `EPass` (`EPass`),
  ADD UNIQUE KEY `EGID` (`EGID`),
  ADD KEY `EAID` (`AID`);

--
-- Indexes for table `jewel`
--
ALTER TABLE `jewel`
  ADD PRIMARY KEY (`JID`),
  ADD KEY `constraint5` (`SID`),
  ADD KEY `constraint4` (`AID`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`SID`),
  ADD UNIQUE KEY `Compcode` (`Compcode`),
  ADD KEY `SAID` (`AID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bill`
--
ALTER TABLE `bill`
  MODIFY `BID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5007;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `CID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4008;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `EID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1017;

--
-- AUTO_INCREMENT for table `jewel`
--
ALTER TABLE `jewel`
  MODIFY `JID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3004;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `SID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2002;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `constraint6` FOREIGN KEY (`EID`) REFERENCES `employee` (`EID`),
  ADD CONSTRAINT `constraint7` FOREIGN KEY (`CID`) REFERENCES `customer` (`CID`);

--
-- Constraints for table `bill_jewellery`
--
ALTER TABLE `bill_jewellery`
  ADD CONSTRAINT `constraint8` FOREIGN KEY (`BID`) REFERENCES `bill` (`BID`),
  ADD CONSTRAINT `constraint9` FOREIGN KEY (`JID`) REFERENCES `jewel` (`JID`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `constraint3` FOREIGN KEY (`EID`) REFERENCES `employee` (`EID`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `constraint1` FOREIGN KEY (`AID`) REFERENCES `admin` (`AID`);

--
-- Constraints for table `jewel`
--
ALTER TABLE `jewel`
  ADD CONSTRAINT `constraint4` FOREIGN KEY (`AID`) REFERENCES `admin` (`AID`),
  ADD CONSTRAINT `constraint5` FOREIGN KEY (`SID`) REFERENCES `supplier` (`SID`);

--
-- Constraints for table `supplier`
--
ALTER TABLE `supplier`
  ADD CONSTRAINT `constraint2` FOREIGN KEY (`AID`) REFERENCES `admin` (`AID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
