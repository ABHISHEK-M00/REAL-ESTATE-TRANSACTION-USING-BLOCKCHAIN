/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 5.7.9 : Database - tochrealestatemanagement
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
  `district_id` int(11) DEFAULT NULL,
  `panchayath_id` int(11) DEFAULT NULL,
  `cent` varchar(500) NOT NULL,
  `details` varchar(500) DEFAULT NULL,
  `location` varchar(200) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`aadharam_id`),
  KEY `District_id` (`district_id`),
  KEY `Panchayath_id` (`panchayath_id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

/*Data for the table `aadharam` */

insert  into `aadharam`(`aadharam_id`,`district_id`,`panchayath_id`,`cent`,`details`,`location`,`file`,`status`) values 
(8,1,1,'13','mmmmmmm','9.976229854472544,76.29058070160927','QmZkQ1YsVNPUWYvKoYXR3ygoDkzPeQ8fBSRcMn6wD6g6E8','pending'),
(7,2,6,'13','sgd','9.972147449768759,76.29841804504395','QmWgZsgmGPDy9gkSgyiwfbYJ6MJPiFCLqYzjF5sGcKrKfL','pending'),
(6,1,1,'12','sgd','9.973524790329105,76.29272646882119','QmPbmrStcc1yUVRZ6nqvU2WkLRoAduQQtuEL69ExMbn7kE','pending'),
(5,1,1,'12','gfhhggfhg','9.977396406709943,76.29264063813271','QmPbmrStcc1yUVRZ6nqvU2WkLRoAduQQtuEL69ExMbn7kE','pending'),
(9,1,1,'122','plot','QmdGGeAdnmBEYX1dCjrwsE6YruK39LpXFjTbjSPNzTMqKT','9.971640245597534,76.30099296569824','pending'),
(10,4,16,'25','single owner ','QmWvEHfX43ciyzcSuWK4s1SnoE5tSmZS8NqVbyr8em4gyb','9.471268955602676,76.34357486532627','pending'),
(11,2,6,'24','dffhf','QmajuQUmECrFygnnNwJt3wXreqsDWrCLyVULe7TSx8ct4i','9.979340572042315,76.29315340891726','pending'),
(12,3,11,'27','dffhf','QmajuQUmECrFygnnNwJt3wXreqsDWrCLyVULe7TSx8ct4i','9.976958421103884,76.29075014963992','pending'),
(13,2,6,'274','dffhf','QmVRWwLt7Cg5EwahsmhgU4CzxkcNd4Cnbon7ACJmhBFitT','9.981692218705614,76.29787409678347','pending'),
(14,3,13,'27','dffhf','QmajuQUmECrFygnnNwJt3wXreqsDWrCLyVULe7TSx8ct4i','9.979646827905754,76.28465617075808','pending'),
(15,3,12,'27','jkjk','QmeQjiSN5YSVV9K2zUx3szwjo2Ak5jFykwu8mXD7NsWEaS','9.977210633832502,76.28637278452761','pending'),
(16,1,2,'20','lfnvlsf','QmVmSrNo2BJV7eqGEg7fEck12Vp1P7pci2YGZ1hjK6d7xE','9.977096999210204,76.29512751475222','pending'),
(17,1,1,'550','plot','QmVSRA4ebL6worQxciUCTC5c1dQFdRJHp2viUbT1MSerbk','9.975802676420656,76.2872071715562','pending'),
(18,2,7,'1000','plot22','QmVSRA4ebL6worQxciUCTC5c1dQFdRJHp2viUbT1MSerbk','9.975634995670687,76.28591971122906','pending'),
(19,3,12,'1000','basil','QmczfurPQ47qbdLj45LamgtvqdjQxwJ2cr7Eg5ezxdA7yZ','9.973380310787427,76.28617720329449','pending'),
(20,11,22,'27','osuhxhis','QmczfurPQ47qbdLj45LamgtvqdjQxwJ2cr7Eg5ezxdA7yZ','9.973563236503649,76.29529917612918','pending'),
(21,1,5,'1000','plot 123','QmPDB3orT6TKUzoUZyWafYrEoyTa7HGmK3bsS7hrruMfKd','9.972130318224549,76.28694967949077','pending'),
(22,1,2,'1000','plot 1212345','Qmdv4qRsXNPgwgUc8XRAH7wvgxFQx2FHAhyVrqZtMR8EZX','9.956905487262878,76.28871198829981','pending'),
(23,2,7,'234','kkk','Qmdv4qRsXNPgwgUc8XRAH7wvgxFQx2FHAhyVrqZtMR8EZX','https://maps.app.goo.gl/EAQPmJw5vD1CctHJ8','pending'),
(24,1,2,'235','kkk','QmVDJmX9KmgQXG1ZS2txvkoFahmxf1WdW3xQTSkELphmSJ','https://maps.app.goo.gl/EAQPmJw5vD1CctHJ8','pending'),
(25,8,24,'5000','meenpara','QmVDJmX9KmgQXG1ZS2txvkoFahmxf1WdW3xQTSkELphmSJ','https://maps.app.goo.gl/Z2eDuXMGRhTfsZwi6','pending'),
(26,8,24,'5000','sldjcnSOCOS','QmVDJmX9KmgQXG1ZS2txvkoFahmxf1WdW3xQTSkELphmSJ','https://maps.app.goo.gl/Z2eDuXMGRhTfsZwi6','pending'),
(27,2,7,'10000','u7ts6wys','QmVDJmX9KmgQXG1ZS2txvkoFahmxf1WdW3xQTSkELphmSJ','https://maps.app.goo.gl/Z2eDuXMGRhTfsZwi6','pending');

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
  `reply` text,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`complaint_id`),
  KEY `User_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `complaint` */

insert  into `complaint`(`complaint_id`,`user_id`,`complaint`,`reply`,`date`) values 
(1,1,'fassssssssssssssssssssssssssssssssssssssssssssssss','we will fix jj','2024-12-02 17:17:35'),
(5,1,'adddddddddddddd','oookkkkkkkkkkkkkkkkkk','2024-12-04 15:07:25'),
(4,2,'scadfhgggggggggggggggggggggggggggggggg\r\ndasgvvvvvvvvvvvvvvvvvvv\r\nsaghhhhhhhhhhhhhhh','dfdfd','2024-12-03 16:14:31'),
(6,6,'plateform is not working ','pending','2025-02-28 13:28:32'),
(7,1,'hiii','pending','2025-03-12 15:55:43');

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
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`login_id`,`username`,`password`,`usertype`) values 
(1,'admin@1','admin@1','admin'),
(2,'SREEKUMAR','SREEKUMAR','officer'),
(3,'TonyStark@1','TonyStark@1','user'),
(4,'mr.wick','mr.wick','user'),
(5,'avava123','avava123','user'),
(12,'Revathy@3','Revathy@3','user'),
(7,'aa','aa','officer'),
(8,'admin','Admin@3265','user'),
(9,'Snow@3265','Snow@3265','user'),
(10,'Amy@1234','Amy@1234','user'),
(11,'jake@123','Jake@123','user'),
(13,'Ramboss@1','Ramboss@1','user'),
(14,'Fayaz@9633','Fayaz@9633','user'),
(15,'Fyz@1234','Fyz@1234','user'),
(16,'bhy','Bhy@12345','user'),
(17,'bhyss','Bhyss@12345','user'),
(18,'nop','Nop@1234','user'),
(19,'bpp','Bpp@12345','user'),
(20,'Manjub@16','Manjub@16','user');

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
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

/*Data for the table `payment` */

insert  into `payment`(`payment_id`,`request_id`,`amount`,`date`) values 
(4,5,1500000.00,'2025-02-28'),
(3,2,25000.00,'2025-02-22'),
(5,7,2000.00,'2025-03-05'),
(6,8,1000.00,'2025-03-05'),
(7,9,500.00,'2025-03-06'),
(8,10,500.00,'2025-03-06'),
(9,11,9000.00,'2025-03-06'),
(10,12,5000.00,'2025-03-06'),
(11,13,300000.00,'2025-03-19'),
(12,15,10000.00,'2025-03-20'),
(13,16,1000.00,'2025-03-20'),
(14,16,1000.00,'2025-03-20'),
(15,16,1000.00,'2025-03-20'),
(16,16,1000.00,'2025-03-20'),
(17,16,1000.00,'2025-03-20'),
(18,16,1000.00,'2025-03-20'),
(19,17,10000.00,'2025-03-20');

/*Table structure for table `plot` */

DROP TABLE IF EXISTS `plot`;

CREATE TABLE `plot` (
  `plot_id` int(11) NOT NULL AUTO_INCREMENT,
  `aadharam_id` varchar(11) DEFAULT NULL,
  `user_id` varchar(11) DEFAULT NULL,
  `acent` varchar(100) DEFAULT NULL,
  `statuss` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`plot_id`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;

/*Data for the table `plot` */

insert  into `plot`(`plot_id`,`aadharam_id`,`user_id`,`acent`,`statuss`) values 
(8,'7','3','13','pending'),
(9,'8','3','13','pending'),
(10,'8','7','3','pending'),
(11,'9','2','122','pending'),
(12,'10','3','25','pending'),
(13,'10','6','25','pending'),
(14,'13','7','274','pending'),
(15,'14','7','27','pending'),
(16,'15','7','27','pending'),
(17,'16','6','20','pending'),
(18,'16','7','20','Rejected'),
(19,'17','6','550','pending'),
(20,'17','7','550','Accepted'),
(21,'18','5','1000','pending'),
(22,'18','6','1000','pending'),
(23,'19','5','1000','pending'),
(24,'19','7','1000','pending'),
(25,'20','9','27','pending'),
(26,'21','5','1000','Accepted'),
(27,'21','6','1000','pending'),
(28,'22','10','1000','Accepted'),
(29,'22','7','1000','pending'),
(30,'22','11','1000','pending'),
(31,'24','11','235','pending'),
(32,'25','11','-2000','pending'),
(33,'26','11','5000','pending'),
(34,'25','9','5000','pending'),
(35,'25','11','-2000','pending'),
(36,'25','11','-2000','pending'),
(37,'25','11','-2000','pending'),
(38,'27','11','10000','pending'),
(39,'27','8','5000','pending');

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
  `updated_once` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`request_id`),
  KEY `Sell_id` (`sell_id`),
  KEY `User_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

/*Data for the table `request` */

insert  into `request`(`request_id`,`sell_id`,`user_id`,`cent`,`amount`,`date`,`status`,`updated_once`) values 
(1,1,1,'50',100000.00,'2025-01-16','paid',0),
(2,7,7,'3',25000.00,'2025-02-22','Accepted',0),
(3,7,2,'6768',10000.00,'2025-02-28','Accepted',0),
(4,7,3,'3',50000.00,'2025-02-28','Accepted',0),
(5,9,6,'10',1500000.00,'2025-02-28','paid',0),
(6,10,7,'444',30000.00,'2025-03-05','pending',0),
(7,12,7,'2',2000.00,'2025-03-05','paid',0),
(8,13,7,'10',1000.00,'2025-03-05','paid',0),
(9,14,6,'5',500.00,'2025-03-06','paid',0),
(10,15,7,'5',500.00,'2025-03-06','paid',0),
(11,16,6,'1000',9000.00,'2025-03-06','paid',0),
(12,17,7,'100',5000.00,'2025-03-06','Accepted',0),
(13,17,11,'500',300000.00,'2025-03-19','paid',0),
(14,20,11,'3',2000.00,'2025-03-20','pending',0),
(15,21,9,'2000',10000.00,'2025-03-20','paid',0),
(16,22,11,'100',1000.00,'2025-03-20','paid',0),
(17,23,8,'100',10000.00,'2025-03-20','paid',0);

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
  `aadharam_id` int(11) DEFAULT NULL,
  `cent` varchar(200) NOT NULL,
  `acre` float DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`sell_id`),
  KEY `Plot_id` (`aadharam_id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

/*Data for the table `sell` */

insert  into `sell`(`sell_id`,`aadharam_id`,`cent`,`acre`,`amount`,`date`) values 
(1,1,'100',1,400000.00,'2024-12-31'),
(2,2,'50',0.5,200000.00,'2024-12-31'),
(3,3,'300',3,1200000.00,'2025-01-01'),
(4,4,'300',3,400000.00,'2025-01-02'),
(5,5,'100',1,400000.00,'2025-01-13'),
(6,1,'100',1,1000.00,'2025-01-16'),
(7,8,'13',0.13,200000.00,'2025-02-22'),
(8,9,'122',1.22,2000000.00,'2025-02-28'),
(9,10,'25',0.25,4500000.00,'2025-02-28'),
(10,10,'25',0.25,45000.00,'2025-03-05'),
(11,15,'27',0.27,5666.00,'2025-03-05'),
(12,16,'20',0.2,20000.00,'2025-03-05'),
(13,17,'550',5.5,5000.00,'2025-03-05'),
(14,18,'1000',10,10000.00,'2025-03-06'),
(15,19,'1000',10,10000.00,'2025-03-06'),
(16,21,'1000',10,10000.00,'2025-03-06'),
(17,22,'1000',10,10000.00,'2025-03-06'),
(18,18,'1000',10,10000.00,'2025-03-12'),
(19,21,'100',1,3000.00,'2025-03-20'),
(20,22,'500',5,300.00,'2025-03-20'),
(21,25,'5000',50,2000000.00,'2025-03-20'),
(22,25,'3000',30,1000.00,'2025-03-20'),
(23,27,'5000',50,10000.00,'2025-03-20'),
(24,27,'10000',100,10000.00,'2025-03-20');

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
  `tid` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `Login_id` (`login_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert  into `user`(`user_id`,`login_id`,`fname`,`lname`,`phone`,`email`,`photo`,`address`,`gender`,`tid`) values 
(1,3,'Tony','Stark','7865434343','stark@gamail.com','static/images/49285f3f-e9a1-42b8-9d34-425a42d23514digital_notice_board_student_lvl-1(dfd).jpg','dvvvvvvvvvvvvvvcagh','Male',NULL),
(2,4,'john','wick','9867453423','john@gmail.com','static/images/6deb5f8e-d7ca-4e7b-b56a-f8e2b975b6f0testimonial-3.jpg','home','Male',NULL),
(3,5,'aa','aaaaaaaaaaa','6666666662','aa@hshs.vdvd','static/images/8e93c4ca-3347-4cc7-9f1f-428d970481f0property-slide-2.jpg','s2ddddddddddd2ee fffff','Male',NULL),
(4,8,'john','wick','9867453423','john@gmail.com','static/images/d347b63a-2ec2-4478-a4a9-20ae43470d71property-slide-2.jpg','hozzzjajjbaxjbxame','Male',NULL),
(5,9,'john','snow','9898988989','john123@gmail.com','static/images/ffbf24f1-be3e-4313-90a4-fde783bf3264property-slide-2.jpg','home','Male',NULL),
(6,10,'Amy','sandiyago','9999999999','amy@gmail.com','static/images/7ed29817-8143-45c2-85b8-f2de55a68f16property-slide-1.jpg','ahhahah\r\nahhahha\r\nahahahaha','Female',NULL),
(7,11,'Jake','parelta','8777777777','jake@gmail.com','static/images/c91504d3-2ecf-417d-9d9b-eb536730d1a8property-slide-3.jpg','EKM north railwaystation','Male',NULL),
(8,12,'revathy','p','6284412389','revathy03@gmail.com','static/images/d0caf554-7c50-4ac7-9d90-5abe1c129b43Mall Shops Management.docx','kailasam','Female',NULL),
(9,13,'revathy','basil','9873736737','revthy@gmail.com','static/images/b4aed253-3d9b-4c81-afb4-c989d6d4175320250222_212730.mp4','nihbuhybdx','Female',NULL),
(10,14,'fayaz','mohd','9633977373','fayaz@gmail.com','static/images/167c8525-5438-4f10-95b7-35f4d364f4e3Screenshot 2023-06-13 223820.png','Kailasam, Unnigramam, Near Ayyappa Temple, Palachuvadu','Male',NULL),
(11,15,'mohammed','fayaz','9633977373','mohammedfayaz9633@gmail.com','static/images/90844aa6-c664-423d-941b-6769e2c5ead002tvm.mp4','horizon sundew','Male',NULL),
(12,16,'khk','cdckjh','9878998777','sdjcb@sdc.csdc','static/images/d5a94caf-0558-4f2e-9f46-13ae7dd4f1fcbank_detail.png','lasjhlk','Male',NULL),
(13,17,'khk','cdckjh','9878998777','sdjcsb@sdc.csdc','static/images/43819f0e-3030-4b12-8bc5-30a5b3d1b82fbank_detail.png','lasjhlk','Male',NULL),
(14,18,'noooop','gbgh','6767776767','nop@gmail.com','static/images/b6d3b9f7-8769-4981-964f-27b6fe875949JAVA IMPORTANR02.jpeg','uyhuhn','Male',NULL),
(15,19,'bpp','jknjk','8790909090','bpp@gmail.com','static/images/62074aa7-866c-4874-82a1-4f6133ce3c3fScreenshot 2024-11-06 104945.png','kjjnkjn','Male','31'),
(16,20,'Manju','B','9745643002','manjub200@gmail.com','static/images/80647856-b7fd-4f2b-afe8-fbeae71bd8cf20250223_121706.jpg','kailasam unnigramam','Female','43');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
