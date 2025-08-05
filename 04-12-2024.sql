/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 10.4.10-MariaDB : Database - tochrealestatemanagement
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`tochrealestatemanagement` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `tochrealestatemanagement`;

/*Table structure for table `aadharam` */

DROP TABLE IF EXISTS `aadharam`;

CREATE TABLE `aadharam` (
  `aadharam_id` int(11) NOT NULL AUTO_INCREMENT,
  `plot_id` int(11) DEFAULT NULL,
  `file` varchar(255) NOT NULL,
  PRIMARY KEY (`aadharam_id`),
  KEY `Plot_id` (`plot_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `aadharam` */

insert  into `aadharam`(`aadharam_id`,`plot_id`,`file`) values 
(1,1,'static/images/54ab7e06-2ac5-4e5a-9e6d-921171ad54dcPH.jpg'),
(2,2,'static/images/cb5687ac-3a6d-4956-ae3c-2370ed76917ajob.webp'),
(3,2,'static/images/4a9109e5-a71e-4b79-a3e3-0fff6dc22a45about-4.jpg');

/*Table structure for table `chat` */

DROP TABLE IF EXISTS `chat`;

CREATE TABLE `chat` (
  `chat_id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_id` int(11) DEFAULT NULL,
  `receiver_id` int(11) DEFAULT NULL,
  `message` varchar(500) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`chat_id`),
  KEY `Sender_id` (`sender_id`),
  KEY `Receiver_id` (`receiver_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `chat` */

insert  into `chat`(`chat_id`,`sender_id`,`receiver_id`,`message`,`date`) values 
(1,2,3,'goooooooooo','2024-12-03'),
(2,2,3,'hello','2024-12-03');

/*Table structure for table `complaint` */

DROP TABLE IF EXISTS `complaint`;

CREATE TABLE `complaint` (
  `complaint_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `complaint` text NOT NULL,
  `reply` text DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`complaint_id`),
  KEY `User_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `complaint` */

insert  into `complaint`(`complaint_id`,`user_id`,`complaint`,`reply`,`date`) values 
(1,1,'fassssssssssssssssssssssssssssssssssssssssssssssss','we will fix it','2024-12-02 17:17:35'),
(5,1,'adddddddddddddd','pending','2024-12-04 15:07:25'),
(4,2,'scadfhgggggggggggggggggggggggggggggggg\r\ndasgvvvvvvvvvvvvvvvvvvv\r\nsaghhhhhhhhhhhhhhh','ok','2024-12-03 16:14:31');

/*Table structure for table `district` */

DROP TABLE IF EXISTS `district`;

CREATE TABLE `district` (
  `district_id` int(11) NOT NULL AUTO_INCREMENT,
  `district_name` varchar(100) NOT NULL,
  PRIMARY KEY (`district_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Data for the table `district` */

insert  into `district`(`district_id`,`district_name`) values 
(1,'Thiruvananthapuram'),
(2,'Kollam'),
(3,'Pathanamthitta'),
(4,'Alappuzha'),
(5,'Kottayam'),
(6,'Idukki'),
(7,'Ernakulam'),
(8,'Thrissur'),
(9,'Palakkad'),
(10,'Malappuram'),
(11,'Kozhikode'),
(12,'Wayanad'),
(13,'Kannur'),
(14,'Kasaragod');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `usertype` varchar(20) NOT NULL,
  PRIMARY KEY (`login_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`login_id`,`username`,`password`,`usertype`) values 
(1,'admin@1','admin@1','admin'),
(2,'SREEKUMAR','SREEKUMAR','officer'),
(3,'TonyStark@1','TonyStark@1','user'),
(4,'mr.wick','mr.wick','user');

/*Table structure for table `officer` */

DROP TABLE IF EXISTS `officer`;

CREATE TABLE `officer` (
  `officer_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` int(11) DEFAULT NULL,
  `panchayath_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `position` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`officer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `officer` */

insert  into `officer`(`officer_id`,`login_id`,`panchayath_id`,`name`,`phone`,`email`,`position`) values 
(1,2,1,'SREEKUMAR S','03222222222','sree@gmail.com','vice precident');

/*Table structure for table `panchayath` */

DROP TABLE IF EXISTS `panchayath`;

CREATE TABLE `panchayath` (
  `panchayath_id` int(11) NOT NULL AUTO_INCREMENT,
  `district_id` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`panchayath_id`),
  KEY `District_id` (`district_id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

/*Data for the table `panchayath` */

insert  into `panchayath`(`panchayath_id`,`district_id`,`name`,`phone`,`email`) values 
(1,1,'Parassala','9876543254','tvm@gamil.com'),
(2,1,'Perumkadavila','9876543254','tvm@gamil.com'),
(3,1,'Athiyannur','9876543254','tvm@gamil.com'),
(4,1,'Kunnathukal','9876543254','tvm@gamil.com'),
(5,1,'Nemom','9876543254','tvm@gamil.com'),
(6,2,'Adichanalloor','9876543254','klm@gamil.com'),
(7,2,'Alappad','9876543254','klm@gamil.com'),
(8,2,'Alayamon','9876543254','klm@gamil.com'),
(9,2,'Anchal','9876543254','klm@gamil.com'),
(10,2,'Ariencavu','9876543254','klm@gamil.com'),
(11,3,'Anicaud','9876543254','ptt@gamil.com'),
(12,3,'Aranmula','9876543254','ptt@gamil.com'),
(13,3,'Aruvappulam','9876543254','ptt@gamil.com'),
(14,3,'Ayroor','9876543254','ptt@gamil.com'),
(15,3,'Chenneerkara','9876543254','ptt@gamil.com'),
(16,4,'Arookutty','9876543254','al@gamil.com'),
(17,4,'Panavally','9876543254','al@gamil.com');

/*Table structure for table `payment` */

DROP TABLE IF EXISTS `payment`;

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `request_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `Request_id` (`request_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `payment` */

insert  into `payment`(`payment_id`,`request_id`,`amount`,`date`) values 
(1,2,10000.00,'2024-12-04');

/*Table structure for table `plot` */

DROP TABLE IF EXISTS `plot`;

CREATE TABLE `plot` (
  `plot_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `district_id` int(11) DEFAULT NULL,
  `panchayath_id` int(11) DEFAULT NULL,
  `sqft` varchar(500) NOT NULL,
  `details` varchar(500) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`plot_id`),
  KEY `User_id` (`user_id`),
  KEY `District_id` (`district_id`),
  KEY `Panchayath_id` (`panchayath_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `plot` */

insert  into `plot`(`plot_id`,`user_id`,`district_id`,`panchayath_id`,`sqft`,`details`,`status`,`location`) values 
(1,1,2,7,'1000','vdhasaaaaaaaaaaaaa\r\ndsahgbkkkkkkkkkkkkkkkkkk','Accepted','9.978715111837905,76.28632349631762'),
(2,2,3,14,'1000','cfhhhhhhhhhhhhhhhhhhhhhhhhhh\r\ngvvvvvvvvvvvvvvvvvvvvvvvvvvv','Accepted','9.973135934996153,76.28572268149829');

/*Table structure for table `request` */

DROP TABLE IF EXISTS `request`;

CREATE TABLE `request` (
  `request_id` int(11) NOT NULL AUTO_INCREMENT,
  `sell_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `date` date NOT NULL,
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`request_id`),
  KEY `Sell_id` (`sell_id`),
  KEY `User_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `request` */

insert  into `request`(`request_id`,`sell_id`,`user_id`,`amount`,`date`,`status`) values 
(1,1,2,1000.00,'2024-12-04','Accepted'),
(2,2,1,10000.00,'2024-12-04','paid');

/*Table structure for table `request_officers` */

DROP TABLE IF EXISTS `request_officers`;

CREATE TABLE `request_officers` (
  `request_officers_id` int(11) NOT NULL AUTO_INCREMENT,
  `request_id` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`request_officers_id`),
  KEY `Request_id` (`request_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `request_officers` */

insert  into `request_officers`(`request_officers_id`,`request_id`,`date`,`status`) values 
(1,2,'2024-12-04','Accepted'),
(2,2,'2024-12-04','pending');

/*Table structure for table `sell` */

DROP TABLE IF EXISTS `sell`;

CREATE TABLE `sell` (
  `sell_id` int(11) NOT NULL AUTO_INCREMENT,
  `plot_id` int(11) DEFAULT NULL,
  `sqft` varchar(200) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`sell_id`),
  KEY `Plot_id` (`plot_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `sell` */

insert  into `sell`(`sell_id`,`plot_id`,`sqft`,`amount`,`date`) values 
(1,1,'1000',2000.00,'2024-12-02'),
(2,2,'1000',20000.00,'2024-12-03');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` int(11) DEFAULT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `photo` varchar(2000) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `gender` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `Login_id` (`login_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert  into `user`(`user_id`,`login_id`,`fname`,`lname`,`phone`,`email`,`photo`,`address`,`gender`) values 
(1,3,'Tony','Stark','7865434343','stark@gamail.com','static/images/49285f3f-e9a1-42b8-9d34-425a42d23514digital_notice_board_student_lvl-1(dfd).jpg','dvvvvvvvvvvvvvvcagh','Male'),
(2,4,'john','wick','9867453423','john@gmail.com','static/images/6deb5f8e-d7ca-4e7b-b56a-f8e2b975b6f0testimonial-3.jpg','home','Male');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
