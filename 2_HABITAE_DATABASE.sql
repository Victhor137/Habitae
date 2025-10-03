CREATE DATABASE  IF NOT EXISTS `habitae` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `habitae`;
-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: habitae
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `anuncio`
--

DROP TABLE IF EXISTS `anuncio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `anuncio` (
  `ID_ANUNCIO` int NOT NULL AUTO_INCREMENT,
  `CNPJ` varchar(14) NOT NULL,
  `ID_IMOVEL` int NOT NULL,
  `REDE` enum('Online','Impresso','Tv','Outdoor') NOT NULL,
  `DESCRICAO` varchar(100) DEFAULT NULL,
  `VALOR` decimal(10,2) NOT NULL,
  PRIMARY KEY (`ID_ANUNCIO`),
  KEY `fk_anuncio_empresa` (`CNPJ`),
  KEY `fk_anuncio_imovel` (`ID_IMOVEL`),
  CONSTRAINT `fk_anuncio_empresa` FOREIGN KEY (`CNPJ`) REFERENCES `empresa` (`CNPJ`),
  CONSTRAINT `fk_anuncio_imovel` FOREIGN KEY (`ID_IMOVEL`) REFERENCES `imovel` (`ID_IMOVEL`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anuncio`
--

LOCK TABLES `anuncio` WRITE;
/*!40000 ALTER TABLE `anuncio` DISABLE KEYS */;
INSERT INTO `anuncio` VALUES (1,'12345678000199',1,'Online','Apartamento com vista para o mar no centro de São Paulo',500.00),(2,'12345678000199',2,'Impresso','Casa com piscina no Rio de Janeiro - ótima localização',750.00),(3,'12345678000199',3,'Online','Sala comercial em Belo Horizonte - perfeita para escritório',300.00),(4,'12345678000199',4,'Tv','Kitnet mobiliado em Salvador - próximo ao metrô',450.00),(5,'12345678000199',5,'Outdoor','Casa de condomínio em Brasília - 3 suítes',1200.00),(6,'12345678000199',6,'Online','Ponto comercial em Curitiba - alta circulação',600.00),(7,'12345678000199',7,'Impresso','Apartamento de luxo em Porto Alegre - varanda gourmet',1500.00),(8,'12345678000199',8,'Online','Casa geminada em Recife - garagem para 2 carros',850.00),(9,'12345678000199',9,'Tv','Galpão logístico em Fortaleza - 500m²',2000.00),(10,'12345678000199',10,'Outdoor','Kitnet em Vitória - ideal para estudantes',350.00),(11,'12345678000199',11,'Online','Sobrado em Maceió - área de lazer completa',950.00),(12,'12345678000199',12,'Impresso','Apartamento em São Luís - acabamento de alto padrão',1100.00),(13,'12345678000199',13,'Online','Loja em shopping center de Manaus',1800.00),(14,'12345678000199',14,'Tv','Chácara em Palmas - perfeita para temporada',1300.00),(15,'12345678000199',15,'Outdoor','Apartamento em Cuiabá - vista panorâmica',700.00),(16,'12345678000199',16,'Online','Escritório corporativo em Florianópolis',900.00),(17,'12345678000199',17,'Impresso','Casa de praia em Teresina - acesso direto à areia',1600.00),(18,'12345678000199',18,'Online','Studio em João Pessoa - para estudantes',400.00),(19,'12345678000199',19,'Tv','Terreno comercial em Aracaju - zona norte',2200.00),(20,'12345678000199',20,'Outdoor','Casa em Belém - jardim e espelho d água',950.00),(21,'12345678000199',21,'Online','Apartamento em Manaus - lazer completo',800.00),(22,'12345678000199',22,'Impresso','Salão de beleza em Luziânia - pronto para uso',550.00),(23,'12345678000199',23,'Online','Casa histórica em Campinas - restaurada',1700.00),(24,'12345678000199',24,'Tv','Apartamento em Ribeirão Preto - mobília designer',1250.00),(25,'12345678000199',25,'Outdoor','Box em centro de convenções - São José do Rio Preto',1900.00),(26,'12345678000199',26,'Online','Casa em Divinópolis - piscina aquecida',1400.00),(27,'12345678000199',27,'Impresso','Apartamento duplex em Uberlândia - com terraço',1600.00),(28,'12345678000199',28,'Online','Consultório médico em Uberaba',750.00),(29,'12345678000199',29,'Tv','Casa em Vila Velha - home theater built-in',1800.00),(30,'12345678000199',30,'Outdoor','Apartamento em Vitória - varanda ampla',950.00),(31,'12345678000199',31,'Online','Posto de gasolina em Curitiba',2500.00),(32,'12345678000199',32,'Impresso','Casa de campo em Porto Alegre - com lareira',1300.00),(33,'12345678000199',33,'Online','Apartamento em Recife - vista para o parque',850.00),(34,'12345678000199',34,'Tv','Restaurante montado em Fortaleza',2100.00),(35,'12345678000199',35,'Outdoor','Mansão em Maceió - 5 suítes e piscina',3000.00),(36,'12345678000199',36,'Online','Apartamento em São Luís - climatização central',1100.00),(37,'12345678000199',37,'Impresso','Hotel em Manaus - em funcionamento',3500.00),(38,'12345678000199',38,'Online','Casa container em Palmas - sustentável',900.00),(39,'12345678000199',39,'Tv','Apartamento em Cuiabá - energia solar',1200.00),(40,'12345678000199',40,'Outdoor','Loja de conveniência em Florianópolis',650.00),(41,'12345678000199',41,'Online','Casa inteligente em Teresina - automação',1700.00),(42,'12345678000199',42,'Impresso','Apartamento em João Pessoa - portaria 24h',1000.00),(43,'12345678000199',43,'Online','Supermercado em Aracaju - com estoque',2800.00),(44,'12345678000199',44,'Tv','Casa em Belém - studio de gravação',1900.00),(45,'12345678000199',45,'Outdoor','Apartamento em Manaus - piscina privativa',1500.00),(46,'12345678000199',46,'Online','Oficina mecânica em Luziânia - equipada',1600.00),(47,'12345678000199',47,'Impresso','Casa em Campinas - deck de madeira',1300.00),(48,'12345678000199',48,'Online','Apartamento em Ribeirão Preto - academia privativa',1400.00),(49,'12345678000199',49,'Tv','Franquia em São José do Rio Preto - em operação',3200.00),(50,'12345678000199',50,'Outdoor','Casa em Divinópolis - forno de pizza artesanal',1100.00);
/*!40000 ALTER TABLE `anuncio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresa` (
  `CNPJ` varchar(14) NOT NULL,
  `NOME` varchar(30) NOT NULL,
  `TELEFONE` varchar(15) NOT NULL,
  `EMAIL` varchar(60) NOT NULL,
  `ENDERECO_FISICO` varchar(30) NOT NULL,
  PRIMARY KEY (`CNPJ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
INSERT INTO `empresa` VALUES ('12345678000199','HABITAE','40028922','atendimento@habitae.com','Rua dos Alfeneiros Numero 04');
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endereco` (
  `ID_ENDERECO` int NOT NULL AUTO_INCREMENT,
  `CEP` char(8) NOT NULL,
  `RUA` varchar(100) NOT NULL,
  `NUMERO` int NOT NULL,
  `COMPLEMENTO` varchar(100) DEFAULT NULL,
  `CIDADE` varchar(50) NOT NULL,
  `ESTADO` char(2) NOT NULL,
  PRIMARY KEY (`ID_ENDERECO`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
INSERT INTO `endereco` VALUES (1,'01001000','Praça da Sé',100,'Lado ímpar','São Paulo','SP'),(2,'20040002','Rua do Ouvidor',50,'Sobrado','Rio de Janeiro','RJ'),(3,'30130005','Avenida Afonso Pena',1000,'Edifício Commercial','Belo Horizonte','MG'),(4,'40010010','Rua Chile',25,'Sala 501','Salvador','BA'),(5,'70040903','Eixo Monumental',12,'Setor Administrativo','Brasília','DF'),(6,'80010000','Rua das Flores',300,'Loja A','Curitiba','PR'),(7,'90010004','Rua dos Andradas',157,'5º andar','Porto Alegre','RS'),(8,'50010020','Rua do Bom Jesus',77,'Casa amarela','Recife','PE'),(9,'60010030','Avenida Beira Mar',200,'Apartamento 302','Fortaleza','CE'),(10,'29010020','Rua da Lama',45,'Fundos','Vitória','ES'),(11,'57010020','Rua do Comércio',88,'Galeria','Maceió','AL'),(12,'65010000','Rua Grande',123,'Sobrado azul','São Luís','MA'),(13,'69010001','Avenida Eduardo Ribeiro',500,'Edifício Amazonas','Manaus','AM'),(14,'77010022','Quadra 101 Sul',15,'Conjunto 3','Palmas','TO'),(15,'78010020','Avenida Getúlio Vargas',700,'Loja 25','Cuiabá','MT'),(16,'88010001','Rua Felipe Schmidt',33,'Sala 1001','Florianópolis','SC'),(17,'64010020','Avenida Frei Serafim',1500,'Casa 2','Teresina','PI'),(18,'58010020','Avenida Epitácio Pessoa',2000,'Apartamento 501','João Pessoa','PB'),(19,'49010020','Rua Laranjeiras',99,'Fundos','Aracaju','SE'),(20,'67010020','Avenida Governador José Malcher',876,'Comércio','Belém','PA'),(21,'72800000','Rua 5',10,'Quadra 8','Luziânia','GO'),(22,'13010020','Rua Barão de Jaguara',555,'Sobrado','Campinas','SP'),(23,'14010020','Avenida Costa e Silva',321,'Galpão','Ribeirão Preto','SP'),(24,'15010020','Rua General Glicério',777,'Loja B','São José do Rio Preto','SP'),(25,'35510000','Rua da Liberdade',88,'Casa verde','Divinópolis','MG'),(26,'38410020','Avenida Rondon Pacheco',1500,'Edifício Center','Uberlândia','MG'),(27,'38010020','Rua Arthur de Machado',222,'Sala 3','Uberaba','MG'),(28,'29110020','Avenida Nossa Senhora da Penha',777,'Loja 12','Vila Velha','ES'),(29,'29010030','Rua São Marcos',111,'Casa dos fundos','Vitória','ES'),(30,'80020020','Rua XV de Novembro',999,'Sobrado histórico','Curitiba','PR'),(31,'81010020','Avenida República Argentina',444,'Conjunto 101','Curitiba','PR'),(32,'90020030','Avenida João Pessoa',321,'Apartamento 201','Porto Alegre','RS'),(33,'91010020','Rua Carlos Gomes',654,'Sala 401','Porto Alegre','RS'),(34,'50020030','Rua da Aurora',789,'Edifício Aurora','Recife','PE'),(35,'51010020','Avenida Boa Viagem',2222,'Apartamento 1002','Recife','PE'),(36,'60020030','Avenida Dom Luís',1234,'Shopping Aldeota','Fortaleza','CE'),(37,'60110020','Rua dos Pacajús',55,'Casa','Fortaleza','CE'),(38,'57020030','Avenida da Paz',333,'Loja 7','Maceió','AL'),(39,'57030040','Rua Jangadeiros Alagoanos',888,'Ponto final','Maceió','AL'),(40,'65020030','Rua do Passeio',666,'Sobrado antigo','São Luís','MA'),(41,'65110020','Avenida Daniel de La Touche',1111,'Condomínio','São Luís','MA'),(42,'49020030','Avenida Ivo do Prado',432,'Comércio','Aracaju','SE'),(43,'49030040','Rua Itabaianinha',987,'Residencial','Aracaju','SE'),(44,'58020030','Rua das Trincheiras',555,'Centro','João Pessoa','PB'),(45,'58030040','Avenida Cabo Branco',1234,'Beira-mar','João Pessoa','PB'),(46,'67020030','Rua Ó de Almeida',777,'Comércio popular','Belém','PA'),(47,'67110020','Avenida Almirante Barroso',888,'Marco','Belém','PA'),(48,'78020030','Rua Galdino Pimentel',333,'Centro Sul','Cuiabá','MT'),(49,'78030040','Avenida Isaac Póvoas',1111,'Praça','Cuiabá','MT'),(50,'88020030','Rua Padre Roma',222,'Centro','Florianópolis','SC');
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionario` (
  `ID_FUNCIONARIO` int NOT NULL AUTO_INCREMENT,
  `CNPJ` varchar(14) NOT NULL,
  `CPF` varchar(11) NOT NULL,
  `NOME` varchar(30) NOT NULL,
  `TELEFONE` varchar(14) NOT NULL,
  PRIMARY KEY (`ID_FUNCIONARIO`),
  UNIQUE KEY `CPF` (`CPF`),
  KEY `fk_funcionario_empresa` (`CNPJ`),
  CONSTRAINT `fk_funcionario_empresa` FOREIGN KEY (`CNPJ`) REFERENCES `empresa` (`CNPJ`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` VALUES (1,'12345678000199','11122233344','Ana Carolina Mendes','11987654321'),(2,'12345678000199','22233344455','Bruno Oliveira Santos','21976543210'),(3,'12345678000199','33344455566','Carla Rodrigues Lima','31965432109'),(4,'12345678000199','44455566677','Diego Almeida Costa','41954321098'),(5,'12345678000199','55566677788','Eduarda Silva Pereira','11943210987'),(6,'12345678000199','66677788899','Fábio Souza Rocha','21932109876'),(7,'12345678000199','77788899900','Gabriela Martins Nunes','31921098765'),(8,'12345678000199','88899900011','Henrique Carvalho Dias','41910987654'),(9,'12345678000199','99900011122','Isabela Ferreira Alves','11909876543'),(10,'12345678000199','00011122233','João Pedro Barbosa','21998765432'),(11,'12345678000199','11122233301','Kamila Santos Oliveira','31987654321'),(12,'12345678000199','22233344402','Leonardo Costa Silva','41976543210'),(13,'12345678000199','33344455503','Mariana Lima Souza','11965432109'),(14,'12345678000199','44455566604','Nicolas Pereira Rodrigues','21954321098'),(15,'12345678000199','55566677705','Olivia Rocha Martins','31943210987'),(16,'12345678000199','66677788806','Paulo Nunes Carvalho','41932109876'),(17,'12345678000199','77788899907','Quezia Dias Ferreira','11921098765'),(18,'12345678000199','88899900008','Rafael Alves Barbosa','21910987654'),(19,'12345678000199','99900011109','Sophia Oliveira Santos','31909876543'),(20,'12345678000199','00011122210','Thiago Silva Costa','41998765432'),(21,'12345678000199','12398745611','Úrsula Souza Lima','11987654321'),(22,'12345678000199','23409856712','Vitor Pereira Rocha','21976543210'),(23,'12345678000199','34510967813','Wanessa Martins Nunes','31965432109'),(24,'12345678000199','45621078914','Xavier Carvalho Dias','41954321098'),(25,'12345678000199','56732189015','Yasmin Ferreira Alves','11943210987'),(26,'12345678000199','67843290116','Zacarias Barbosa Oliveira','21932109876'),(27,'12345678000199','78954301217','Amanda Santos Silva','31921098765'),(28,'12345678000199','89065412318','Bernardo Costa Souza','41910987654'),(29,'12345678000199','90176523419','Cecília Lima Pereira','11909876543'),(30,'12345678000199','01287634520','Daniel Souza Rocha','21998765432'),(31,'12345678000199','12398745621','Elaine Martins Nunes','31987654321'),(32,'12345678000199','23409856722','Felipe Carvalho Dias','41976543210'),(33,'12345678000199','34510967823','Giovana Ferreira Alves','11965432109'),(34,'12345678000199','45621078924','Heitor Barbosa Oliveira','21954321098'),(35,'12345678000199','56732189025','Iara Santos Silva','31943210987'),(36,'12345678000199','67843290126','Joaquim Costa Souza','41932109876'),(37,'12345678000199','78954301227','Kauê Lima Pereira','11921098765'),(38,'12345678000199','89065412328','Larissa Souza Rocha','21910987654'),(39,'12345678000199','90176523429','Murilo Martins Nunes','31909876543'),(40,'12345678000199','01287634530','Nina Carvalho Dias','41998765432'),(41,'12345678000199','11199988831','Otávio Ferreira Alves','11987654321'),(42,'12345678000199','22288877732','Paula Barbosa Oliveira','21976543210'),(43,'12345678000199','33377766633','Quirino Santos Silva','31965432109'),(44,'12345678000199','44466655534','Rita Costa Souza','41954321098'),(45,'12345678000199','55555544435','Sérgio Lima Pereira','11943210987'),(46,'12345678000199','66644433336','Tatiane Souza Rocha','21932109876'),(47,'12345678000199','77733322237','Ubirajara Martins Nunes','31921098765'),(48,'12345678000199','88822211138','Valentina Carvalho Dias','41910987654'),(49,'12345678000199','99911100039','William Ferreira Alves','11909876543'),(50,'12345678000199','00099988840','Zélia Barbosa Oliveira','21998765432');
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imovel`
--

DROP TABLE IF EXISTS `imovel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imovel` (
  `ID_IMOVEL` int NOT NULL AUTO_INCREMENT,
  `CNPJ` varchar(14) NOT NULL,
  `ID_ENDERECO` int NOT NULL,
  `CPF_PROPRIETARIO` varchar(11) NOT NULL,
  `INTENCAO` enum('Venda','Aluguel') NOT NULL,
  `TIPO` enum('Apartamento','Casa','Comercial') NOT NULL,
  `DESCRICAO` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_IMOVEL`),
  KEY `fk_imovel_empresa` (`CNPJ`),
  KEY `fk_imovel_endereco` (`ID_ENDERECO`),
  KEY `fk_imovel_proprietario` (`CPF_PROPRIETARIO`),
  CONSTRAINT `fk_imovel_empresa` FOREIGN KEY (`CNPJ`) REFERENCES `empresa` (`CNPJ`),
  CONSTRAINT `fk_imovel_endereco` FOREIGN KEY (`ID_ENDERECO`) REFERENCES `endereco` (`ID_ENDERECO`),
  CONSTRAINT `fk_imovel_proprietario` FOREIGN KEY (`CPF_PROPRIETARIO`) REFERENCES `proprietario` (`CPF`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imovel`
--

LOCK TABLES `imovel` WRITE;
/*!40000 ALTER TABLE `imovel` DISABLE KEYS */;
INSERT INTO `imovel` VALUES (1,'12345678000199',1,'12345678901','Venda','Apartamento','Apartamento de 2 quartos com vista para o mar na Praça da Sé'),(2,'12345678000199',2,'23456789012','Aluguel','Casa','Casa com quintal amplo e piscina no Rio de Janeiro'),(3,'12345678000199',3,'34567890123','Venda','Comercial','Sala comercial bem localizada no centro de Belo Horizonte'),(4,'12345678000199',4,'45678901234','Aluguel','Apartamento','Apartamento compacto para solteiros em Salvador'),(5,'12345678000199',5,'56789012345','Venda','Casa','Casa de condomínio com 3 suítes em Brasília'),(6,'12345678000199',6,'67890123456','Aluguel','Comercial','Ponto comercial em área de grande circulação em Curitiba'),(7,'12345678000199',7,'78901234567','Venda','Apartamento','Apartamento de luxo com varanda gourmet em Porto Alegre'),(8,'12345678000199',8,'89012345678','Aluguel','Casa','Casa geminada com garagem para 2 carros em Recife'),(9,'12345678000199',9,'90123456789','Venda','Comercial','Galpão logístico com 500m² em Fortaleza'),(10,'12345678000199',10,'01234567890','Aluguel','Apartamento','Kitnet mobiliado próximo ao metrô em Vitória'),(11,'12345678000199',11,'11223344556','Venda','Casa','Sobrado com área de lazer completa em Maceió'),(12,'12345678000199',12,'22334455667','Aluguel','Apartamento','Apartamento com acabamento de alto padrão em São Luís'),(13,'12345678000199',13,'33445566778','Venda','Comercial','Loja em shopping center em Manaus'),(14,'12345678000199',14,'44556677889','Aluguel','Casa','Chácara para temporada em Palmas'),(15,'12345678000199',15,'55667788990','Venda','Apartamento','Apartamento com vista panorâmica em Cuiabá'),(16,'12345678000199',16,'66778899001','Aluguel','Comercial','Escritório corporativo em Florianópolis'),(17,'12345678000199',17,'77889900112','Venda','Casa','Casa de praia com acesso direto à areia em Teresina'),(18,'12345678000199',18,'88990011223','Aluguel','Apartamento','Studio para estudantes em João Pessoa'),(19,'12345678000199',19,'99001112234','Venda','Comercial','Terreno comercial zona norte em Aracaju'),(20,'12345678000199',20,'10020030040','Aluguel','Casa','Casa com jardim e espelho d água em Belém'),(21,'12345678000199',21,'20030040050','Venda','Apartamento','Apartamento com lazer completo em Manaus'),(22,'12345678000199',22,'30040050060','Aluguel','Comercial','Salão de beleza pronto para uso em Luziânia'),(23,'12345678000199',23,'40050060070','Venda','Casa','Casa histórica restaurada em Campinas'),(24,'12345678000199',24,'50060070080','Aluguel','Apartamento','Apartamento com mobília designer em Ribeirão Preto'),(25,'12345678000199',25,'60070080090','Venda','Comercial','Box em centro de convenções em São José do Rio Preto'),(26,'12345678000199',26,'70080090100','Aluguel','Casa','Casa com piscina aquecida em Divinópolis'),(27,'12345678000199',27,'80090100110','Venda','Apartamento','Apartamento duplex com terraço em Uberlândia'),(28,'12345678000199',28,'90010020030','Aluguel','Comercial','Consultório médico em Uberaba'),(29,'12345678000199',29,'10020030041','Venda','Casa','Casa com home theater built-in em Vila Velha'),(30,'12345678000199',30,'20030040051','Aluguel','Apartamento','Apartamento com varanda ampla em Vitória'),(31,'12345678000199',31,'30040050061','Venda','Comercial','Posto de gasolina em Curitiba'),(32,'12345678000199',32,'40050060071','Aluguel','Casa','Casa de campo com lareira em Porto Alegre'),(33,'12345678000199',33,'50060070081','Venda','Apartamento','Apartamento com vista para o parque em Recife'),(34,'12345678000199',34,'60070080091','Aluguel','Comercial','Sala grande em Recife'),(35,'12345678000199',35,'70080090101','Venda','Casa','Mansão com 5 suítes e piscina em Maceió'),(36,'12345678000199',36,'80090100111','Aluguel','Apartamento','Apartamento com climatização central em São Luís'),(37,'12345678000199',37,'90010020031','Venda','Comercial','Hotel em funcionamento em Manaus'),(38,'12345678000199',38,'10020030042','Aluguel','Casa','Casa container sustentável em Palmas'),(39,'12345678000199',39,'20030040052','Venda','Apartamento','Apartamento com energia solar em Cuiabá'),(40,'12345678000199',40,'30040050062','Aluguel','Comercial','Loja de conveniência em Florianópolis'),(41,'12345678000199',41,'40050060072','Venda','Casa','Casa inteligente com automação em Teresina'),(42,'12345678000199',42,'50060070082','Aluguel','Apartamento','Apartamento com portaria 24h em João Pessoa'),(43,'12345678000199',43,'60070080092','Venda','Comercial','Supermercado com estoque em Aracaju'),(44,'12345678000199',44,'70080090102','Aluguel','Casa','Casa com studio de gravação em Belém'),(45,'12345678000199',45,'80090100112','Venda','Apartamento','Apartamento com piscina privativa em Manaus'),(46,'12345678000199',46,'90010020032','Aluguel','Comercial','Oficina mecânica equipada em Luziânia'),(47,'12345678000199',47,'10020030043','Venda','Casa','Casa com deck de madeira em Campinas'),(48,'12345678000199',48,'20030040053','Aluguel','Apartamento','Apartamento com academia privativa em Ribeirão Preto'),(49,'12345678000199',49,'30040050063','Venda','Comercial','Franquia em operação em São José do Rio Preto'),(50,'12345678000199',50,'40050060073','Aluguel','Casa','Casa com forno de pizza artesanal em Divinópolis');
/*!40000 ALTER TABLE `imovel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nota_fiscal`
--

DROP TABLE IF EXISTS `nota_fiscal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nota_fiscal` (
  `ID_NOTA` int NOT NULL AUTO_INCREMENT,
  `ID_PAGAMENTO` int NOT NULL,
  `DATA_EMISSAO` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_NOTA`),
  KEY `fk_nota_fiscal_pagamento` (`ID_PAGAMENTO`),
  CONSTRAINT `fk_nota_fiscal_pagamento` FOREIGN KEY (`ID_PAGAMENTO`) REFERENCES `pagamento` (`ID_PAGAMENTO`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nota_fiscal`
--

LOCK TABLES `nota_fiscal` WRITE;
/*!40000 ALTER TABLE `nota_fiscal` DISABLE KEYS */;
INSERT INTO `nota_fiscal` VALUES (1,1,'2024-03-08 13:30:00'),(2,2,'2024-04-03 17:15:22'),(3,3,'2024-04-28 12:45:33'),(4,4,'2024-06-05 19:20:44'),(5,5,'2024-07-13 14:10:55'),(6,6,'2024-08-01 16:25:11'),(7,7,'2024-08-26 18:40:29'),(8,8,'2024-10-07 11:55:37'),(9,9,'2024-11-15 15:30:48'),(10,10,'2024-11-28 20:05:19'),(11,11,'2025-01-04 13:50:27'),(12,12,'2025-02-13 17:15:36'),(13,13,'2025-02-24 12:20:45'),(14,14,'2025-04-07 19:45:54'),(15,15,'2025-05-01 14:30:03'),(16,16,'2025-06-03 16:55:12'),(17,17,'2025-06-24 18:10:21'),(18,18,'2025-08-05 11:25:30'),(19,19,'2025-08-28 15:40:39'),(20,20,'2025-10-08 20:15:48'),(21,21,'2025-11-02 13:00:57'),(22,22,'2025-12-11 17:35:06'),(23,23,'2025-01-23 12:50:15'),(24,24,'2025-02-03 19:05:24'),(25,25,'2024-03-18 14:20:33'),(26,26,'2024-04-21 16:45:42'),(27,27,'2024-05-08 18:00:51'),(28,28,'2024-06-13 11:15:00'),(29,29,'2024-07-03 15:30:09'),(30,30,'2024-07-29 20:55:18'),(31,31,'2024-09-11 13:40:27'),(32,32,'2024-10-15 17:05:36'),(33,33,'2024-11-23 12:10:45'),(34,34,'2024-12-05 19:35:54'),(35,35,'2025-01-08 14:50:03'),(36,36,'2025-02-13 16:15:12'),(37,37,'2025-03-03 18:30:21'),(38,38,'2025-04-07 11:45:30'),(39,39,'2025-05-11 15:00:39'),(40,40,'2025-06-15 20:25:48'),(41,41,'2025-07-23 13:10:57'),(42,42,'2025-08-08 17:35:06'),(43,43,'2025-09-13 12:50:15'),(44,44,'2025-10-18 19:15:24'),(45,45,'2025-11-28 14:30:33'),(46,46,'2025-12-25 16:45:42'),(47,47,'2024-07-04 18:00:51'),(48,48,'2024-08-08 11:15:00'),(49,49,'2024-09-03 15:30:09'),(50,50,'2024-10-08 20:55:18');
/*!40000 ALTER TABLE `nota_fiscal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamento`
--

DROP TABLE IF EXISTS `pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagamento` (
  `ID_PAGAMENTO` int NOT NULL AUTO_INCREMENT,
  `ID_RESERVA` int NOT NULL,
  `VALOR` decimal(10,2) NOT NULL,
  `DATA_PAGAMENTO` date NOT NULL,
  `TIPO` enum('PIX','Cartão de Débito','Cartão de Crédito','Boleto','Dinheiro') NOT NULL,
  PRIMARY KEY (`ID_PAGAMENTO`),
  KEY `fk_pagamento_reserva` (`ID_RESERVA`),
  CONSTRAINT `fk_pagamento_reserva` FOREIGN KEY (`ID_RESERVA`) REFERENCES `reserva` (`ID_RESERVA`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento`
--

LOCK TABLES `pagamento` WRITE;
/*!40000 ALTER TABLE `pagamento` DISABLE KEYS */;
INSERT INTO `pagamento` VALUES (1,1,1850.00,'2024-03-08','PIX'),(2,2,2450.50,'2024-04-03','Cartão de Crédito'),(3,3,3200.00,'2024-04-28','Boleto'),(4,4,1350.75,'2024-06-05','Cartão de Débito'),(5,5,2950.00,'2024-07-13','PIX'),(6,6,2050.25,'2024-08-01','Cartão de Crédito'),(7,7,3850.00,'2024-08-26','Dinheiro'),(8,8,1100.50,'2024-10-07','PIX'),(9,9,3350.00,'2024-11-15','Cartão de Débito'),(10,10,1500.00,'2024-11-28','Boleto'),(11,11,2800.75,'2025-01-04','Cartão de Crédito'),(12,12,4050.00,'2025-02-13','PIX'),(13,13,2100.25,'2025-02-24','Cartão de Débito'),(14,14,1900.00,'2025-04-07','Boleto'),(15,15,2400.50,'2025-05-01','Cartão de Crédito'),(16,16,3100.00,'2025-06-03','PIX'),(17,17,4250.75,'2025-06-24','Dinheiro'),(18,18,1250.00,'2025-08-05','Cartão de Débito'),(19,19,2000.25,'2025-08-28','PIX'),(20,20,3450.00,'2025-10-08','Cartão de Crédito'),(21,21,1600.50,'2025-11-02','Boleto'),(22,22,2700.00,'2025-12-11','PIX'),(23,23,3500.75,'2025-01-23','Cartão de Débito'),(24,24,2900.00,'2025-02-03','Cartão de Crédito'),(25,25,1800.25,'2024-03-18','PIX'),(26,26,4100.00,'2024-04-21','Boleto'),(27,27,2200.50,'2024-05-08','Cartão de Crédito'),(28,28,3300.00,'2024-06-13','PIX'),(29,29,1400.75,'2024-07-03','Cartão de Débito'),(30,30,2500.00,'2024-07-29','Boleto'),(31,31,3000.25,'2024-09-11','Cartão de Crédito'),(32,32,1700.00,'2024-10-15','PIX'),(33,33,3800.50,'2024-11-23','Dinheiro'),(34,34,2100.00,'2024-12-05','Cartão de Débito'),(35,35,2600.75,'2025-01-08','PIX'),(36,36,3400.00,'2025-02-13','Cartão de Crédito'),(37,37,1500.25,'2025-03-03','Boleto'),(38,38,2300.00,'2025-04-07','PIX'),(39,39,3200.50,'2025-05-11','Cartão de Débito'),(40,40,1900.00,'2025-06-15','Cartão de Crédito'),(41,41,2700.75,'2025-07-23','PIX'),(42,42,2000.00,'2025-08-08','Boleto'),(43,43,3100.25,'2025-09-13','Cartão de Crédito'),(44,44,2400.00,'2025-10-18','PIX'),(45,45,3600.50,'2025-11-28','Dinheiro'),(46,46,1700.00,'2025-12-25','Cartão de Débito'),(47,47,2800.75,'2024-07-04','PIX'),(48,48,3900.00,'2024-08-08','Cartão de Crédito'),(49,49,2100.25,'2024-09-03','Boleto'),(50,50,3000.00,'2024-10-08','PIX');
/*!40000 ALTER TABLE `pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proprietario`
--

DROP TABLE IF EXISTS `proprietario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proprietario` (
  `CPF` varchar(11) NOT NULL,
  `NOME` varchar(100) NOT NULL,
  `TELEFONE` varchar(15) NOT NULL,
  PRIMARY KEY (`CPF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proprietario`
--

LOCK TABLES `proprietario` WRITE;
/*!40000 ALTER TABLE `proprietario` DISABLE KEYS */;
INSERT INTO `proprietario` VALUES ('01234567890','Fernanda Dias Cardoso','21998765432'),('10020030040','Camila Andrade Vasconcelos','41998765432'),('10020030041','Antônio Pires Quintão','11909876543'),('10020030042','Elaine Nascimento Maia','21910987654'),('10020030043','Fábio Medeiros Ávila','31921098765'),('11223344556','Ricardo Nunes Moreira','31987654321'),('12345678901','João Silva Santos','11987654321'),('20030040050','Gustavo Henrique Moraes','11987654321'),('20030040051','Cláudia Moreira Siqueira','21998765432'),('20030040052','Rafael Siqueira Teles','31909876543'),('20030040053','Aline Barros Sacramento','41910987654'),('22334455667','Amanda Teixeira Rocha','41976543210'),('23456789012','Maria Oliveira Costa','21976543210'),('30040050060','Tânia Lopes Brandão','21976543210'),('30040050061','Márcio Almeida Câmara','31987654321'),('30040050062','Cristina Alves Medeiros','41998765432'),('30040050063','Leonardo Dantas Maciel','11909876543'),('33445566778','Bruno Mendes Castro','11965432109'),('34567890123','Pedro Almeida Souza','31965432109'),('40050060070','Diego Montes Xavier','31965432109'),('40050060071','Renata Vieira Bessa','41976543210'),('40050060072','André Coelho Fagundes','11987654321'),('40050060073','Jéssica Tavares Noronha','21998765432'),('44556677889','Isabela Duarte Freitas','21954321098'),('45678901234','Ana Pereira Lima','41954321098'),('50060070080','Vanessa Castro Arruda','41954321098'),('50060070081','José Lima Fontes','11965432109'),('50060070082','Lorena Peixoto Azevedo','21976543210'),('55667788990','Eduardo Correia Neves','31943210987'),('56789012345','Carlos Rodrigues Martins','11943210987'),('60070080090','Roberto Nunes Pacheco','11943210987'),('60070080091','Beatriz Campos Paiva','21954321098'),('60070080092','Sérgio Ramos Donato','31965432109'),('66778899001','Larissa Machado Guimarães','41932109876'),('67890123456','Mariana Ferreira Gomes','21932109876'),('70080090100','Helena Freitas Caldas','21932109876'),('70080090101','Vinícius Almeida Rezende','31943210987'),('70080090102','Yasmin Almeida Simões','41954321098'),('77889900112','Felipe Araújo Dantas','11921098765'),('78901234567','Paulo Carvalho Ribeiro','31921098765'),('80090100110','Daniel Machado Barros','31921098765'),('80090100111','Lúcia Ribeiro Falcão','41932109876'),('80090100112','Tiago Melo Cordeiro','11943210987'),('88990011223','Patrícia Fonseca Peixoto','21910987654'),('89012345678','Julia Santos Alves','41910987654'),('90010020030','Sandra Moura Campos','41910987654'),('90010020031','Marcos Duarte Goulart','11921098765'),('90010020032','Natália Chaves Leão','21932109876'),('90123456789','Lucas Barbosa Pinto','11909876543'),('99001112234','Rodrigo Tavares Brito','31909876543');
/*!40000 ALTER TABLE `proprietario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserva`
--

DROP TABLE IF EXISTS `reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reserva` (
  `ID_RESERVA` int NOT NULL AUTO_INCREMENT,
  `CPF_USUARIO` varchar(11) NOT NULL,
  `ID_IMOVEL` int NOT NULL,
  `CHECKIN` date NOT NULL,
  `CHECKOUT` date NOT NULL,
  PRIMARY KEY (`ID_RESERVA`),
  KEY `fk_reserva_usuario` (`CPF_USUARIO`),
  KEY `fk_reserva_imovel` (`ID_IMOVEL`),
  CONSTRAINT `fk_reserva_imovel` FOREIGN KEY (`ID_IMOVEL`) REFERENCES `imovel` (`ID_IMOVEL`),
  CONSTRAINT `fk_reserva_usuario` FOREIGN KEY (`CPF_USUARIO`) REFERENCES `usuario` (`CPF`),
  CONSTRAINT `check_dates` CHECK ((`CHECKOUT` > `CHECKIN`))
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva`
--

LOCK TABLES `reserva` WRITE;
/*!40000 ALTER TABLE `reserva` DISABLE KEYS */;
INSERT INTO `reserva` VALUES (1,'12345678901',1,'2024-03-15','2024-03-20'),(2,'23456789012',2,'2024-04-10','2024-04-15'),(3,'34567890123',3,'2024-05-05','2024-05-10'),(4,'45678901234',4,'2024-06-12','2024-06-18'),(5,'56789012345',5,'2024-07-20','2024-07-25'),(6,'67890123456',6,'2024-08-08','2024-08-15'),(7,'78901234567',7,'2024-09-03','2024-09-10'),(8,'89012345678',8,'2024-10-14','2024-10-21'),(9,'90123456789',9,'2024-11-22','2024-11-28'),(10,'01234567890',10,'2024-12-05','2024-12-12'),(11,'11223344556',11,'2025-01-11','2025-01-17'),(12,'22334455667',12,'2025-02-20','2025-02-27'),(13,'33445566778',13,'2025-03-03','2025-03-09'),(14,'44556677889',14,'2025-04-14','2025-04-20'),(15,'55667788990',15,'2025-05-08','2025-05-15'),(16,'66778899001',16,'2025-06-10','2025-06-16'),(17,'77889900112',17,'2025-07-01','2025-07-07'),(18,'88990011223',18,'2025-08-12','2025-08-19'),(19,'99001112234',19,'2025-09-04','2025-09-11'),(20,'10020030040',20,'2025-10-15','2025-10-22'),(21,'20030040050',21,'2025-11-09','2025-11-16'),(22,'30040050060',22,'2025-12-18','2025-12-25'),(23,'40050060070',23,'2024-01-22','2024-01-29'),(24,'50060070080',24,'2024-02-10','2024-02-17'),(25,'60070080090',25,'2024-03-25','2024-04-01'),(26,'70080090100',26,'2024-04-28','2024-05-06'),(27,'80090100110',27,'2024-05-15','2024-05-22'),(28,'90010020030',28,'2024-06-20','2024-06-27'),(29,'10020030041',29,'2024-07-10','2024-07-17'),(30,'20030040051',30,'2024-08-05','2024-08-12'),(31,'30040050061',31,'2024-09-18','2024-09-25'),(32,'40050060071',32,'2024-10-22','2024-10-29'),(33,'50060070081',33,'2024-11-30','2024-12-07'),(34,'60070080091',34,'2024-12-12','2024-12-19'),(35,'70080090101',35,'2025-01-15','2025-01-22'),(36,'80090100111',36,'2025-02-20','2025-02-27'),(37,'90010020031',37,'2025-03-10','2025-03-17'),(38,'10020030042',38,'2025-04-14','2025-04-21'),(39,'20030040052',39,'2025-05-18','2025-05-25'),(40,'30040050062',40,'2025-06-22','2025-06-29'),(41,'40050060072',41,'2025-07-30','2025-08-06'),(42,'50060070082',42,'2025-08-15','2025-08-22'),(43,'60070080092',43,'2025-09-20','2025-09-27'),(44,'70080090102',44,'2025-10-25','2025-11-01'),(45,'80090100112',45,'2025-11-10','2025-11-17'),(46,'90010020032',46,'2025-12-05','2025-12-12'),(47,'10020030043',47,'2024-07-11','2024-07-18'),(48,'20030040053',48,'2024-08-15','2024-08-22'),(49,'30040050063',49,'2024-09-10','2024-09-17'),(50,'40050060073',50,'2024-10-15','2024-10-22');
/*!40000 ALTER TABLE `reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `CPF` varchar(11) NOT NULL,
  `NOME` varchar(50) NOT NULL,
  `EMAIL` varchar(50) NOT NULL,
  `TELEFONE` varchar(15) NOT NULL,
  PRIMARY KEY (`CPF`),
  UNIQUE KEY `EMAIL` (`EMAIL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES ('01234567890','João Pedro Oliveira','joao.oliveira@email.com','21998765432'),('10020030040','Thiago Souza Rodrigues','thiago.rodrigues@email.com','41998765432'),('10020030041','Cecília Carvalho Nunes','cecilia.nunes@email.com','11909876543'),('10020030042','Larissa Alves Barbosa','larissa.barbosa@email.com','21910987654'),('10020030043','Ubirajara Costa Lima','ubirajara.lima@email.com','31921098765'),('11223344556','Kamila Santos Costa','kamila.costa@email.com','31987654321'),('12345678901','Ana Carolina Silva','ana.silva@email.com','11987654321'),('20030040050','Úrsula Pereira Martins','ursula.martins@email.com','11987654321'),('20030040051','Daniel Dias Ferreira','daniel.ferreira@email.com','21998765432'),('20030040052','Murilo Oliveira Santos','murilo.santos@email.com','31909876543'),('20030040053','Valentina Souza Rodrigues','valentina.rodrigues@email.com','41910987654'),('22334455667','Leonardo Lima Souza','leonardo.souza@email.com','41976543210'),('23456789012','Bruno Oliveira Santos','bruno.santos@email.com','21976543210'),('30040050060','Vitor Carvalho Nunes','vitor.nunes@email.com','21976543210'),('30040050061','Elaine Alves Barbosa','elaine.barbosa@email.com','31987654321'),('30040050062','Nina Costa Lima','nina.lima@email.com','41998765432'),('30040050063','William Pereira Martins','william.martins@email.com','11909876543'),('33445566778','Mariana Souza Rodrigues','mariana.rodrigues@email.com','11965432109'),('34567890123','Carla Rodrigues Lima','carla.lima@email.com','31965432109'),('40050060070','Wanessa Dias Ferreira','wanessa.ferreira@email.com','31965432109'),('40050060071','Felipe Oliveira Santos','felipe.santos@email.com','41976543210'),('40050060072','Otávio Souza Rodrigues','otavio.rodrigues@email.com','11987654321'),('40050060073','Zélia Carvalho Nunes','zelia.nunes@email.com','21998765432'),('44556677889','Nicolas Martins Pereira','nicolas.pereira@email.com','21954321098'),('45678901234','Diego Almeida Costa','diego.costa@email.com','41954321098'),('50060070080','Xavier Alves Barbosa','xavier.barbosa@email.com','41954321098'),('50060070081','Giovana Costa Lima','giovana.lima@email.com','11965432109'),('50060070082','Paula Pereira Martins','paula.martins@email.com','21976543210'),('55667788990','Olivia Carvalho Nunes','olivia.nunes@email.com','31943210987'),('56789012345','Eduarda Pereira Souza','eduarda.souza@email.com','11943210987'),('60070080090','Yasmin Oliveira Santos','yasmin.santos@email.com','11943210987'),('60070080091','Heitor Souza Rodrigues','heitor.rodrigues@email.com','21954321098'),('60070080092','Quirino Carvalho Nunes','quirino.nunes@email.com','31965432109'),('66778899001','Paulo Ferreira Dias','paulo.dias@email.com','41932109876'),('67890123456','Fábio Rocha Martins','fabio.martins@email.com','21932109876'),('70080090100','Zacarias Costa Lima','zacarias.lima@email.com','21932109876'),('70080090101','Iara Pereira Martins','iara.martins@email.com','31943210987'),('70080090102','Rita Dias Ferreira','rita.ferreira@email.com','41954321098'),('77889900112','Quezia Alves Barbosa','quezia.barbosa@email.com','11921098765'),('78901234567','Gabriela Nunes Carvalho','gabriela.carvalho@email.com','31921098765'),('80090100110','Amanda Souza Rodrigues','amanda.rodrigues@email.com','31921098765'),('80090100111','Joaquim Carvalho Nunes','joaquim.nunes@email.com','41932109876'),('80090100112','Sérgio Alves Barbosa','sergio.barbosa@email.com','11943210987'),('88990011223','Rafael Oliveira Santos','rafael.santos@email.com','21910987654'),('89012345678','Henrique Dias Ferreira','henrique.ferreira@email.com','41910987654'),('90010020030','Bernardo Pereira Martins','bernardo.martins@email.com','41910987654'),('90010020031','Kauê Dias Ferreira','kaue.ferreira@email.com','11921098765'),('90010020032','Tatiane Oliveira Santos','tatiane.santos@email.com','21932109876'),('90123456789','Isabela Alves Barbosa','isabela.barbosa@email.com','11909876543'),('99001112234','Sophia Costa Lima','sophia.lima@email.com','31909876543');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-04 22:39:28
