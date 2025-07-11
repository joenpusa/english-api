-- MySQL dump 10.13  Distrib 8.0.41, for Linux (x86_64)
--
-- Host: localhost    Database: english_learning_app
-- ------------------------------------------------------
-- Server version	8.0.41-0ubuntu0.22.04.1

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
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (4,'Listening'),(3,'Reading'),(1,'Speaking'),(2,'Writing');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `exam_exercise`
--

LOCK TABLES `exam_exercise` WRITE;
/*!40000 ALTER TABLE `exam_exercise` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_exercise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `exams`
--

LOCK TABLES `exams` WRITE;
/*!40000 ALTER TABLE `exams` DISABLE KEYS */;
/*!40000 ALTER TABLE `exams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `exercise_license_access`
--

LOCK TABLES `exercise_license_access` WRITE;
/*!40000 ALTER TABLE `exercise_license_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `exercise_license_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `exercise_progress`
--

LOCK TABLES `exercise_progress` WRITE;
/*!40000 ALTER TABLE `exercise_progress` DISABLE KEYS */;
/*!40000 ALTER TABLE `exercise_progress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `exercise_types`
--

LOCK TABLES `exercise_types` WRITE;
/*!40000 ALTER TABLE `exercise_types` DISABLE KEYS */;
INSERT INTO `exercise_types` VALUES (1,'write','User must write the correct translation'),(2,'select','User must select the correct answer from options'),(3,'audio_write','User listens to the word and writes the translation'),(4,'audio_select','User listens to the word and selects the correct answer'),(5,'write_inv','User must write the correct translation inverted'),(6,'select_inv','User must select the correct answer from options inverted'),(7,'audio_write_inv','User listens to the word and writes the translation inverted'),(8,'audio_select_inv','User listens to the word and selects the correct answer inverted');
/*!40000 ALTER TABLE `exercise_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `exercises`
--

LOCK TABLES `exercises` WRITE;
/*!40000 ALTER TABLE `exercises` DISABLE KEYS */;
/*!40000 ALTER TABLE `exercises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `levels`
--

LOCK TABLES `levels` WRITE;
/*!40000 ALTER TABLE `levels` DISABLE KEYS */;
INSERT INTO `levels` VALUES (1,'A1'),(2,'A2'),(3,'B1'),(4,'B2'),(5,'C1'),(6,'C2');
/*!40000 ALTER TABLE `levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `licenses`
--

LOCK TABLES `licenses` WRITE;
/*!40000 ALTER TABLE `licenses` DISABLE KEYS */;
INSERT INTO `licenses` VALUES (1,'free','Limited access to selected content'),(2,'premium','Full access for individual users'),(3,'institutional','Access for organizations and institutions');
/*!40000 ALTER TABLE `licenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `refresh_tokens`
--

LOCK TABLES `refresh_tokens` WRITE;
/*!40000 ALTER TABLE `refresh_tokens` DISABLE KEYS */;
INSERT INTO `refresh_tokens` VALUES (2,1,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZW1haWwiOiJqb2huQGV4YW1wbGUuY29tIiwiaWF0IjoxNzUyMTE0ODk1LCJleHAiOjE3NTI3MTk2OTV9.OH0lYv543_nFpsbahi2imY8YGjI5Rv4-yqlFU6YATf0','2025-07-16 21:34:56','2025-07-10 02:34:55'),(3,1,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZW1haWwiOiJqb2huQGV4YW1wbGUuY29tIiwiaWF0IjoxNzUyMTE0ODk3LCJleHAiOjE3NTI3MTk2OTd9.mWYk5w02c4YIqrx3rAuof44cQJqOkarR0Owpq7oYShU','2025-07-16 21:34:58','2025-07-10 02:34:57');
/*!40000 ALTER TABLE `refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'John','john@example.com','$2b$10$Va68FcVttgcAc5n/veQGAOx14aIuJtnWIeOzCIy5Se4iEyXdT71gy','2025-07-08 21:26:22',1),(2,'Jorge Pulido','joenpusa@gmail.com','$2b$10$wcZmH2zVIjJwqFtHO7ISIuqm/5USpmvzqexgewMHQCuis.AxUEtJG','2025-07-08 21:27:31',1),(4,'John Mendez','john22@example.com','$2b$10$ugiv/VNKrTesIsa6pNxVp.m0bYEACjcVTgQq59dEkiXeRw1ZqLFDO','2025-07-09 20:39:01',1),(5,'Juan Mendez','john23@example.com','$2b$10$ZpUptFVzoOkauK.I5eK.4uGpH0c7pDUrsN5EK.3cT9eGhG5xRCJF2','2025-07-09 21:30:53',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `vocabulary`
--

LOCK TABLES `vocabulary` WRITE;
/*!40000 ALTER TABLE `vocabulary` DISABLE KEYS */;
INSERT INTO `vocabulary` VALUES (21,'hello','hola',1,1,NULL,'[\"hola\"]','[\"hello\"]'),(22,'goodbye','adiós',1,2,NULL,'[\"adiós\", \"adios\"]','[\"goodbye\", \"bye\"]'),(23,'please','por favor',1,1,NULL,'[\"por favor\"]','[\"please\"]'),(24,'thank you','gracias',1,2,NULL,'[\"gracias\"]','[\"thank you\", \"thanks\"]'),(25,'yes','sí',1,1,NULL,'[\"sí\", \"si\"]','[\"yes\", \"yeah\"]'),(26,'no','no',1,2,NULL,'[\"no\"]','[\"no\"]'),(27,'man','hombre',1,1,NULL,'[\"hombre\"]','[\"man\"]'),(28,'woman','mujer',1,3,NULL,'[\"mujer\"]','[\"woman\", \"lady\"]'),(29,'child','niño/niña',1,4,NULL,'[\"niño\", \"niña\", \"niño/niña\"]','[\"child\"]'),(30,'house','casa',1,2,NULL,'[\"casa\"]','[\"house\"]'),(31,'cat','gato',1,3,NULL,'[\"gato\"]','[\"cat\"]'),(32,'dog','perro',1,4,NULL,'[\"perro\"]','[\"dog\"]'),(33,'water','agua',1,1,NULL,'[\"agua\"]','[\"water\"]'),(34,'food','comida',1,2,NULL,'[\"comida\", \"alimento\"]','[\"food\"]'),(35,'car','carro',1,3,NULL,'[\"carro\", \"coche\", \"automóvil\"]','[\"car\", \"auto\"]'),(36,'book','libro',1,1,NULL,'[\"libro\"]','[\"book\"]'),(37,'school','escuela',1,2,NULL,'[\"escuela\", \"colegio\"]','[\"school\"]'),(38,'teacher','profesor/profesora',1,1,NULL,'[\"profesor\", \"profesora\"]','[\"teacher\"]'),(39,'student','estudiante',1,3,NULL,'[\"estudiante\"]','[\"student\"]'),(40,'pen','bolígrafo',1,4,NULL,'[\"bolígrafo\", \"pluma\"]','[\"pen\"]'),(41,'mother','madre',1,1,NULL,'[\"madre\", \"mamá\", \"mama\"]','[\"mother\", \"mom\"]'),(42,'father','padre',1,1,NULL,'[\"padre\", \"papá\", \"papa\"]','[\"father\", \"dad\"]'),(43,'friend','amigo/amiga',1,2,NULL,'[\"amigo\", \"amiga\", \"amigo/amiga\"]','[\"friend\"]'),(44,'apple','manzana',1,2,NULL,'[\"manzana\"]','[\"apple\"]'),(45,'banana','banana',1,3,NULL,'[\"banana\", \"plátano\"]','[\"banana\"]'),(46,'bed','cama',1,1,NULL,'[\"cama\"]','[\"bed\"]'),(47,'chair','silla',1,1,NULL,'[\"silla\"]','[\"chair\"]'),(48,'table','mesa',1,1,NULL,'[\"mesa\"]','[\"table\"]'),(49,'sun','sol',1,2,NULL,'[\"sol\"]','[\"sun\"]'),(50,'moon','luna',1,2,NULL,'[\"luna\"]','[\"moon\"]'),(51,'blue','azul',1,2,NULL,'[\"azul\"]','[\"blue\"]'),(52,'red','rojo',1,2,NULL,'[\"rojo\"]','[\"red\"]'),(53,'happy','feliz',1,1,NULL,'[\"feliz\", \"contento\", \"contenta\"]','[\"happy\"]'),(54,'sad','triste',1,1,NULL,'[\"triste\"]','[\"sad\"]'),(55,'cold','frío',1,1,NULL,'[\"frío\", \"frio\"]','[\"cold\"]'),(56,'hot','caliente',1,1,NULL,'[\"caliente\"]','[\"hot\"]'),(57,'small','pequeño',1,2,NULL,'[\"pequeño\", \"pequeña\"]','[\"small\"]'),(58,'big','grande',1,2,NULL,'[\"grande\"]','[\"big\"]'),(59,'door','puerta',1,1,NULL,'[\"puerta\"]','[\"door\"]'),(60,'window','ventana',1,1,NULL,'[\"ventana\"]','[\"window\"]');
/*!40000 ALTER TABLE `vocabulary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `vocabulary_progress`
--

LOCK TABLES `vocabulary_progress` WRITE;
/*!40000 ALTER TABLE `vocabulary_progress` DISABLE KEYS */;
/*!40000 ALTER TABLE `vocabulary_progress` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-10 21:57:10
