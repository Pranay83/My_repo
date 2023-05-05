-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: HotelAccommodation
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `guest`
--

DROP TABLE IF EXISTS `guest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guest` (
  `GuestID` int(11) NOT NULL,
  `FirstName` char(15) NOT NULL,
  `LastName` char(15) NOT NULL,
  `EmailAddress` char(35) NOT NULL,
  `PhoneNumber` int(11) NOT NULL,
  `Address` char(35) NOT NULL,
  PRIMARY KEY (`GuestID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guest`
--

LOCK TABLES `guest` WRITE;
/*!40000 ALTER TABLE `guest` DISABLE KEYS */;
INSERT INTO `guest` VALUES (1,'Carla','Payne','carlajpayne@gmail.com',239910686,'2287 Village View Drive'),(2,'Robert','Tan','roberttan@gmail.com',806356981,'1829 Hilltop Drive'),(3,'Frank','Brown','frankbrown@gmail.com',987653210,'1307 Woodside Circle, USA'),(4,'Alice','Lee','alicelee@gmail.com',557123457,'321 Pine St, Anytown, USA'),(6,'Samuel','Barlow','samuelbarlow@email.com',612863805,'3771 Rocket Drive');
/*!40000 ALTER TABLE `guest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `ReservationID` int(11) NOT NULL,
  `CheckInDate` date NOT NULL,
  `CheckOutDate` date NOT NULL,
  `TotalPrice` decimal(5,2) NOT NULL,
  `GuestID` int(11) NOT NULL,
  `RoomNumber` int(11) NOT NULL,
  PRIMARY KEY (`ReservationID`),
  KEY `Reservation_Guest` (`GuestID`),
  KEY `Reservation_Room` (`RoomNumber`),
  KEY `Reservation_TotalPrice_IDX` (`TotalPrice`),
  CONSTRAINT `Reservation_Guest` FOREIGN KEY (`GuestID`) REFERENCES `guest` (`GuestID`),
  CONSTRAINT `Reservation_Room` FOREIGN KEY (`RoomNumber`) REFERENCES `room` (`RoomNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (1,'2023-04-01','2023-04-04',300.00,1,101),(2,'2023-04-02','2023-04-04',400.00,2,103),(3,'2023-04-05','2023-04-09',160.00,2,104),(4,'2023-04-08','2023-04-10',200.00,3,103),(5,'2023-04-15','2023-04-18',500.00,1,101);
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Reservation_Date` BEFORE INSERT ON `reservation` FOR EACH ROW begin
		if (new.CheckInDate > new.CheckOutDate) then
			SIGNAL sqlstate '02000'  set MESSAGE_TEXT = 'Check in date must be before or equal to check out date';
	end if;
       end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `RoomNumber` int(11) NOT NULL,
  `Capacity` int(11) NOT NULL,
  `PricePerNight` decimal(5,2) NOT NULL,
  `RoomTypeID` int(11) NOT NULL,
  PRIMARY KEY (`RoomNumber`),
  KEY `Room_RoomType` (`RoomTypeID`),
  KEY `Room_Capacity_IDX` (`Capacity`),
  CONSTRAINT `Room_RoomType` FOREIGN KEY (`RoomTypeID`) REFERENCES `roomtype` (`RoomTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (101,2,150.00,1),(102,2,100.00,2),(103,2,200.00,2),(104,2,200.00,3);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roomtype`
--

DROP TABLE IF EXISTS `roomtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roomtype` (
  `RoomTypeID` int(11) NOT NULL,
  `RoomTypeName` char(25) NOT NULL,
  `Description` char(45) NOT NULL,
  PRIMARY KEY (`RoomTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roomtype`
--

LOCK TABLES `roomtype` WRITE;
/*!40000 ALTER TABLE `roomtype` DISABLE KEYS */;
INSERT INTO `roomtype` VALUES (1,'Standard Room','A comfortable room with basic amenities'),(2,'Deluxe Room','A spacious room with premium amenities'),(3,'Executive Suite','A luxurious suite with separate living area'),(4,'Penthouse Suite','The ultimate luxury experience with panoramic');
/*!40000 ALTER TABLE `roomtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service` (
  `ServiceID` int(11) NOT NULL,
  `ServiceName` char(25) NOT NULL,
  `Description` char(45) NOT NULL,
  `Price` decimal(5,2) NOT NULL,
  PRIMARY KEY (`ServiceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
INSERT INTO `service` VALUES (1,'Airport Shuttle','Transportation to/from the airport',50.00),(2,'Room Service','A relaxing massage to help you unwind.',20.00),(3,'Spa','Massage and other spa treatments',100.00);
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `service_booked`
--

DROP TABLE IF EXISTS `service_booked`;
/*!50001 DROP VIEW IF EXISTS `service_booked`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `service_booked` AS SELECT 
 1 AS `ServiceName`,
 1 AS `BookingDate`,
 1 AS `GuestID`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `servicebooking`
--

DROP TABLE IF EXISTS `servicebooking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicebooking` (
  `BookingID` int(11) NOT NULL,
  `BookingDate` date NOT NULL,
  `TotalPrice` decimal(5,2) NOT NULL,
  `GuestID` int(11) NOT NULL,
  `ServiceID` int(11) NOT NULL,
  PRIMARY KEY (`BookingID`),
  KEY `ServiceBooking_Guest` (`GuestID`),
  KEY `ServiceBooking_Service` (`ServiceID`),
  CONSTRAINT `ServiceBooking_Guest` FOREIGN KEY (`GuestID`) REFERENCES `guest` (`GuestID`),
  CONSTRAINT `ServiceBooking_Service` FOREIGN KEY (`ServiceID`) REFERENCES `service` (`ServiceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicebooking`
--

LOCK TABLES `servicebooking` WRITE;
/*!40000 ALTER TABLE `servicebooking` DISABLE KEYS */;
INSERT INTO `servicebooking` VALUES (1,'2023-04-01',50.00,1,1),(2,'2023-04-02',20.00,2,1);
/*!40000 ALTER TABLE `servicebooking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shift`
--

DROP TABLE IF EXISTS `shift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shift` (
  `ShiftID` int(11) NOT NULL,
  `StartTime` char(15) NOT NULL,
  `EndTime` char(15) NOT NULL,
  `StaffID` int(11) NOT NULL,
  `ServiceID` int(11) NOT NULL,
  PRIMARY KEY (`ShiftID`),
  KEY `Shift_Service` (`ServiceID`),
  KEY `Shift_Staff` (`StaffID`),
  CONSTRAINT `Shift_Service` FOREIGN KEY (`ServiceID`) REFERENCES `service` (`ServiceID`),
  CONSTRAINT `Shift_Staff` FOREIGN KEY (`StaffID`) REFERENCES `staff` (`StaffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shift`
--

LOCK TABLES `shift` WRITE;
/*!40000 ALTER TABLE `shift` DISABLE KEYS */;
INSERT INTO `shift` VALUES (1,'08:00:00','16:00:00',1,2),(2,'16:00:00','19:00:00',2,1),(4,'12:00:00','20:00:00',1,1);
/*!40000 ALTER TABLE `shift` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `StaffID` int(11) NOT NULL,
  `FirstName` char(25) NOT NULL,
  `LastName` char(25) NOT NULL,
  `EmailAddress` char(35) NOT NULL,
  `PhoneNumber` int(11) NOT NULL,
  `Position` char(25) NOT NULL,
  PRIMARY KEY (`StaffID`),
  KEY `Staff_Email_Address_IDX` (`EmailAddress`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'Philip','Johnson','philipjohnson@gmail.com',810613656,'Manager'),(2,'Tom','Hill','tomhill@gmail.com',570245269,'Receptionist'),(3,'BobJames','Cusick','jamescusick@gmail.com',856284852,'Housekeeper'),(4,'John','Hamler','johnhamler@gmail.com',336410722,'Concierge'),(7,'Richard','Lee','richardelee@gmail.com',603666287,'Housekeeper');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `suite_room_info`
--

DROP TABLE IF EXISTS `suite_room_info`;
/*!50001 DROP VIEW IF EXISTS `suite_room_info`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `suite_room_info` AS SELECT 
 1 AS `RoomNumber`,
 1 AS `Capacity`,
 1 AS `RoomTypeName`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `service_booked`
--

/*!50001 DROP VIEW IF EXISTS `service_booked`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `service_booked` AS select `s`.`ServiceName` AS `ServiceName`,`sb`.`BookingDate` AS `BookingDate`,`sb`.`GuestID` AS `GuestID` from (`servicebooking` `sb` join `service` `s`) where (`s`.`ServiceID` = `sb`.`ServiceID`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `suite_room_info`
--

/*!50001 DROP VIEW IF EXISTS `suite_room_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `suite_room_info` AS select `r`.`RoomNumber` AS `RoomNumber`,`r`.`Capacity` AS `Capacity`,`rt`.`RoomTypeName` AS `RoomTypeName` from (`room` `r` join `roomtype` `rt`) where ((`rt`.`RoomTypeID` = `r`.`RoomTypeID`) and (`rt`.`RoomTypeName` like '%Suite%')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-01 18:48:15
