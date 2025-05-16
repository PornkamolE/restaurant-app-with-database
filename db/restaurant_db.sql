-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: db
-- ------------------------------------------------------
-- Server version	5.7.44

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
-- Table structure for table `food_menu`
--

DROP TABLE IF EXISTS `food_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `category` enum('GRILL','PASTA','SALAD','BEVERAGE') NOT NULL,
  `price` double DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_menu`
--

LOCK TABLES `food_menu` WRITE;
/*!40000 ALTER TABLE `food_menu` DISABLE KEYS */;
INSERT INTO `food_menu` VALUES (1,'Grilled Chicken','GRILL',120,'https://bigoven-res.cloudinary.com/image/upload/t_recipe-1280/chicken-fried-chicken-13.jpg'),(2,'BBQ Pork Ribs','GRILL',150,'https://www.cloughbanefarm.com/wp-content/uploads/2021/03/1lb-Pork-BBQ-Spare-Ribs-1.jpg'),(3,'Spaghetti Carbonara','PASTA',100,'https://thestayathomechef.com/wp-content/uploads/2020/03/Pasta-Carbonara-2-3-scaled.jpg'),(4,'Penne Pesto','PASTA',105,'https://fratellisnewyorkpizza.com/wp-content/uploads/2019/07/pesto-penne-pasta.jpg'),(5,'Caesar Salad','SALAD',80,'https://www.foodtempel.de/wp-content/uploads/2023/03/Klassischer-Caesar-Salad-mit-wuerzigem-Dressing-Kaese-und-Croutons.jpg'),(6,'Greek Salad','SALAD',85,'https://www.wellplated.com/wp-content/uploads/2022/05/Mediterranean-Greek-Salad-768x1152.jpg'),(7,'Lemonade','BEVERAGE',40,'https://ohsofoodie.com/wp-content/uploads/2020/07/Served-4-scaled-735x1102.jpg'),(8,'Iced Coffee','BEVERAGE',45,'https://midwestniceblog.com/wp-content/uploads/2023/07/caramel-iced-coffee-recipe-683x1024.jpg'),(9,'Spicy Salmon Salad','SALAD',150,'https://img.wongnai.com/p/1920x0/2019/12/10/2dba060104744c9d94dcf8be754fdf97.jpg'),(10,'Matcha Latte','BEVERAGE',75,'https://www.informacibo.it/wp-content/uploads/2023/02/matcha-latte-ricetta-500x500.jpeg'),(11,'Ravioli Beef Sauce','PASTA',130,'https://i1.wp.com/ontapsportsnet.com/wp-content/uploads/2020/08/Ravioli-Sauce-Recipe-H-scaled-1.jpg?resize=1000%2C667&ssl=1'),(12,'Grilled Salmon','GRILL',189,'https://bigoven-res.cloudinary.com/image/upload/t_recipe-1280/grilled-salmon-3f985f.jpg');
/*!40000 ALTER TABLE `food_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `table_number` int(11) NOT NULL,
  `status` enum('NEW','PROCESSING','READY','DONE') NOT NULL DEFAULT 'NEW',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `table_number` (`table_number`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`table_number`) REFERENCES `tables` (`table_number`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,'DONE','2025-05-16 13:53:46'),(2,2,'PROCESSING','2025-05-16 14:19:35'),(3,3,'PROCESSING','2025-05-16 14:43:12'),(4,7,'DONE','2025-05-16 15:05:55'),(5,1,'DONE','2025-05-16 17:04:49');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL,
  `menu_name` varchar(100) NOT NULL,
  `category` enum('GRILL','PASTA','SALAD','BEVERAGE') NOT NULL,
  `status` enum('NEW','COOKING','READY','SERVED') NOT NULL DEFAULT 'NEW',
  `price` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_order_items_order` (`order_id`),
  CONSTRAINT `fk_order_items_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1,'Ravioli Beef Sauce','PASTA','SERVED',130),(2,1,'Lemonade','BEVERAGE','SERVED',40),(3,2,'Caesar Salad','SALAD','SERVED',80),(4,2,'Spicy Salmon Salad','SALAD','SERVED',150),(5,3,'BBQ Pork Ribs','GRILL','SERVED',150),(6,3,'Matcha Latte','BEVERAGE','SERVED',75),(7,4,'Grilled Salmon','GRILL','SERVED',189),(8,5,'Ravioli Beef Sauce','PASTA','SERVED',130);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tables`
--

DROP TABLE IF EXISTS `tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tables` (
  `table_number` int(11) NOT NULL,
  `status` enum('AVAILABLE','OCCUPIED','COMPLETED') NOT NULL,
  PRIMARY KEY (`table_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tables`
--

LOCK TABLES `tables` WRITE;
/*!40000 ALTER TABLE `tables` DISABLE KEYS */;
INSERT INTO `tables` VALUES (1,'AVAILABLE'),(2,'AVAILABLE'),(3,'AVAILABLE'),(4,'AVAILABLE'),(5,'AVAILABLE'),(6,'AVAILABLE'),(7,'AVAILABLE');
/*!40000 ALTER TABLE `tables` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-16 18:09:53
