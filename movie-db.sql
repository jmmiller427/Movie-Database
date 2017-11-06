-- MySQL dump 10.13  Distrib 5.7.17, for Linux (x86_64)
--
-- Host: mysql.cs.uky.edu    Database: hjwa223
-- ------------------------------------------------------
-- Server version	5.5.5-10.0.28-MariaDB-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `crew`
--

DROP TABLE IF EXISTS `crew`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crew` (
  `movie_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  KEY `movie_id` (`movie_id`),
  CONSTRAINT `crew_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crew`
--

LOCK TABLES `crew` WRITE;
/*!40000 ALTER TABLE `crew` DISABLE KEYS */;
INSERT INTO `crew` VALUES (1,1,'Tony Scott'),(1,2,'Don Simpson'),(1,2,'Jerry Bruckheimer'),(1,3,'Jim Cash'),(1,3,'Jack Epps, Jr.'),(1,4,'Tom Cruise'),(1,4,'Val Kilmer'),(1,5,'Chris Lebenzon'),(1,5,'Billy Weber'),
(2,1,'Tony Bancroft'),(2,1,'Barry Cook'),(2,2,'Pam Coats'),(2,2,'Chris Bender'),(2,3,'Chris Sanders'),(2,3,'Philip LaZebnik'),(2,4,'Mulan'),(2,5,'Micheal Kelly'),
(3,1,'John Musker'),(3,1,'Ron Clements'),(3,2,'Howard Ashman'),(3,3,'Roger Allers'),(3,3,'Gerrit Graham'),(3,4,'Ariel'),(3,5,'Mark Hester'),
(4,1,'Victor Fleming'),(4,1,'Mervyn LeRoy'),(4,2,'William Horning'),(4,3,'Bert Lahr'),(4,3,'Jack Haley'),(4,4,'Judy Garland'),(4,4,'Ray Bolger'),(4,5,'Blanche Sewell'),
(5,1,'John McTiernan'),(5,2,'Joel Silver'),(5,3,'Jeb Stuart'),(5,3,'Steve Souza'),(5,4,'Bruce Willis'),(5,4,'Alan Rickman'),(5,5,'Frank Urioste'),
(6,1,'Richard Donner'),(6,2,'Joel Silver'),(6,3,'Jeffrey Boam'),(6,3,'Robert Kamen'),(6,4,'Mel Gibson'),(6,4,'Danny Glover'),(6,5,'Battle Davis'),
(7,1,'John Lee Hancock'),(7,2,'Gil Netter'),(7,3,'John Lee Hancock'),(7,4,'Sandra Bullock'),(7,4,'Tim McGraw'),(7,5,'Mark Livolsi'),
(8,1,'Peter Barsocchini'),(8,2,'Don Schain'),(8,3,'Gordon Lonsdale'),(8,4,'Zac Efron'),(8,4,'Vanessa Hudgens'),(8,5,'Seth Flaum'),
(9,1,'Roger Allers'),(9,2,'Don Hahn'),(9,3,'Irene Mecchi'),(9,4,'Matthew Broderick'),(9,4,'James Earl Jones'),(9,5,'Ivan Bilancio'),
(10,1,'Stephen Herek'),(10,2,'John Hughes'),(10,3,'John Hughes'),(10,4,'Glenn Close'),(10,4,'Jeff Daniels'),(10,5,'Trudy Ship'),
(11,1,'Francis Coppola'),(11,2,'Albert Ruddy'),(11,3,'Mario Puzo'),(11,4,'Marlon Brando'),(11,4,'Al Pacino'),(11,5,'Peter Zinner'),
(12,1,'Frank Darabont'),(12,2,'Niki Marvin'),(12,3,'Stephen King'),(12,4,'Tim Robbins'),(12,4,'Morgan Freeman'),(12,5,'Richard Bruce'),
(13,1,'Christopher Nolan'),(13,2,'Emma Thomas'),(13,3,'Jonathan Nolan'),(13,4,'Christian Bale'),(13,4,'Micheal Caine'),(13,5,'Lee Smith'),
(14,1,'Sidney Lumet'),(14,2,'Henry Fonda'),(14,3,'Reginald Rose'),(14,4,'Henry Fonda'),(14,4,'Lee Cobb'),(14,5,'Carl Lerner'),
(15,1,'Steven Spielberg'),(15,2,'Steven Spielberg'),(15,3,'Steven Zaillian'),(15,4,'Ben Kingsley'),(15,4,'Liam Neeson'),(15,5,'Micheal Kahn'),
(16,1,'Quentin Tarantino'),(16,2,'Lawrence Bender'),(16,3,'Quentin Tarantino'),(16,4,'John Travolta'),(16,4,'Uma Thurman'),(16,5,'Sally Menke'),
(17,1,'David Fincher'),(17,2,'Art Linson'),(17,3,'Jim Uhls'),(17,4,'Brad Pitt'),(17,4,'Edward Norton'),(17,5,'James Haygood'),
(18,1,'Robert Zemeckis'),(18,2,'Steve Tisch'),(18,3,'Eric Roth'),(18,4,'Robin Wright'),(18,4,'Tom Hanks'),(18,5,'Arthur Schmidt'),
(19,1,'Christopher Nolan'),(19,2,'Emma Thomas'),(19,3,'Christopher Nolan'),(19,4,'Leonardo DiCaprio'),(19,4,'Ellen Page'),(19,5,'Lee Smith'),
(20,1,'Martin Scorsese'),(20,2,'Irwin Winkler'),(20,3,'Martin Scorsese'),(20,4,'Robert De Niro'),(20,4,'Ray Liotta'),(20,5,'Thelma Schoonmaker'),
(21,1,'Jonathan Demme'),(21,2,'Kenneth Utt'),(21,3,'Ted Tally'),(21,4,'Jodie Foster'),(21,4,'Anthony Hopkins'),(21,5,'Craig McKay'),
(22,1,'The Wachowski Brothers'),(22,2,'Joel Silver'),(22,3,'The Wachowski Brothers'),(22,4,'Laurence Fishburne'),(22,4,'Keanu Reeves'),(22,5,'Zach Staenberg'),
(23,1,'Christopher Nolan'),(23,2,'Emma Thomas'),(23,3,'Jonathan Nolan'),(23,4,'Matthew McConaughey'),(23,4,'Anne Hathaway'),(23,5,'Lee Smith'),
(24,1,'Frank Darabont'),(24,2,'David Valdes'),(24,3,'Frank Darabont'),(24,4,'Tom Hanks'),(24,4,'David Morse'),(24,5,'Rachard Bruce'),
(25,1,'Steven Spielberg'),(25,2,'Frank Marshall'),(25,3,'Lawrence Kasdan'),(25,4,'Harrison Ford'),(25,4,'Karen Allen'),(25,5,'Micheal Kahn'),
(26,1,'Ridley Scott'),(26,2,'Douglas Wick'),(26,3,'David Franzoni'),(26,4,'Russell Crowe'),(26,4,'Joaquin Phoenix'),(26,5,'Pietro Scalia'),
(27,1,'Christopher Nolan'),(27,2,'Suzanne Todd'),(27,3,'Christopher Nolan'),(27,4,'Guy Pearce'),(27,4,'Carrie Moss'),(27,5,'Dody Dorn'),
(28,1,'Mel Gibson'),(28,2,'Mel Gibson'),(28,3,'Randall Wallace'),(28,4,'Mel Gibson'),(28,4,'Sophie Marceau'),(28,5,'Steven Rosenblum'),
(29,1,'Guy Ritchie'),(29,2,'Matthew Vaughn'),(29,3,'Guy Ritchie'),(29,4,'Brad Pitt'),(29,4,'Dennis Farina'),(29,5,'Jon Harris'),
(30,1,'James Gunn'),(30,2,'Kein Feige'),(30,3,'James Gunn'),(30,4,'Chris Pratt'),(30,4,'Zoe Saldana'),(30,5,'Fred Raskin');

/*!40000 ALTER TABLE `crew` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genre` (
  `movie_id` int(11) NOT NULL,
  `genre` varchar(50) DEFAULT NULL,
  KEY `movie_id` (`movie_id`),
  CONSTRAINT `genre_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES (1,'Drama'),(1,'Action'),
(2,'Fantasy'),(2,'Comedy'),(2,'Drama'),
(3,'Fantasy'),(3,'Romance'),
(4,'Fantasy'),(4,'Adventure'),
(5,'Thriller'),(5,'Action'),
(6,'Thriller'),(6,'Action'),
(7,'Drama'),(7,'Sport'),
(8,'Drama'),(8,'Music'),
(9,'Drama'),(9,'Music'),
(10,'Drama'),(10,'Adventure'),
(11,'Crime'),(11,'Action'),
(12,'Action'),(12,'Crime'),
(13,'Crime'),(13,'Action'),
(14,'Crime'),(14,'Justice'),
(15,'Thriller'),(15,'Drama'),
(16,'Crime'),(16,'Drama'),
(17,'Action'),(17,'Drama'),
(18,'Drama'),(18,'Comedy'),
(19,'Action'),(19,'Thriller'),
(20,'Crime'),(20,'Thriller'),
(21,'Horror'),(21,'Thriller'),
(22,'Action'),(22,'Drama'),
(23,'Drama'),(23,'Science Fiction'),
(24,'Mystery'),(24,'Crime'),
(25,'Action'),(25,'Adventure'),
(26,'Action'),(26,'Adventure'),
(27,'Thriller'),(27,'Mystery'),
(28,'Action'),(28,'War'),
(29,'Comedy'),(29,'Thriller'),
(30,'Action'),(30,'Superhero');

/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movies` (
  `movie_id` int(255) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `release_date` varchar(50) DEFAULT NULL,
  `duration` varchar(50) DEFAULT NULL,
  `language` varchar(50) DEFAULT NULL,
  `summary` varchar(4096) DEFAULT NULL,
  PRIMARY KEY (`movie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES (1,'Top Gun','1986-05-16','109','English','Movie about two best friends who are Naval pilots'),
(2,'Mulan','1998-06-19','88','English','Girl disgraces family, but makes up for it big time'),
(3,'Little Mermaid','1989-11-17','92','English','Mermaid wants legs to date a guy, makes huge mistake'),
(4,'Wizard of Oz','1932-08-25','112','English','Girl gets knocked out by twister and hallucinates'),
(5,'Die Hard','1988-06-15','132','English','John McClane puts his terrorist hunting skills to the test'),
(6,'Lethal Weapon 3','1992-05-15','120','English','Two best friend cops take down an arms dealer'),
(7,'The Blind Side','2009-11-20','129','English','Homeless child becomes an NFL player'),
(8,'High School Musical','2006-01-20','98','English','High Schoolers sing about whether singing about singing not being cool'),
(9,'Lion King','1994-06-15','89','English','Lion cub loses father and disgraces uncle in vengance rampage'),
(10,'101 Dalmatians','1996-11-27','103','English','Dogs help take down evil woman trying to kill them for their fur'),
(11,'The Godfather','1972-03-24','175','English','The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son'),
(12,'The Shawshank Redemption','1994-10-14','142','English','Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency'),
(13,'The Dark Knight','2008-07-18','152','English','When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, the Dark Knight must come to terms with one of the greatest psychological tests of his ability to fight injustice'),
(14,'12 Angry Men','1957-04-15','9','English','The defense and the prosecution have rested and the jury is filing into the jury room to decide if a young man is guilty or innocent of murdering his father'),
(15,"Schindler's List", '1993-2-04','195','English','In German-occupied Poland during World War II, Oskar Schindler gradually becomes concerned for his Jewish workforce after witnessing their persecution by the Nazi Germans'),
(16,'Pulp Fiction','1994-10-14','154','English','The lives of two mob hit men, a boxer, a gangsters wife, and a pair of diner bandits intertwine in four tales of violence and redemption'),
(17,'Fight Club','1999-10-15','139','English','An insomniac office worker, looking for a way to change his life, crosses paths with a devil-may-care soap maker, forming an underground fight club that evolves into something much, much more'),
(18,'Forrest Gump','1994-06-06','142','English','While not intelligent, Forrest Gump has accidentally been present at many historic moments, but his true love, Jenny Curran, eludes him'),
(19,'Inception','2010-07-16','148','English','A thief, who steals corporate secrets through use of dream-sharing technology, is given the inverse task of planting an idea into the mind of a CEO'),
(20,'Goodfellas','1990-09-21','146','English','Henry Hill and his friends work their way up through the mob hierarchy'),
(21,'The Silence of the Lambs','1991-02-14','118','English','A young F.B.I. cadet must confide in an incarcerated and manipulative killer to receive his help on catching another serial killer who skins his victims'),
(22,'The Matrix','1999-03-31','136','English','A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers'),
(23,'Interstellar','2014-11-07','169','English','A team of explorers travel through a wormhole in space in an attempt to ensure humanitys survival'),
(24,'The Green Mile','1999-12-10','169','English','The lives of guards on Death Row are affected by one of their charges: a black man accused of child murder and rape, yet who has a mysterious gift'),
(25,'Raiders of the Lost Ark','1981-06-12','115','English','Archaeologist and adventurer Indiana Jones is hired by the U.S. government to find the Ark of the Covenant before the Nazis'),
(26,'Gladiator','2000-05-05','103','English','When a Roman general is betrayed and his family murdered by an emperors corrupt son, he comes to Rome as a gladiator to seek revenge'),
(27,'Memento','2000-05-25','113','English','A man juggles searching for his wifes murderer and keeping his short-term memory loss from being an obstacle'),
(28,'Braveheart','1995-05-24','178','English','When his secret bride is executed for assaulting an English soldier who tried to rape her, Sir William Wallace begins a revolt against King Edward I of England'),
(29,'Snatch','2000-01-19','102','English','Unscrupulous boxing promoters, violent bookmakers, a Russian gangster, incompetent amateur robbers, and supposedly Jewish jewelers fight to track down a priceless stolen diamond'),
(30,'Guardians of the Galaxy','2014-08-01','121','English','A group of intergalactic criminals are forced to work together to stop a fanatical warrior from taking control of the universe');

/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `movie_id` int(11) NOT NULL,
  `tag` varchar(50) DEFAULT NULL,
  KEY `movie_id` (`movie_id`),
  CONSTRAINT `tags_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'pilot'),(1,'friends'),(1,'navy'),(1,'planes'),(1,'war'),
(2,'animated'),(2,'war'),(2, 'dragon'),(2,'daughter'),(2,'family'),
(3,'sing'),(3,'love'),(3,'voice'),(3,'mermaid'),(3,'ocean'),
(4,'witch'),(4,'lost'),(4,'home'),(4,'twister'),(4,'singing'),
(5,'thrill'),(5,'action'),(5,'building'),(5,'cops'),(5,'terrorism'),
(6,'guns'),(6,'action'),(6,'friends'),(6,'cops'),(6,'terrorism'),
(7,'lost'),(7,'homeless'),(7,'school'),(7,'football'),(7,'family'),
(8,'love'),(8,'play'),(8,'basketball'),(8,'school'),(8,'singing'),
(9,'friends'),(9,'lions'),(9,'lost'),(9,'revenge'),(9,'family'),
(10,'captive'),(10,'woman'),(10,'family'),(10,'evil'),(10,'dogs'),
(11,'mob'),(11,'killing'),(11,'italian'),(11,'new york'),(11,'suits'),
(12,'prison'),(12,'books'),(12,'hope'),(12,'poster'),(12,'warden'),
(13,'batman'),(13,'crime'),(13,'action'),(13,'thrill'),(13,'joker'),
(14,'killing'),(14,'dad'),(14,'murder'),(14,'jury'),(14,'justice'),
(15,'nazi'),(15,'killing'),(15,'thrill'),(15,'scary'),(15,'dark'),
(16,'killing'),(16,'action'),(16,'postmodern'),(16,'violence'),(16,'boxer'),
(17,'fight'),(17,'club'),(17,'secret'),(17,'action'),(17,'thrill'),
(18,'war'),(18,'love'),(18,'action'),(18,'shrimp'),(18,'ping pong'),
(19,'sleep'),(19,'action'),(19,'thrill'),(19,'agents'),(19,'crazy'),
(20,'mob'),(20,'action'),(20,'thrill'),(20,'killing'),(20,'italian'),
(21,'thrill'),(21,'murder'),(21,'killing'),(21,'scary'),(21,'dark'),
(22,'action'),(22,'unreal'),(22,'thrill'),(22,'shooting'),(22,'guns'),
(23,'space'),(23,'time'),(23,'life'),(23,'earth'),(23,'family'),
(24,'passion'),(24,'family'),(24,'murder'),(24,'god'),(24,'prison'),
(25,'archaelogy'),(25,'action'),(25,'treasure'),(25,'secrets'),(25,'nazi'),
(26,'gladiator'),(26,'action'),(26,'battle'),(26,'killing'),(26,'rome'),
(27,'memory'),(27,'crime'),(27,'wife'),(27,'murder'),(27,'mystery'),
(28,'action'),(28,'war'),(28,'killing'),(28,'family'),(28,'justice'),
(29,'crime'),(29,'money'),(29,'action'),(29,'killing'),(29,'thrill'),
(30,'action'),(30,'space'),(30,'comedy'),(30,'heroes'),(30,'crime');

/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_rating`
--

DROP TABLE IF EXISTS `user_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_rating` (
  `movie_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `review` varchar(512) DEFAULT NULL,
  KEY `movie_id` (`movie_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_rating_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`),
  CONSTRAINT `user_rating_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_rating`
--

LOCK TABLES `user_rating` WRITE;
/*!40000 ALTER TABLE `user_rating` DISABLE KEYS */;
INSERT INTO `user_rating` VALUES (2,3,3,'Great movie really spoke to me'),
(2,2,1,'Not a huge fan of this movie, bad plot'),
(10,5,4,'Fantastic soundtrack on this movie, great!'),
(8,3,2,'Cinemetography was forgetfull'),
(5,1,3,'Opening scene was well done'),
(4,8,4,'Movie is highly underated, one of my favorites'),
(7,7,3,'Characters are well developed, plot is bad'),
(4,5,3,'Too much dialogue, not enough dancing'),
(5,3,4,'Action scenes are crazy in this movie'),
(9,6,5,'I am a huge fan of lions, so this movie is amazing'),
(12,1,3,'Boring movie, could have been done better'),
(15,8,4,'Really scary movie, too scary for me'),
(19,7,3,'This movie messed with my mind too much, sad'),
(21,5,3,'Dont see the appeal to this movie'),
(30,3,7,'This movie was action packed and had comedy'),
(18,6,8,'Great movie, his life was packed'),
(12,1,8,'Wow prison sure looks boring, great movie'),
(11,8,4,'Wish the mob wasnt as scary as it looks in this movie'),
(24,7,7,'Really sad movie but really well made'),
(27,5,3,'He cant remember anything, so idk how he solves crimes'),
(25,3,7,'Hes a teacher and finds treasure, so cool'),
(23,6,5,'This movie was good, but too long'),
(28,1,8,'Love a good war movie, well done'),
(29,8,4,'So many plots, I couldnt follow it at all'),
(15,7,7,'Scary, but really good movie'),
(14,5,3,'This movie is too old, so I dont like it'),
(13,3,4,'Wish the movie wasnt as action packed'),
(17,6,5,'Wish I could review it, but cant talk about it');

/*!40000 ALTER TABLE `user_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(50) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `DoB` varchar(16) DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `user_type` int(11) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'SG','Steve Gibson','1967-09-12','M',0,'password'),
(2,'AW','Anne Wellington','1997-12-23','F',1,'12345'),
(3,'CS','Clark Stevens','1973-02-04','M',0,'secret12'),
(4,'JS','John Smith','1993-07-07','M',1,'trumpet11'),
(5,'SG2','Sharleene Gibson','1988-05-22','F',0,'PurpleSalsa89'),
(6,'AW2','Alice Watson','1995-03-28','F',1,'NamelessEggplant33'),
(7,'FS','Frank Sinatra','1918-04-21','M',0,'redBaronPizza'),
(8,'HR','Harriet Richardson','1970-10-15','F',0,'DAREtoCare21'),
(9,'MF','Mark Fernandez','1954-02-10','M',1,'cantGuessMyPassword1'),
(10,'RR','Rick Rickman','1983-07-28','M',0,'MicrosoftExcel09'),
(11,'MM','Marky Mark','1998-05-22','M',0,'Mozzerella12'),
(12,'YC','Yvonne Clark','1945-03-28','F',1,'Detroit13'),
(13,'red2','Matt Mamoth','1978-04-21','M',0,'MammothGary'),
(14,'green3','Trish Seth','1975-10-15','F',0,'trishspassword1'),
(15,'tfrank23','Terrance Frank','1984-02-10','M',1,'basketball32'),
(16,'rickyyy','Rick Winston','1980-04-28','M',0,'ricklovesme34'),
(17,'hotpockets3','Overlord Perry','1988-05-22','M',0,'mom3'),
(18,'tomato4','Mario Batali','1965-03-28','M',1,'kissthecook5'),
(19,'trumpet11','Dean Martin','1919-04-21','M',0,'singing54'),
(20,'45classes','Steve Stevens','1974-10-15','M',0,'sssteve'),
(21,'baseball2','Darren Sharper','1956-02-10','M',1,'hardesthitting'),
(22,'rodneythedude','Tom Hardy','1983-07-28','M',0,'snappypepper5'),
(23,'trashcan11','Garbage Johnson','1988-05-22','M',0,'thedump3'),
(24,'hookshotstoday','Kareem Ricardo','1955-03-28','M',1,'bball2'),
(25,'turtlelover','Ross Fromfriends','1918-04-21','M',0,'ranchdressing'),
(26,'football','Garrette Peoples','1970-10-15','M',0,'quarterback65'),
(27,'readytogo43','Mark Quincy','1954-02-10','M',1,'lovetorun'),
(28,'palace23','Emperor Trey','1983-07-28','M',0,'redbrick4'),
(29,'45trains','Rebecca Thomas','1988-05-22','F',0,'lovetrins'),
(30,'utopia7','Mellisa Earl','1995-03-28','F',1,'mycity5');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watchlist`
--

DROP TABLE IF EXISTS `watchlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `watchlist` (
  `user_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watchlist`
--

LOCK TABLES `watchlist` WRITE;
/*!40000 ALTER TABLE `watchlist` DISABLE KEYS */;
INSERT INTO `watchlist` VALUES (1,1),(1,2),
(2,5),(6,2),(9,6),(8,2),(7,1),
(9,9),(3,6),(4,3),(5,6),(6,6),
(7,10),(8,8),(9,16),(10,1),(14,15),
(7,11),(18,18),(9,21),(22,1),(24,26),
(17,13),(14,8),(22,23),(25,30),(27,27),
(3,16),(18,4),(4,17),(5,29),(14,24),
(27,10),(28,8),(30,19),(30,1);

/*!40000 ALTER TABLE `watchlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-22 16:26:28
