-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: myusers
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cart` (
  `user_id` varchar(45) NOT NULL,
  `item_id` int(11) NOT NULL,
  `item_count` int(11) DEFAULT NULL,
  `instant` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`instant`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `comments` (
  `user_id` varchar(45) NOT NULL,
  `item_id` int(11) NOT NULL,
  `message` varchar(200) NOT NULL,
  `instant` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`instant`,`user_id`,`item_id`,`message`),
  KEY `item_id` (`item_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `items` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(30) NOT NULL,
  `item_name` varchar(60) NOT NULL,
  `brand` varchar(30) NOT NULL,
  `unit_price` int(11) NOT NULL,
  `unit_count` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  `s_id` varchar(45) NOT NULL,
  `link` varchar(1000) DEFAULT NULL,
  `instant` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`item_id`),
  KEY `s_id` (`s_id`),
  CONSTRAINT `items_ibfk_1` FOREIGN KEY (`s_id`) REFERENCES `suppliers` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (18,'cement','Chettinad PPC Grade Cement','Chettinad',285,59,17,'onkar98','https://www.materialtree.com/media/catalog/product/cache/1/thumbnail/300x/17f82f742ffe127f42dca9de82fb58b1/c/h/chettened-grade-cement-base.jpg','2018-10-08 23:41:27'),(19,'cement','Maha PPC Grade Cement','Maha shakti',285,65,31,'onkar98','https://www.materialtree.com/media/catalog/product/cache/1/thumbnail/300x/17f82f742ffe127f42dca9de82fb58b1/m/a/maha-shakthi-PPC-grade-cement-base.jpg','2018-10-08 23:42:50'),(20,'cement','Priya PPC Grade Cement','Priya ',290,44,33,'onkar98','https://www.materialtree.com/media/catalog/product/cache/1/thumbnail/300x/17f82f742ffe127f42dca9de82fb58b1/p/r/priya-grade-cement-base.jpg','2018-10-08 23:43:54'),(21,'cement','Penna Premium PPC Grade Cement','Penna ',290,95,32,'onkar98','https://www.materialtree.com/media/catalog/product/cache/1/thumbnail/300x/17f82f742ffe127f42dca9de82fb58b1/p/e/penna-ppc-base.jpg','2018-10-08 23:45:25'),(22,'cement','Penna Premium OPC 53 Grade Cement','Penna',295,43,17,'onkar98','https://www.materialtree.com/media/catalog/product/cache/1/thumbnail/300x/17f82f742ffe127f42dca9de82fb58b1/p/e/peena-53-grade-cement-base.jpg','2018-10-08 23:46:21'),(23,'cement',' KCP PPC Cement','KCP',275,8,4,'onkar98','https://www.materialtree.com/media/catalog/product/cache/1/thumbnail/300x/17f82f742ffe127f42dca9de82fb58b1/k/c/kcp-shreshta-ppc-cement-base.jpg','2018-10-08 23:47:39'),(24,'cement','Dalmia PPC Grade Cement','Dalmia',310,43,31,'onkar98','https://www.materialtree.com/media/catalog/product/cache/1/thumbnail/300x/17f82f742ffe127f42dca9de82fb58b1/d/a/dalmia-ultra-ppc-cement-base.jpg','2018-10-08 23:48:33'),(25,'cement','Birla Shakti PPC Grade Cement','Birla Shakti',310,12,17,'onkar98','https://www.materialtree.com/media/catalog/product/cache/1/thumbnail/300x/17f82f742ffe127f42dca9de82fb58b1/v/a/vasavadatta-birla-shakti-ppc-grade-cement-base.jpg','2018-10-08 23:49:36'),(26,'cement',' Ramco PPC Grade Cement',' Ramco',320,52,18,'onkar98','https://www.materialtree.com/media/catalog/product/cache/1/thumbnail/300x/17f82f742ffe127f42dca9de82fb58b1/r/a/ramco-ppc.jpg','2018-10-08 23:50:47'),(27,'cement','Jaypee Cement 53 Grade','Jaypee',321,23,15,'onkar98','https://www.materialtree.com/media/catalog/product/cache/1/thumbnail/300x/17f82f742ffe127f42dca9de82fb58b1/j/a/jaypee-53-grade-cement-base.jpg','2018-10-08 23:51:32'),(28,'cement','ACC PPC Cement','ACC',330,21,17,'onkar98','https://www.materialtree.com/media/catalog/product/cache/1/thumbnail/300x/17f82f742ffe127f42dca9de82fb58b1/a/c/acc-ppc-grade-cement-base.jpg','2018-10-08 23:52:11'),(29,'sand and aggregates','MSIL River Sand Bag','MSIL',200,65,11,'ktraders','https://www.materialtree.com/media/catalog/product/cache/1/thumbnail/300x/17f82f742ffe127f42dca9de82fb58b1/m/s/msil-sand-web_1_.jpg','2018-10-08 23:56:50'),(30,'sand and aggregates','20 Mm. GCP Coarse Aggregates(1000KG)','',680,8,12,'ktraders','https://www.materialtree.com/media/catalog/product/cache/1/thumbnail/300x/17f82f742ffe127f42dca9de82fb58b1/j/e/jelly_stones_1.jpg','2018-10-08 23:58:36'),(31,'sand and aggregates','Thriveni Plastering M-Sand(1000KG)','',1319,11,13,'ktraders','https://www.materialtree.com/media/catalog/product/cache/1/thumbnail/300x/17f82f742ffe127f42dca9de82fb58b1/m/s/msand-500x500_4.jpg','2018-10-09 00:00:38'),(32,'sand and aggregates','Ramnagar River Sand(1000KG)','',1276,12,16,'ktraders','https://www.materialtree.com/media/catalog/product/cache/1/thumbnail/300x/17f82f742ffe127f42dca9de82fb58b1/r/i/river-sand-base_2.jpg','2018-10-09 00:01:38'),(33,'sand and aggregates','GSB Wetmix Coarse Aggregates(1000KG)','',686,5,16,'ktraders','https://www.materialtree.com/media/catalog/product/cache/1/thumbnail/300x/17f82f742ffe127f42dca9de82fb58b1/j/e/jelly-base_6.jpg','2018-10-09 00:04:28'),(34,'sand and aggregates','Karur River Sand - With Pebbles(1000KG)','',27000,16,2,'ktraders','https://www.materialtree.com/media/catalog/product/cache/1/thumbnail/300x/17f82f742ffe127f42dca9de82fb58b1/r/i/river-sand-base_5.jpg','2018-10-09 00:05:38'),(35,'sand and aggregates','20 Mm. AVS Coarse Aggregates(1000KG)','',700,21,12,'ktraders','https://www.materialtree.com/media/catalog/product/cache/1/thumbnail/300x/17f82f742ffe127f42dca9de82fb58b1/2/0/20mm-coarse-aggregates-base_10.jpg','2018-10-09 00:06:38'),(36,'steel bar',' Tmt Binding Wires - 1 Kgs Roll','',78,56,15,'uttam123','https://www.materialtree.com/media/catalog/product/cache/1/thumbnail/300x/17f82f742ffe127f42dca9de82fb58b1/b/i/binding-wires-base.jpg','2018-10-09 00:10:22'),(37,'steel bar','25 Mm Excel Concrete Cover Blocks','',350,64,15,'uttam123','https://www.materialtree.com/media/catalog/product/cache/1/small_image/175x225/9df78eab33525d08d6e5fb8d27136e95/c/o/concrete-cover-blocks-25mm-175x175_2_1.jpg','2018-10-09 00:17:27'),(38,'steel bar','Gopala TMT Bars Fe-500 Grade(1000KG)','',55000,16,10,'uttam123','https://www.materialtree.com/media/catalog/product/cache/1/small_image/175x225/9df78eab33525d08d6e5fb8d27136e95/g/o/gopala_1_.jpg','2018-10-09 00:18:36'),(39,'steel bar','Meenakshi TMT Fe 500 Grade(1000KG)','Meenakshi',55000,16,11,'uttam123','https://www.materialtree.com/media/catalog/product/cache/1/small_image/175x225/9df78eab33525d08d6e5fb8d27136e95/m/e/meenakshi-gold-small_2.jpg','2018-10-09 00:19:38'),(40,'steel bar','kay2 TMT Fe 500(1000KG)','kay2 ',55500,25,6,'uttam123','https://www.materialtree.com/media/catalog/product/cache/1/small_image/175x225/9df78eab33525d08d6e5fb8d27136e95/b/h/bhuwalka-tmt-small_4.jpg','2018-10-09 00:21:22'),(41,'steel bar','Kamdhenu TMT Fe 500 Grade(1000KG)','Kamdhenu',55800,21,13,'uttam123','https://www.materialtree.com/media/catalog/product/cache/1/small_image/175x225/9df78eab33525d08d6e5fb8d27136e95/k/a/kamadhenu.jpg','2018-10-09 00:22:29'),(42,'steel bar','Primegold TMT Bars Fe-500 Grade(1000KG)','Primegold',56000,21,25,'uttam123','https://www.materialtree.com/media/catalog/product/cache/1/small_image/175x225/9df78eab33525d08d6e5fb8d27136e95/p/r/prime-gold-small_1_1.jpg','2018-10-09 00:23:34'),(43,'steel bar','Indus 3x 555 TMT Grade(1000KG)','Indus',60130,24,21,'uttam123','https://www.materialtree.com/media/catalog/product/cache/1/small_image/175x225/9df78eab33525d08d6e5fb8d27136e95/i/n/indus-diamond-small_3.jpg','2018-10-09 00:24:35'),(44,'bricks and blocks','SBW Clay Table Mould Bricks','',9,10000,0,'prashant99','https://www.materialtree.com/media/catalog/product/cache/1/thumbnail/300x/17f82f742ffe127f42dca9de82fb58b1/s/b/sbw-clay-table-mould-bricks-big.jpg','2018-10-09 00:28:38'),(45,'bricks and blocks','9 In. x 4 In. x 3 In. SVV Clay Wire Cut Bricks','',10,25326,2,'prashant99','https://www.materialtree.com/media/catalog/product/cache/1/thumbnail/300x/17f82f742ffe127f42dca9de82fb58b1/s/v/svv4-1.jpg','2018-10-09 00:34:02'),(46,'bricks and blocks','9 In. x 3 In. x 2 In. Exposed Clay Wire Cut Solid Bricks','',12,15243,3,'prashant99','https://www.materialtree.com/media/catalog/product/cache/1/thumbnail/300x/17f82f742ffe127f42dca9de82fb58b1/b/r/brick4-2.jpg','2018-10-09 00:34:47'),(47,'bricks and blocks',' 9 In. x 6 In. x 3 In. SVV Clay Wire Cut Bricks','',12,1245,1,'prashant99','https://www.materialtree.com/media/catalog/product/cache/1/thumbnail/300x/17f82f742ffe127f42dca9de82fb58b1/s/v/svv_6-4.jpg','2018-10-09 00:35:31'),(48,'bricks and blocks','9 In. x 4 In. x 3 Exposed Perforated Clay Wire Cut Bricks','',19,1254,0,'prashant99','https://www.materialtree.com/media/catalog/product/cache/1/thumbnail/300x/17f82f742ffe127f42dca9de82fb58b1/b/r/brick1-2_1.jpg','2018-10-09 00:36:27'),(49,'bricks and blocks','Exposed Clay Wire Cut Solid Bricks','',19,1256,0,'prashant99','https://www.materialtree.com/media/catalog/product/cache/1/thumbnail/300x/17f82f742ffe127f42dca9de82fb58b1/b/r/brick2.jpg','2018-10-09 00:37:05'),(50,'bricks and blocks',' Exposed Perforated Clay Wire Cut Bricks','',18,12456,0,'prashant99','https://www.materialtree.com/media/catalog/product/cache/1/thumbnail/300x/17f82f742ffe127f42dca9de82fb58b1/b/r/brick3-1.jpg','2018-10-09 00:37:50'),(51,'bricks and blocks',' 4 In. TCB Concrete Solid Blocks','',29,12453,2,'prashant99','https://www.materialtree.com/media/catalog/product/cache/1/thumbnail/300x/17f82f742ffe127f42dca9de82fb58b1/c/o/concrete-solid-blocks-base_2.jpg','2018-10-09 00:38:31'),(52,'bricks and blocks','4 In. Pragathi Concrete Solid Blocks','',30,12458,2,'prashant99','https://www.materialtree.com/media/catalog/product/cache/1/thumbnail/300x/17f82f742ffe127f42dca9de82fb58b1/c/o/concrete-solid-blocks_1_1_3_8.jpg','2018-10-09 00:39:12'),(53,'bricks and blocks','9 In. x 4 In. x 3 In. RED Clay Table Mould Bricks','',8,12456,0,'prashant99','https://www.materialtree.com/media/catalog/product/cache/1/thumbnail/300x/17f82f742ffe127f42dca9de82fb58b1/r/e/red-bricks-500x500.jpg','2018-10-09 00:39:54'),(54,'electrical','Cherry 6A, Bell Push Switch','Anchor',80,1155,10,'dinkar235','https://www.buildersmart.in/media/catalog/product/cache/1/thumbnail/97x122/9df78eab33525d08d6e5fb8d27136e95/1/4/14123.png','2018-10-09 00:44:28'),(55,'electrical','25A, Motor Starter S.P','Anchor',235,245,12,'dinkar235','https://www.buildersmart.in/media/catalog/product/cache/1/thumbnail/97x122/9df78eab33525d08d6e5fb8d27136e95/5/2/52660.png','2018-10-09 00:45:39'),(56,'electrical','6A, 2 in 1 Socket, Urea Back piece (IP 20)','Anchor',130,1256,16,'dinkar235','https://www.buildersmart.in/media/catalog/product/cache/1/thumbnail/97x122/9df78eab33525d08d6e5fb8d27136e95/1/4/14119.png','2018-10-09 00:46:40'),(57,'electrical','Mini Telephone Jack with Shutter','',150,1254,13,'dinkar235','https://www.buildersmart.in/media/catalog/product/cache/1/thumbnail/97x122/9df78eab33525d08d6e5fb8d27136e95/1/4/14602.png','2018-10-09 00:48:23'),(58,'electrical','Home Cab FR 1.5 sq.mm Cable - 90 Mtrs','KEI',1250,123,25,'dinkar235','https://www.buildersmart.in/media/catalog/product/cache/1/thumbnail/97x122/9df78eab33525d08d6e5fb8d27136e95/f/r/frcable_2.jpg','2018-10-09 00:49:55'),(59,'electrical','Cherry 6A, 1 Way Switch','Cherry',80,125,12,'dinkar235','https://www.buildersmart.in/media/catalog/product/cache/1/thumbnail/97x122/9df78eab33525d08d6e5fb8d27136e95/1/4/14121.png','2018-10-09 00:51:03'),(60,'electrical','20A, 2 Way Power Switches (2 Fixing Holes)','',210,155,10,'dinkar235','https://www.buildersmart.in/media/catalog/product/cache/1/thumbnail/97x122/9df78eab33525d08d6e5fb8d27136e95/1/4/14402.png','2018-10-09 00:51:46'),(61,'electrical','6A, Multi Socket Pin for 2 & 3 Pin','',90,16,12,'dinkar235','https://www.buildersmart.in/media/catalog/product/cache/1/thumbnail/97x122/9df78eab33525d08d6e5fb8d27136e95/1/4/14303.png','2018-10-09 00:52:37'),(62,'electrical','TV Outlet Deluxe','',70,16,13,'dinkar235','https://www.buildersmart.in/media/catalog/product/cache/1/thumbnail/97x122/9df78eab33525d08d6e5fb8d27136e95/1/4/14607.png','2018-10-09 00:53:24'),(63,'electrical','Neon Indicator 240V-50Hz','',180,67,15,'dinkar235','https://www.buildersmart.in/media/catalog/product/cache/1/thumbnail/97x122/9df78eab33525d08d6e5fb8d27136e95/1/4/14601.png','2018-10-09 00:54:06'),(64,'plumbing','Brass Male (Union Type)','',112,165,12,'onkar98','https://www.buildersmart.in/media/catalog/product/cache/1/thumbnail/97x122/9df78eab33525d08d6e5fb8d27136e95/b/r/brass_male_union_type_1.jpg','2018-10-09 08:35:18'),(65,'plumbing','Male Adapter (Brass Threads)','',200,16,3,'onkar98','https://www.buildersmart.in/media/catalog/product/cache/1/thumbnail/97x122/9df78eab33525d08d6e5fb8d27136e95/m/a/male_adapter_brass_threads_3.jpg','2018-10-09 08:36:20'),(66,'plumbing','Brass Female (Union Type)','',113,152,17,'onkar98','https://www.buildersmart.in/media/catalog/product/cache/1/thumbnail/97x122/9df78eab33525d08d6e5fb8d27136e95/b/r/brass_female_union_type_1.jpg','2018-10-09 08:37:12'),(67,'plumbing','Female Adapter (Brass Threads)','',150,123,14,'onkar98','https://www.buildersmart.in/media/catalog/product/cache/1/thumbnail/97x122/9df78eab33525d08d6e5fb8d27136e95/f/e/female_adapters_brass_threads_1.jpg','2018-10-09 08:38:02'),(68,'plumbing','Mapt (Upvc Thread)','',10,155,0,'onkar98','https://www.buildersmart.in/media/catalog/product/cache/1/thumbnail/97x122/9df78eab33525d08d6e5fb8d27136e95/m/a/mapt_upvc_thread.jpg','2018-10-09 08:38:50'),(69,'plumbing','Aerocon End Plug','',10,615,0,'onkar98','https://www.buildersmart.in/media/catalog/product/cache/1/thumbnail/97x122/9df78eab33525d08d6e5fb8d27136e95/p/l/plcpvcarc0216.jpg','2018-10-09 08:39:36'),(70,'plumbing','Aerocon Metal Pipe Clamp (Powder Coated)','',50,56,3,'onkar98','https://www.buildersmart.in/media/catalog/product/cache/1/image/150x150/9df78eab33525d08d6e5fb8d27136e95/p/l/plcpvcarc0173.jpg','2018-10-09 08:40:32'),(71,'wooden products','BWR Ultra(4mm)','',34,125,3,'onkar98','https://www.buildersmart.in/media/catalog/product/cache/1/thumbnail/97x122/9df78eab33525d08d6e5fb8d27136e95/b/w/bwrultra_10.jpg','2018-10-09 08:42:38'),(72,'wooden products','MR Ultra','',30,844,0,'onkar98','https://www.buildersmart.in/media/catalog/product/cache/1/thumbnail/97x122/9df78eab33525d08d6e5fb8d27136e95/m/r/mrultra_10.jpg','2018-10-09 08:43:23'),(73,'wooden products','Austin Plywood - Club','',40,65,3,'onkar98','https://www.buildersmart.in/media/catalog/product/cache/1/thumbnail/97x122/9df78eab33525d08d6e5fb8d27136e95/w/p/wpplywapd0007_1.jpg','2018-10-09 08:44:01'),(74,'wooden products','Gold (Con 710)','',43,16,3,'onkar98','https://www.buildersmart.in/media/catalog/product/cache/1/thumbnail/97x122/9df78eab33525d08d6e5fb8d27136e95/m/a/mayur-gold-con710.jpg','2018-10-09 08:44:41'),(75,'wooden products',' Double click on above image to view full picture Royal 710','',50,65,4,'onkar98','https://www.buildersmart.in/media/catalog/product/cache/1/thumbnail/97x122/9df78eab33525d08d6e5fb8d27136e95/r/o/royal-710_7.jpg','2018-10-09 08:45:18'),(76,'tiles','Wall Tile - 200 x 300mm','Bajaj',50,512,4,'onkar98','https://www.buildersmart.in/media/catalog/product/cache/1/thumbnail/97x122/9df78eab33525d08d6e5fb8d27136e95/t/l/tlwltlbjj0005.jpg','2018-10-09 08:47:09'),(77,'tiles','Artico Decor Polished - 30x60cm','Bajaj',55,152,20,'onkar98','https://www.buildersmart.in/media/catalog/product/cache/1/thumbnail/97x122/9df78eab33525d08d6e5fb8d27136e95/t/l/tlwltlkcl0004.jpg','2018-10-09 08:48:05'),(78,'tiles','Avenue Decor Polished - 30x60cm','',60,254,21,'onkar98','https://www.buildersmart.in/media/catalog/product/cache/1/thumbnail/97x122/9df78eab33525d08d6e5fb8d27136e95/t/l/tlwltlkcl0009.jpg','2018-10-09 08:49:04'),(79,'tiles','Vitrified Tile - Double Charge - 605 x 605mm','Bajaj',34,65,3,'onkar98','https://www.buildersmart.in/media/catalog/product/cache/1/thumbnail/97x122/9df78eab33525d08d6e5fb8d27136e95/t/l/tlvttlbjj0002.jpeg','2018-10-09 08:49:41'),(80,'tiles','Wall Tile - 300 x 450mm','',50,43,4,'onkar98','https://www.buildersmart.in/media/catalog/product/cache/1/thumbnail/97x122/9df78eab33525d08d6e5fb8d27136e95/t/l/tlwltlbjj0002.jpg','2018-10-09 08:50:19'),(81,'tiles','Aston Coco Polished - 30x60cm','',40,43,4,'onkar98','https://www.buildersmart.in/media/catalog/product/cache/1/thumbnail/97x122/9df78eab33525d08d6e5fb8d27136e95/t/l/tlwltlkcl0006.jpg','2018-10-09 08:51:06'),(82,'tiles','Agate Decor Polished - 30x60cm','Bajaj',100,65,4,'onkar98','https://www.buildersmart.in/media/catalog/product/cache/1/thumbnail/97x122/9df78eab33525d08d6e5fb8d27136e95/t/l/tlwltlkcl0001.jpg','2018-10-09 08:51:59');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) NOT NULL,
  `instant` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000042 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1000038,'abc','2018-10-09 07:40:01'),(1000039,'abc','2018-10-09 07:42:00'),(1000040,'abc','2018-10-09 07:42:56'),(1000041,'abc','2018-10-09 09:19:16');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `places`
--

DROP TABLE IF EXISTS `places`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `places` (
  `order_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `item_count` int(11) NOT NULL,
  PRIMARY KEY (`order_id`,`item_id`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `places_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `places_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `places`
--

LOCK TABLES `places` WRITE;
/*!40000 ALTER TABLE `places` DISABLE KEYS */;
INSERT INTO `places` VALUES (1000038,23,1),(1000039,37,1),(1000039,45,10),(1000041,18,1),(1000041,20,1);
/*!40000 ALTER TABLE `places` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `superusers`
--

DROP TABLE IF EXISTS `superusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `superusers` (
  `user_id` varchar(30) NOT NULL,
  `pass` varchar(30) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `superusers`
--

LOCK TABLES `superusers` WRITE;
/*!40000 ALTER TABLE `superusers` DISABLE KEYS */;
INSERT INTO `superusers` VALUES ('abc@example.com','987654321');
/*!40000 ALTER TABLE `superusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `suppliers` (
  `user_id` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `owner` varchar(45) NOT NULL,
  `reg_id` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `contact` varchar(10) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` int(11) NOT NULL,
  `instant` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES ('dinkar235','DK Materials','Dinkar','9858633675','Hyderabad','9842150316','dkmaterials@gmail.com',7412,'2018-10-09 00:41:28'),('ktraders','Krishna traders','Krishna','4578612305','Noida','2345687123','krishnatraders@gmail.com',5678,'2018-10-08 23:53:58'),('onkar98','Onkar\'s shop','onkar','9876','delhi','7982218432','onkarsingh9898@gmail.com',1234,'2018-10-08 23:36:10'),('prashant99','pk materials','Prashant kumar','2746183756','Delhi','9845176230','pkmaterials@gmail.com',258,'2018-10-09 00:27:11'),('RAHUL12','Rahul Building Materials','Rahul Kumar','8346271348','Gurgaon','7524639586','rbmaterials@gmail.com',9654,'2018-10-09 00:56:43'),('uttam123','Uttam Materials','Uttam','4512365214','Greater Noida','8346726123','uttam@gmail.com',987,'2018-10-09 00:08:19');
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `user_id` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `contact` varchar(10) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` int(11) NOT NULL,
  `instant` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('abc','Ravi','delhi','7982218432','onkarsingh998@gmail.com',5678,'2018-10-09 07:13:47');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-09 15:24:55
