/*
SQLyog Professional v12.08 (64 bit)
MySQL - 5.7.16-log : Database - dnbookcity
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`dnbookcity` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `dnbookcity`;

/*Table structure for table `book` */

DROP TABLE IF EXISTS `book`;

CREATE TABLE `book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bookid` int(11) DEFAULT NULL,
  `bname` varchar(46) NOT NULL,
  `bookimg` varchar(64) NOT NULL,
  `price` int(11) NOT NULL,
  `author` varchar(16) NOT NULL,
  `details` varchar(240) NOT NULL,
  `stock` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

/*Data for the table `book` */

insert  into `book`(`id`,`bookid`,`bname`,`bookimg`,`price`,`author`,`details`,`stock`) values (1,1,'三体三体','/public/image/bookimage/guinv1.jpg',240,'刘慈欣','来自半人马的外星文明入侵...',2000),(2,2,'与罗摩相会','public/image/bookimage/xianghui.jpg',178,'阿瑟·克拉克','人类遇到流浪在太空中的外星文明飞船...',1024),(3,3,'第二基地','public/image/bookimage/dier.jpg',80,'艾萨克·阿西莫夫','第一基地被攻占后，人们开始把目光转向第二基地...',365),(4,4,'小薇小薇','/public/image/bookimage/lubao4.jpg',240,'维克多·威斯特','人类文明创造了一个低级物种，却在万年后被新物种取代...',240),(5,5,'山','',160,'刘慈欣','一个在地核中诞生的硅基文明，冲破地层的故事，励志感人...',233),(6,6,'2001太空漫游','/public/image/bookimage/taikong.jpg',200,'阿瑟·克拉克','一群草食人猿正在广袤无际的非洲沙漠中觅食...',600),(7,7,'人生','/public/image/bookimage/rens.jpeg',68,'路遥','故事发生在改革开放的前夕，中国陕北山区的一个村庄里...',453),(8,8,'红楼梦','/public/image/bookimage/honglou.jpg',300,'曹雪芹','姑苏城仁清巷内的葫芦庙住着一名叫贾雨村的穷书生，他受乡宦甄士隐的资助，上京赴考，中了进士，做了官...',1473),(9,9,'凡人修仙传','/public/image/bookimage/hanli.jpg',256,'忘语','一个普通山村小子，偶然下进入到当地江湖小门派，成了一名记名弟子。他以这样身份，如何在门派中立足,如何以平庸的资质进入到修仙者的行列，从而笑傲三...',2351),(10,10,'西游记','/public/image/bookimage/xiyou.jpg',400,'吴承恩','灵根育孕源流出 心性修持大道生...',236),(11,11,'平凡的世界','/public/image/bookimage/pingf.jpg',300,'路遥','少平高中毕业，回到家乡做了一名教师。但他并没有消沉，他与县革委副主任田福军女儿田晓霞建立了友情，在晓霞帮助下关注着外面的世界...',458),(12,12,'白鹿原','/public/image/bookimage/bailu.jpg',168,'陈忠实','白鹿原村里两大家族白家和鹿家之间的故事。白家人沿袭村子里的族长...',10),(16,NULL,'中文高级教材','/public/image/bookimage/zuolu1.jpg',492,'中国人民出版社','一套成熟的教材涵盖了从低级到高级的各类图书，全面提高学生的会话、理解能力。而一些不太合格的图书，通常仅仅包含了汉语学习阶段的某一部分内容。',33),(21,NULL,'野狼帮','/public/image/bookimage/lang.jpg',265,'金光上人','飞剑符宝',20),(22,NULL,'暗影岛霸主','/public/image/bookimage/lang.jpg',452,'黑凤梨','水电费东方闪电',78),(24,NULL,'暗影岛','/public/image/bookimage/lang.jpg',100,'giao哥','12312113',12),(35,NULL,'路飞','/public/image/bookimage/lubao4.jpg',88888,'蒙奇','蒙奇-D-路飞好久好久',1),(36,NULL,'honor','/public/image/bookimage/sdn.jpg',121,'赵明','对不起，我们实在是只能拿出这么多的诚意了，爱买不买',10000),(38,NULL,'蛊惑江湖王大少','/public/image/bookimage/sjlr.jpeg',45,'不合格夹克','关于规划局的十三点',45);

/*Table structure for table `details` */

DROP TABLE IF EXISTS `details`;

CREATE TABLE `details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bnum` int(11) NOT NULL COMMENT '书籍数量',
  `price` int(11) NOT NULL COMMENT '书籍单价',
  `totalprice` double NOT NULL COMMENT '总价',
  `uname` varchar(16) NOT NULL,
  `times` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '订单时间',
  `bookname` varchar(18) NOT NULL COMMENT '书名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `details` */

insert  into `details`(`id`,`bnum`,`price`,`totalprice`,`uname`,`times`,`bookname`) values (1,1,168,168,'张礼','2019-10-29 15:32:49','红楼梦');

/*Table structure for table `order` */

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `did` int(11) NOT NULL COMMENT '订单详细表的外键',
  `uid` int(11) NOT NULL COMMENT '用户表的外键',
  `uname` varchar(18) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `u_id` (`uid`),
  KEY `d-id` (`did`),
  CONSTRAINT `d-id` FOREIGN KEY (`did`) REFERENCES `details` (`id`),
  CONSTRAINT `u_id` FOREIGN KEY (`uid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `order` */

insert  into `order`(`id`,`did`,`uid`,`uname`) values (1,1,3,'张礼');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lv` int(11) NOT NULL DEFAULT '1',
  `username` varchar(18) NOT NULL,
  `password` varchar(16) NOT NULL,
  `email` varchar(18) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`lv`,`username`,`password`,`email`) values (1,1,'何恩磊','hel123','1255321@qq.com'),(3,1,'张礼','zli123','zhangli@qq.com'),(4,0,'宋德能','sdn00260','sdneng@qq.com'),(5,1,'y天海','123456','12345@qq.com'),(6,1,'宋立江','789555','454ds@qq.com'),(15,1,'韩立','12500','hanli@qq.com'),(19,1,'莫大夫','445623','modaifu@qq.com'),(20,1,'南宫婉','na123','wan@qq.com'),(21,1,'慕沛灵','ling145','ling@qq.com'),(23,1,'雷万鹤','lei123','lei@qq.com'),(24,1,'墨彩环','huan123','caihuan@qq.com'),(25,1,'墨凤舞','wu123','fengwu@qq.com'),(26,1,'墨玉珠','yuzhu123','yuzhu@qq.com'),(27,1,'历飞羽','yu123','yu@qq.com'),(28,1,'张铁','tie123','tie@qq.com'),(29,1,'大衍神君','dy456','shengjun@qq.com'),(30,1,'董萱儿','xuan123','xuan@qq.com');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
