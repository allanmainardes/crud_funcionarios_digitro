USE mysql;

CREATE DATABASE employees;

USE employees;

CREATE USER 'system'@'%' IDENTIFIED BY 'syst3m';

GRANT ALL PRIVILEGES ON employees.* TO 'system'@'%';

FLUSH PRIVILEGES;

DROP TABLE IF EXISTS `tb_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_employees` (
  `id_func` int(11) NOT NULL AUTO_INCREMENT,
  `nome_func` varchar(100) NOT NULL,
  `cpf_func` varchar(11) NOT NULL,
  `email_func` varchar(50) NOT NULL,
  `estado_civil_func` varchar(50) NOT NULL,
  `dt_nascimento_func` date NOT NULL,
  PRIMARY KEY (`id_func`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_employees`
--

LOCK TABLES `tb_employees` WRITE;
/*!40000 ALTER TABLE `tb_employees` DISABLE KEYS */;
INSERT INTO `tb_employees` VALUES (1,'Pedro Chaves Couto','63673494210','pedro.couto@geradornv.com.br','solteiro','1997-01-11'),(2,'Emmanuel Navega Thomaz','33075761940','emmanuel.thomaz@geradornv.com.br','viuvo','1957-12-08'),(3,'Suenia Campelo de Padua','59723416115','suenia.padua@geradornv.com.br','casado','1970-02-17'),(4,'Grecy Sarmanto Mendonça','33645709494','grecy.mendonca@geradornv.com.br','solteiro','1962-02-26');
/*!40000 ALTER TABLE `tb_employees` ENABLE KEYS */;
UNLOCK TABLES;

SET GLOBAL time_zone = '-03:00';
SET sql_mode = '';
SET foreign_key_checks = 1;
SET unique_checks = 1;
SET character_set_client=utf8;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
SET collation_connection = 'utf8mb4_unicode_ci';
SET sql_notes = 1;





-- Dump completed on 2022-04-07 20:38:23