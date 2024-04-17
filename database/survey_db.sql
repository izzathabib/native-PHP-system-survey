/*
SQLyog Ultimate v12.4.3 (64 bit)
MySQL - 8.0.30 : Database - survey_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `answers` */

DROP TABLE IF EXISTS `answers`;

CREATE TABLE `answers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `survey_id` int NOT NULL,
  `user_id` int NOT NULL,
  `answer` text NOT NULL,
  `question_id` int NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `answers` */

insert  into `answers`(`id`,`survey_id`,`user_id`,`answer`,`question_id`,`date_created`) values 
(1,1,2,'Sample Only',4,'2020-11-10 14:46:07'),
(2,1,2,'[JNmhW],[zZpTE]',2,'2020-11-10 14:46:07'),
(3,1,2,'dAWTD',1,'2020-11-10 14:46:07'),
(4,1,3,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec in tempus turpis, sed fermentum risus. Praesent vitae velit rutrum, dictum massa nec, pharetra felis. Phasellus enim augue, laoreet in accumsan dictum, mollis nec lectus. Aliquam id viverra nisl. Proin quis posuere nulla. Nullam suscipit eget leo ut suscipit.',4,'2020-11-10 15:59:43'),
(5,1,3,'[qCMGO],[JNmhW]',2,'2020-11-10 15:59:43'),
(6,1,3,'esNuP',1,'2020-11-10 15:59:43'),
(7,6,3,'cubaan survey',5,'2024-04-01 12:52:04'),
(8,6,3,'[AHuQP],[VFfKi]',6,'2024-04-01 12:52:04');

/*Table structure for table `questions` */

DROP TABLE IF EXISTS `questions`;

CREATE TABLE `questions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `question` text NOT NULL,
  `frm_option` text NOT NULL,
  `type` varchar(50) NOT NULL,
  `order_by` int NOT NULL DEFAULT '1',
  `survey_id` int NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `questions` */

insert  into `questions`(`id`,`question`,`frm_option`,`type`,`order_by`,`survey_id`,`date_created`) values 
(1,'Sample Survey Question using Radio Button','{\"cKWLY\":\"Option 1\",\"esNuP\":\"Option 2\",\"dAWTD\":\"Option 3\",\"eZCpf\":\"Option 4\"}','radio_opt',3,1,'2020-11-10 12:04:46'),
(2,'Question for Checkboxes','{\"qCMGO\":\"Checkbox label 1\",\"JNmhW\":\"Checkbox label 2\",\"zZpTE\":\"Checkbox label 3\",\"dOeJi\":\"Checkbox label 4\"}','check_opt',2,1,'2020-11-10 12:25:13'),
(4,'Sample question for the text field','','textfield_s',1,1,'2020-11-10 13:34:21'),
(5,'Sample question for the text field','','textfield_s',1,6,'2024-04-01 10:21:40'),
(6,'Question for Checkboxes','{\"AHuQP\":\"Checkboxes 1\",\"VFfKi\":\"Checkboxes 2\"}','check_opt',1,6,'2024-04-01 12:28:36');

/*Table structure for table `survey_set` */

DROP TABLE IF EXISTS `survey_set`;

CREATE TABLE `survey_set` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `user_id` int NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `survey_set` */

insert  into `survey_set`(`id`,`title`,`description`,`user_id`,`start_date`,`end_date`,`date_created`) values 
(1,'Percubaan Survey ke 1','Percubaan Survey ke 1, pertama kali',1,'2024-03-31','2024-06-01','2020-11-10 09:57:47'),
(6,'Percubaan Survey ke 2','Percubaan Survey ke 2',1,'2024-04-01','2024-07-01','2024-04-01 08:59:57');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(200) NOT NULL,
  `lastname` varchar(200) NOT NULL,
  `middlename` varchar(200) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '3' COMMENT '1=Admin,2 = Staff, 3= Subscriber',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `users` */

insert  into `users`(`id`,`firstname`,`lastname`,`middlename`,`contact`,`address`,`email`,`password`,`type`,`date_created`) values 
(1,'Admin','Admin','','+123456789','Sample address','admin@admin.com','0192023a7bbd73250516f069df18b500',1,'2020-11-10 08:43:06'),
(2,'John','Smith','D','8747808787','Sample Address','jsmith@sample.com','1254737c076cf867dc53d60a0364f38e',3,'2020-11-10 09:16:53'),
(3,'Pelanggan','Gold','D','+6948 8542 623','Sample Address','cblake@sample.com','202cb962ac59075b964b07152d234b70',3,'2020-11-10 15:59:11'),
(4,'Mike','Williams','G','8747808787','Sample','mwilliams@sample.com','3cc93e9a6741d8b40460457139cf8ced',3,'2020-11-10 16:21:02');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
