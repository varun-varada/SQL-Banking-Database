-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: sql_project
-- ------------------------------------------------------
-- Server version	8.4.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `acnumber` varchar(6) NOT NULL,
  `custid` varchar(6) DEFAULT NULL,
  `bid` varchar(6) DEFAULT NULL,
  `opening_balance` int DEFAULT NULL,
  `aod` date DEFAULT NULL,
  `atype` varchar(10) DEFAULT NULL,
  `astatus` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`acnumber`),
  KEY `account_custid_fk` (`custid`),
  CONSTRAINT `account_custid_fk` FOREIGN KEY (`custid`) REFERENCES `customer` (`custid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES ('AC1001','CUST01','BID001',5000,'2023-01-15','Savings','Active'),('AC1002','CUST02','BID002',12000,'2023-02-20','Current','Active'),('AC1003','CUST03','BID003',7500,'2023-03-10','Savings','Active'),('AC1004','CUST04','BID004',15000,'2023-04-25','Savings','Inactive'),('AC1005','CUST05','BID005',3000,'2023-05-05','Current','Active');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_info`
--

DROP TABLE IF EXISTS `account_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_info` (
  `ACCOUNT_NO` bigint NOT NULL,
  `CUSTOMER_ID` varchar(5) NOT NULL,
  `ACCOUNT_TYPE` varchar(10) DEFAULT NULL,
  `REGISTRATION_DATE` date DEFAULT NULL,
  `ACTIVATION_DATE` date DEFAULT NULL,
  `IFSC_CODE` varchar(10) NOT NULL,
  `INTEREST` decimal(7,2) DEFAULT NULL,
  `INITIAL_DEPOSIT` bigint DEFAULT NULL,
  PRIMARY KEY (`ACCOUNT_NO`),
  KEY `ACC_INFO_PERS_FK` (`CUSTOMER_ID`),
  KEY `ACC_INFO_BANK_FK` (`IFSC_CODE`),
  CONSTRAINT `ACC_INFO_BANK_FK` FOREIGN KEY (`IFSC_CODE`) REFERENCES `bank_info` (`IFSC_CODE`),
  CONSTRAINT `ACC_INFO_PERS_FK` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `customer_personal_info` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_info`
--

LOCK TABLES `account_info` WRITE;
/*!40000 ALTER TABLE `account_info` DISABLE KEYS */;
INSERT INTO `account_info` VALUES (1000000000000001,'C001','Savings','2024-01-15','2024-01-16','SBIN001',3.50,5000),(1000000000000002,'C002','Checking','2024-02-10','2024-02-11','HDFC002',2.75,3000),(1000000000000003,'C003','Savings','2024-03-05','2024-03-06','ICICI003',4.00,8000);
/*!40000 ALTER TABLE `account_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank_info`
--

DROP TABLE IF EXISTS `bank_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank_info` (
  `IFSC_CODE` varchar(15) NOT NULL,
  `BANK_NAME` varchar(25) DEFAULT NULL,
  `BRANCH_NAME` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`IFSC_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank_info`
--

LOCK TABLES `bank_info` WRITE;
/*!40000 ALTER TABLE `bank_info` DISABLE KEYS */;
INSERT INTO `bank_info` VALUES ('HDFC002','HDFC Bank','Main Branch'),('ICICI003','ICICI Bank','City Center Branch'),('SBIN001','State Bank of India','Downtown Branch');
/*!40000 ALTER TABLE `bank_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch` (
  `bid` varchar(6) NOT NULL,
  `bname` varchar(30) DEFAULT NULL,
  `bcity` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`bid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES ('BID001','Main Branch','New York'),('BID002','West Side Branch','Los Angeles'),('BID003','Downtown Branch','Chicago'),('BID004','Uptown Branch','Houston'),('BID005','East End Branch','Miami');
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `custid` varchar(6) NOT NULL,
  `fname` varchar(30) DEFAULT NULL,
  `mname` varchar(30) DEFAULT NULL,
  `ltname` varchar(30) DEFAULT NULL,
  `City` varchar(15) DEFAULT NULL,
  `mobileno` varchar(10) DEFAULT NULL,
  `occupation` varchar(10) DEFAULT NULL,
  `dod` date DEFAULT NULL,
  PRIMARY KEY (`custid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('CUST01','John','M','Doe','New York','1234567890','Engineer','1985-06-15'),('CUST02','Jane','A','Smith','Los Angeles','0987654321','Doctor','1990-11-25'),('CUST03','Alice','B','Johnson','Chicago','2345678901','Teacher','1988-09-12'),('CUST04','Bob','C','Brown','Houston','3456789012','Nurse','1975-03-22'),('CUST05','Charlie','D','Davis','Phoenix','4567890123','Artist','1995-01-30');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_personal_info`
--

DROP TABLE IF EXISTS `customer_personal_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_personal_info` (
  `customer_id` varchar(5) NOT NULL,
  `customer_name` varchar(30) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `Guradian_name` varchar(30) DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `contact_no` bigint DEFAULT NULL,
  `mail_id` varchar(30) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `marital_status` varchar(10) DEFAULT NULL,
  `Identification_DOC_TYPE` varchar(20) DEFAULT NULL,
  `ID_DOC_NO` varchar(10) DEFAULT NULL,
  `Citizenship` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_personal_info`
--

LOCK TABLES `customer_personal_info` WRITE;
/*!40000 ALTER TABLE `customer_personal_info` DISABLE KEYS */;
INSERT INTO `customer_personal_info` VALUES ('C001','John Doe','1985-04-15','Jane Doe','123 Elm St, Springfield',9876543210,'johndoe@example.com','M','Single','Passport','P12345678','US'),('C002','Jane Smith','1990-07-22','Mary Smith','456 Oak St, Springfield',9123456780,'janesmith@example.com','F','Married','Driver License','D98765432','US'),('C003','Mike Johnson','1988-11-30','William Johnson','789 Pine St, Springfield',9234567890,'mikejohnson@example.com','M','Single','Aadhar Card','A123456789','IN');
/*!40000 ALTER TABLE `customer_personal_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_reference_info`
--

DROP TABLE IF EXISTS `customer_reference_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_reference_info` (
  `customer_id` varchar(5) NOT NULL,
  `REFERENCE_ACC_NAME` varchar(20) DEFAULT NULL,
  `REFERENCE_ACC_NO` bigint DEFAULT NULL,
  `REFERENCE_ACC_ADDRESS` varchar(50) DEFAULT NULL,
  `RELATION` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  CONSTRAINT `CUST_REF_INFO_FK` FOREIGN KEY (`customer_id`) REFERENCES `customer_personal_info` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_reference_info`
--

LOCK TABLES `customer_reference_info` WRITE;
/*!40000 ALTER TABLE `customer_reference_info` DISABLE KEYS */;
INSERT INTO `customer_reference_info` VALUES ('C001','Alice Smith',1234567890123456,'123 Elm St, Springfield','Sister'),('C002','Bob Johnson',1234567890123457,'456 Oak St, Springfield','Friend'),('C003','Charlie Brown',1234567890123458,'789 Pine St, Springfield','Father');
/*!40000 ALTER TABLE `customer_reference_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-01 11:46:35
