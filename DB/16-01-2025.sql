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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `aadharam` */

insert  into `aadharam`(`aadharam_id`,`plot_id`,`file`) values 
(1,1,'static/images/f03943c6-15cc-40f9-8ee6-ed19a7e07eccproperty-slide-3.jpg'),
(2,2,'static/images/82c652a1-623c-4f36-9ced-7886b11e98cfproperty-slide-1.jpg'),
(3,3,'static/images/0a8c92fc-ee13-48e7-b802-7f48106ab44eproperty-slide-3.jpg'),
(4,4,'static/images/54b6dbb0-bde1-4de0-8395-729aaec12dc7property-slide-2.jpg'),
(5,5,'static/images/0bb557d2-8f0e-4b87-b0d9-f54985f26d49property-slide-3.jpg'),
(6,5,'static/images/bb6aebce-d474-4413-8d0c-35afb4c8393dproperty-slide-1.jpg');

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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `chat` */

insert  into `chat`(`chat_id`,`sender_id`,`receiver_id`,`message`,`date`) values 
(1,2,3,'goooooooooo','2024-12-03'),
(2,2,3,'hello','2024-12-03'),
(3,2,3,'hai','2025-01-07'),
(4,3,2,'olaa','2025-01-07'),
(5,2,4,'hai','2025-01-13');

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
(1,1,'fassssssssssssssssssssssssssssssssssssssssssssssss','we will fix jj','2024-12-02 17:17:35'),
(5,1,'adddddddddddddd','oookkkkkkkkkkkkkkkkkk','2024-12-04 15:07:25'),
(4,2,'scadfhgggggggggggggggggggggggggggggggg\r\ndasgvvvvvvvvvvvvvvvvvvv\r\nsaghhhhhhhhhhhhhhh','dfdfd','2024-12-03 16:14:31');

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
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`login_id`,`username`,`password`,`usertype`) values 
(1,'admin@1','admin@1','admin'),
(2,'SREEKUMAR','SREEKUMAR','officer'),
(3,'TonyStark@1','TonyStark@1','user'),
(4,'mr.wick','mr.wick','user'),
(5,'avava123','avava123','user'),
(6,'aa','aa','officer'),
(7,'aa','aa','officer'),
(8,'admin','Admin@3265','user'),
(9,'Snow@3265','Snow@3265','user'),
(10,'Amy@1234','Amy@1234','user'),
(11,'jake@123','Jake@123','user');

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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `officer` */

insert  into `officer`(`officer_id`,`login_id`,`panchayath_id`,`name`,`phone`,`email`,`position`) values 
(1,2,1,'SREEKUMAR S','03222222222','sree@gmail.com','vice precident'),
(2,6,8,'aaaa','1111111111','aaa@ss2.sss','aaa');

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
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

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
(17,4,'Panavally','9876543254','al@gamil.com'),
(18,5,'abc','3444444444','abc@gmail.com'),
(19,14,'xyz','1222222222','123@gmail.com'),
(20,13,'pqr','3443434343','ptt@gamil.com'),
(21,12,'lmno','5757575757','lmno@gmail.com'),
(22,11,'rst','7676768584','rst@gmail.com'),
(23,10,'qwert','2345678999','sdfghjg@njj.com'),
(24,8,'zxcvb','3456777777','ffdfd@gmail.com'),
(25,9,'zxcvbnm','3456789999','fghj@dfg.sdfghj'),
(26,7,'hgghhh','6555555555','fdd@ffvgvg.vvv'),
(27,6,'axxxx','2332232332','fdd@ffvgvg.vvv'),
(28,1,'hh','7777777777','gg');

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
(1,1,100000.00,'2025-01-16');

/*Table structure for table `plot` */

DROP TABLE IF EXISTS `plot`;

CREATE TABLE `plot` (
  `plot_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `district_id` int(11) DEFAULT NULL,
  `panchayath_id` int(11) DEFAULT NULL,
  `cent` varchar(500) NOT NULL,
  `details` varchar(500) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`plot_id`),
  KEY `User_id` (`user_id`),
  KEY `District_id` (`district_id`),
  KEY `Panchayath_id` (`panchayath_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `plot` */

insert  into `plot`(`plot_id`,`user_id`,`district_id`,`panchayath_id`,`cent`,`details`,`status`,`location`) values 
(1,3,4,16,'100','      Lorem ipsum dolor sit, amet consectetur adipisicing elit. Deserunt ea repudiandae adipisci nesciunt sunt tempore ducimus perferendis culpa hic inventore, esse numquam dolorum voluptatem eos vitae aut rerum explicabo unde.\r\n','Accepted','9.48089481942753,76.32995982043458'),
(2,2,2,7,'50','asafdffffffffffffffffffffffffffff','Accepted','9.980625538370601,76.27516550681567'),
(3,1,3,15,'300','jhvhvjjvhhvjvhjhvjjvhvhjvjhjvj\r\nggvghghcggchcggchgchgc','Accepted','9.981639915360681,76.29679484031176'),
(5,5,14,19,'100','xoooooooooooxoxoxoxoxoxoooo\r\nxooxoxoxoxoxoxo','Accepted','9.977075181765763,76.2933616127727');

/*Table structure for table `request` */

DROP TABLE IF EXISTS `request`;

CREATE TABLE `request` (
  `request_id` int(11) NOT NULL AUTO_INCREMENT,
  `sell_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `cent` varchar(500) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `date` date NOT NULL,
  `status` varchar(100) DEFAULT NULL,
  `updated_once` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`request_id`),
  KEY `Sell_id` (`sell_id`),
  KEY `User_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `request` */

insert  into `request`(`request_id`,`sell_id`,`user_id`,`cent`,`amount`,`date`,`status`,`updated_once`) values 
(1,1,1,'50',100000.00,'2025-01-16','paid',0);

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
(1,1,'2025-01-16','Accepted');

/*Table structure for table `sell` */

DROP TABLE IF EXISTS `sell`;

CREATE TABLE `sell` (
  `sell_id` int(11) NOT NULL AUTO_INCREMENT,
  `plot_id` int(11) DEFAULT NULL,
  `cent` varchar(200) NOT NULL,
  `acre` float DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`sell_id`),
  KEY `Plot_id` (`plot_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `sell` */

insert  into `sell`(`sell_id`,`plot_id`,`cent`,`acre`,`amount`,`date`) values 
(1,1,'100',1,400000.00,'2024-12-31'),
(2,2,'50',0.5,200000.00,'2024-12-31'),
(3,3,'300',3,1200000.00,'2025-01-01'),
(4,4,'300',3,400000.00,'2025-01-02'),
(5,5,'100',1,400000.00,'2025-01-13'),
(6,1,'100',1,1000.00,'2025-01-16');

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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert  into `user`(`user_id`,`login_id`,`fname`,`lname`,`phone`,`email`,`photo`,`address`,`gender`) values 
(1,3,'Tony','Stark','7865434343','stark@gamail.com','static/images/49285f3f-e9a1-42b8-9d34-425a42d23514digital_notice_board_student_lvl-1(dfd).jpg','dvvvvvvvvvvvvvvcagh','Male'),
(2,4,'john','wick','9867453423','john@gmail.com','static/images/6deb5f8e-d7ca-4e7b-b56a-f8e2b975b6f0testimonial-3.jpg','home','Male'),
(3,5,'aa','aaaaaaaaaaa','6666666662','aa@hshs.vdvd','static/images/8e93c4ca-3347-4cc7-9f1f-428d970481f0property-slide-2.jpg','s2ddddddddddd2ee fffff','Male'),
(4,8,'john','wick','9867453423','john@gmail.com','static/images/d347b63a-2ec2-4478-a4a9-20ae43470d71property-slide-2.jpg','hozzzjajjbaxjbxame','Male'),
(5,9,'john','snow','9898988989','john123@gmail.com','static/images/ffbf24f1-be3e-4313-90a4-fde783bf3264property-slide-2.jpg','home','Male'),
(6,10,'Amy','sandiyago','9999999999','amy@gmail.com','static/images/7ed29817-8143-45c2-85b8-f2de55a68f16property-slide-1.jpg','ahhahah\r\nahhahha\r\nahahahaha','Female'),
(7,11,'Jake','parelta','8777777777','jake@gmail.com','static/images/c91504d3-2ecf-417d-9d9b-eb536730d1a8property-slide-3.jpg','EKM north railwaystation','Male');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
