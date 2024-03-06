/*
SQLyog Community v13.2.0 (64 bit)
MySQL - 8.0.36 : Database - laz
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`laz` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `laz`;

/*Table structure for table `head` */

DROP TABLE IF EXISTS `head`;

CREATE TABLE `head` (
  `ID` varchar(20) NOT NULL,
  `NAMA` varchar(50) DEFAULT NULL,
  `ALAMAT` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `head` */

/*Table structure for table `m_count` */

DROP TABLE IF EXISTS `m_count`;

CREATE TABLE `m_count` (
  `MC_NO` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`MC_NO`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `m_count` */

insert  into `m_count`(`MC_NO`) values 
(4);

/*Table structure for table `m_emply` */

DROP TABLE IF EXISTS `m_emply`;

CREATE TABLE `m_emply` (
  `ME_NIK` varchar(15) NOT NULL DEFAULT '',
  `ME_KASIR` varchar(3) NOT NULL DEFAULT '0',
  `ME_MT_KODE` varchar(4) NOT NULL DEFAULT '',
  `ME_NAMA` varchar(30) NOT NULL DEFAULT '',
  `ME_PASSWORD` varchar(30) NOT NULL DEFAULT '',
  `ME_MJ_KODE` char(4) NOT NULL DEFAULT '',
  `ME_TY` varchar(1) NOT NULL DEFAULT '',
  `ME_ST_KAS` char(1) NOT NULL DEFAULT 'N',
  `ME_ST_AKTIF` char(1) NOT NULL DEFAULT 'N',
  `ME_ST_PRN` char(1) NOT NULL DEFAULT 'N',
  `ME_ST_ACC` char(1) NOT NULL DEFAULT 'N',
  `ME_LV_ACC` int NOT NULL DEFAULT '0',
  `ME_DI` datetime NOT NULL DEFAULT '2007-01-01 00:00:00',
  `ME_NI` char(15) NOT NULL DEFAULT '',
  `ME_DU` datetime NOT NULL DEFAULT '2007-01-01 00:00:00',
  `ME_NU` char(15) NOT NULL DEFAULT '',
  `ME_UU_LAIN` char(4) NOT NULL DEFAULT '',
  `ME_TGL_LAHIR` date NOT NULL DEFAULT '2007-01-01',
  PRIMARY KEY (`ME_MT_KODE`,`ME_NIK`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `m_emply` */

insert  into `m_emply`(`ME_NIK`,`ME_KASIR`,`ME_MT_KODE`,`ME_NAMA`,`ME_PASSWORD`,`ME_MJ_KODE`,`ME_TY`,`ME_ST_KAS`,`ME_ST_AKTIF`,`ME_ST_PRN`,`ME_ST_ACC`,`ME_LV_ACC`,`ME_DI`,`ME_NI`,`ME_DU`,`ME_NU`,`ME_UU_LAIN`,`ME_TGL_LAHIR`) values 
('11111111','111','2000','Poerwantono','99;6','010','S','Y','N','Y','N',0,'2010-09-24 09:36:18','0110012','2019-09-25 23:08:49','123456','Y','2007-01-01'),
('1234','234','2000','STOCK_KONTROL','99;6','013','T','N','N','N','N',0,'2018-12-06 16:03:47','11111111','2018-12-06 16:03:47','11111111','Y','2018-12-06'),
('12345','345','2000','STORE MANAGER','99;6','005','M','N','N','N','N',0,'2018-12-06 15:28:01','11111111','2018-12-06 15:28:01','11111111','Y','2018-12-06'),
('1234567890','890','2000','ADMIN GUDANG','99;6','015','','N','N','N','N',0,'2018-12-06 12:01:01','11111111','2019-10-09 21:01:27','123456','Y','2018-12-06'),
('12345678901','901','2000','CHECKER GUDANG','99;6','019','','N','N','N','N',0,'2018-12-06 10:53:03','11111111','2018-12-06 10:53:03','11111111','Y','2018-12-06'),
('123456','456','2000','IMAN','99;6','004','S','N','N','N','Y',0,'2018-10-05 22:16:53','11111111','2018-12-05 23:20:54','11111111','Y','2018-10-05'),
('123456789','789','2000','OPERATIONAL','99;6','007','M','N','N','N','N',0,'2018-12-06 10:39:42','11111111','2019-09-25 23:13:41','123456','Y','2018-12-06'),
('12345678','678','2000','MD','99;6','003','M','N','N','N','N',0,'2018-12-06 10:18:09','11111111','2019-10-09 21:03:00','123456','Y','2018-12-06'),
('9600530','530','2000','SRI','99;6','003','T','N','N','N','Y',0,'2018-12-05 14:14:37','11111111','2018-12-06 08:41:58','11111111','Y','2018-12-05'),
('96011412','412','2000','REYNA','zen49p<','007','T','N','N','N','N',0,'2018-12-05 14:24:03','11111111','2018-12-05 14:24:03','11111111','','2018-12-05'),
('96016512','512','2000','CICA','kcr5i5:','007','T','N','N','N','N',0,'2018-12-05 14:25:05','11111111','2018-12-05 14:25:05','11111111','','2018-12-05'),
('960041001','001','2000','MEYSA','uen49u<','007','T','N','N','N','N',0,'2018-12-05 14:27:53','11111111','2018-12-05 14:27:53','11111111','','2018-12-05'),
('960005','005','2000','WAHYUNI','qjpn:{2y5','007','T','N','N','N','N',0,'2018-12-05 14:28:53','11111111','2018-12-05 14:28:53','11111111','','2018-12-05'),
('96011200','200','2000','FAHRY','n}j4n9t<','007','T','N','N','N','N',0,'2018-12-05 14:29:50','11111111','2018-12-05 14:29:50','11111111','','2018-12-05'),
('960066','066','2000','TAUFIQ','|mjt{8h;3','007','T','N','N','N','N',0,'2018-12-05 14:30:33','11111111','2018-12-05 14:30:33','11111111','','2018-12-05'),
('1234567','567','2000','ADMIN PRICING','99;6','004','M','N','N','N','N',0,'2018-12-06 08:43:37','11111111','2018-12-06 08:43:37','11111111','Y','2018-12-06'),
('9999','999','2000','visual','99;69','007','T','N','N','N','N',0,'2018-12-18 15:34:29','11111111','2018-12-18 15:34:29','11111111','','2018-12-18'),
('920090','090','2000','KINTAN (CK)','99;6','015','M','N','N','N','N',0,'2019-01-22 12:44:11','11111111','2019-10-09 21:05:50','123456','Y','2019-01-22'),
('920098','098','2000','ASRI','99;69','015','T','N','N','N','N',0,'2019-01-22 12:46:54','11111111','2019-01-22 12:46:54','11111111','','2019-01-22'),
('920005','0','2000','MULYANI (CK)','99;69','016','M','N','N','N','N',0,'2019-01-22 12:50:42','11111111','2019-03-28 14:59:42','11111111','Y','2019-01-22'),
('920012','012','2000','SRIE','99;69','015','M','N','N','N','N',0,'2019-01-22 12:56:27','11111111','2019-01-25 15:23:36','11111111','Y','2019-01-22'),
('920082','082','2000','SRI (CK)','mmvzp','018','T','N','N','N','N',0,'2019-01-22 12:57:16','11111111','2019-03-28 15:41:44','11111111','Y','2019-01-22'),
('920067','067','2000','OKKY','99;69','018','T','N','N','N','N',0,'2019-01-22 12:58:35','11111111','2019-01-22 12:59:46','11111111','','2019-01-22'),
('920021','021','2000','MELI (CK)','99;69','015','T','N','N','N','N',0,'2019-01-22 13:02:03','11111111','2019-05-02 15:01:47','11111111','Y','2019-01-22'),
('920011','011','2000','ANEU','99;69','015','T','N','N','N','N',0,'2019-01-22 13:05:02','11111111','2019-01-22 13:05:02','11111111','','2019-01-22'),
('920057','057','2000','NIA','99;69','015','T','N','N','N','N',0,'2019-01-22 13:06:35','11111111','2019-01-22 13:06:35','11111111','','2019-01-22'),
('920007','007','2000','WATI','99;6','009','K','Y','N','Y','N',0,'2019-01-22 13:11:11','11111111','2019-11-18 20:14:04','11111111','Y','2019-01-22'),
('920062','062','2000','RONI','99;69','015','T','N','N','N','N',0,'2019-01-22 13:11:44','11111111','2019-01-22 13:11:44','11111111','','2019-01-22'),
('920026','026','2000','NANDA','99;69','015','T','N','N','N','N',0,'2019-01-22 13:12:39','11111111','2019-01-22 13:12:39','11111111','','2019-01-22'),
('920044','044','2000','ANITA','99;69','015','T','N','N','N','N',0,'2019-01-22 13:13:00','11111111','2019-01-22 13:13:00','11111111','','2019-01-22'),
('920022','022','2000','SUMIATI (CK)','oirn}y','015','T','N','N','N','N',0,'2019-03-28 15:01:21','11111111','2019-03-28 15:19:23','11111111','Y','2019-03-28'),
('920104','104','2000','YESIKA (CK)','~5Alum','015','T','N','N','N','N',0,'2019-03-28 15:02:40','11111111','2019-03-28 15:03:02','11111111','Y','2019-03-28'),
('ESTIMASI','ASI','2000','ESTIMASI','99;69','011','T','N','N','N','N',0,'2019-04-12 10:30:21','11111111','2019-04-12 10:30:21','11111111','Y','2019-04-12');

/*Table structure for table `m_emply_store` */

DROP TABLE IF EXISTS `m_emply_store`;

CREATE TABLE `m_emply_store` (
  `MES_NIK` char(15) NOT NULL DEFAULT '',
  `MES_MT_KODE` varchar(4) NOT NULL DEFAULT '',
  `MES_STR_AKTIF` char(1) NOT NULL DEFAULT 'N',
  `MES_LST_LOGIN` datetime NOT NULL DEFAULT '2007-01-01 00:00:00',
  `MES_DI` datetime NOT NULL DEFAULT '2007-01-01 00:00:00',
  `MES_NI` char(15) NOT NULL DEFAULT '',
  `MES_DU` datetime NOT NULL DEFAULT '2007-01-01 00:00:00',
  `MES_NU` char(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`MES_MT_KODE`,`MES_NIK`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `m_emply_store` */

insert  into `m_emply_store`(`MES_NIK`,`MES_MT_KODE`,`MES_STR_AKTIF`,`MES_LST_LOGIN`,`MES_DI`,`MES_NI`,`MES_DU`,`MES_NU`) values 
('11111111','3001','Y','2007-01-01 00:00:00','2007-01-01 00:00:00','','2007-01-01 00:00:00',''),
('123456','3001','Y','2007-01-01 00:00:00','2018-12-05 12:40:29','11111111','2018-12-05 12:40:29','11111111'),
('1234567','2000','Y','2007-01-01 00:00:00','2018-10-09 23:44:10','11111111','2018-10-09 23:44:10','11111111'),
('12345','2000','Y','2007-01-01 00:00:00','2018-10-22 11:11:09','11111111','2018-10-22 11:11:09','11111111'),
('9600530','2000','Y','2007-01-01 00:00:00','2018-12-05 21:45:22','11111111','2018-12-05 21:45:22','11111111'),
('12345678','2000','Y','2007-01-01 00:00:00','2018-12-06 10:18:03','11111111','2018-12-06 10:18:03','11111111'),
('123456789','2000','Y','2007-01-01 00:00:00','2018-12-06 10:39:19','11111111','2018-12-06 10:39:19','11111111'),
('12345678901','2000','Y','2007-01-01 00:00:00','2018-12-06 10:52:53','11111111','2018-12-06 10:52:53','11111111'),
('1234567890','2000','Y','2007-01-01 00:00:00','2018-12-06 12:00:52','11111111','2018-12-06 12:00:52','11111111'),
('1234','2000','Y','2007-01-01 00:00:00','2018-12-06 16:03:23','11111111','2018-12-06 16:03:23','11111111'),
('11111111','4002','Y','2007-01-01 00:00:00','2019-01-21 06:06:30','11111111','2019-01-21 06:06:30','11111111'),
('11111111','2000','Y','2007-01-01 00:00:00','2019-01-21 11:36:51','11111111','2019-01-21 11:36:51','11111111'),
('920005','2000','Y','2007-01-01 00:00:00','2019-01-25 14:37:00','11111111','2019-01-25 14:37:00','11111111'),
('920012','2000','Y','2007-01-01 00:00:00','2019-01-25 15:23:24','11111111','2019-01-25 15:23:24','11111111'),
('920090','2000','Y','2007-01-01 00:00:00','2019-02-04 17:17:18','11111111','2019-02-04 17:17:18','11111111'),
('920021','2000','Y','2007-01-01 00:00:00','2019-03-28 15:00:02','11111111','2019-03-28 15:00:02','11111111'),
('920022','2000','Y','2007-01-01 00:00:00','2019-03-28 15:01:12','11111111','2019-03-28 15:01:12','11111111'),
('920104','2000','','2007-01-01 00:00:00','2019-03-28 15:02:35','11111111','2019-03-28 15:02:35','11111111'),
('920082','2000','Y','2007-01-01 00:00:00','2019-03-28 15:29:23','11111111','2019-03-28 15:29:23','11111111'),
('ESTIMASI','2000','Y','2007-01-01 00:00:00','2019-04-12 10:30:08','11111111','2019-04-12 10:30:08','11111111'),
('920007','2000','Y','2007-01-01 00:00:00','2019-11-18 20:13:43','11111111','2019-11-18 20:13:43','11111111');

/*Table structure for table `m_error` */

DROP TABLE IF EXISTS `m_error`;

CREATE TABLE `m_error` (
  `ME_NIK` char(15) NOT NULL DEFAULT '',
  `ME_ERROR` varchar(160) NOT NULL DEFAULT '',
  PRIMARY KEY (`ME_NIK`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `m_error` */

/*Table structure for table `m_ip` */

DROP TABLE IF EXISTS `m_ip`;

CREATE TABLE `m_ip` (
  `MAC_ADDR` varchar(17) DEFAULT NULL,
  `IP_ADDR` varchar(15) DEFAULT NULL,
  `IP_PK` varchar(4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `m_ip` */

/*Table structure for table `m_toko` */

DROP TABLE IF EXISTS `m_toko`;

CREATE TABLE `m_toko` (
  `MT_KODE` varchar(4) NOT NULL DEFAULT '',
  `MT_NAMA` varchar(80) NOT NULL DEFAULT '',
  `MT_INIT` varchar(5) NOT NULL DEFAULT '',
  `MT_ALM1` varchar(80) NOT NULL DEFAULT '',
  `MT_ALM2` varchar(80) NOT NULL DEFAULT '',
  `MT_KOTA` varchar(80) NOT NULL DEFAULT '',
  `MT_KD_POS` varchar(7) NOT NULL DEFAULT '',
  `MT_NAMA_NPWP` varchar(40) NOT NULL DEFAULT '-',
  `MT_NO_NPWP` varchar(20) NOT NULL DEFAULT '-',
  `MT_ALM_NPWP` varchar(80) NOT NULL DEFAULT '-',
  `MT_ALM2_NPWP` varchar(80) NOT NULL DEFAULT '-',
  `MT_ALM3_NPWP` varchar(80) NOT NULL DEFAULT '-',
  `MT_KOTA_NPWP` varchar(80) NOT NULL DEFAULT '',
  `MT_DATE_NPWP` date DEFAULT NULL,
  `MT_NPWP_DI_STRUK` char(1) NOT NULL DEFAULT 'N',
  `MT_TY` char(1) NOT NULL DEFAULT 'T',
  `MT_TELP1` varchar(15) NOT NULL DEFAULT '',
  `MT_TELP2` varchar(15) NOT NULL DEFAULT '',
  `MT_FAX` varchar(15) NOT NULL DEFAULT '',
  `MT_SFP` varchar(15) NOT NULL DEFAULT '',
  `MT_ST_TF` char(1) NOT NULL DEFAULT 'N',
  `MT_UU_TF` char(4) NOT NULL DEFAULT '-',
  `MT_HDR1` varchar(40) DEFAULT '',
  `MT_HDR2` varchar(40) DEFAULT '',
  `MT_HDR3` varchar(40) DEFAULT '',
  `MT_HDR4` varchar(40) DEFAULT '',
  `MT_FOOT1` varchar(40) DEFAULT '',
  `MT_FOOT2` varchar(40) DEFAULT '',
  `MT_FOOT3` varchar(40) DEFAULT '',
  `MT_FOOT4` varchar(40) DEFAULT '',
  `MT_D_OPEN` date NOT NULL DEFAULT '2007-01-01',
  `MT_D_CLOSE` date NOT NULL DEFAULT '2007-01-01',
  `MT_INET_ID` varchar(30) DEFAULT '',
  `MT_INET_AN` varchar(30) DEFAULT '',
  `MT_REK_PLN` varchar(30) DEFAULT '',
  `MT_REK_PLN_AN` varchar(30) DEFAULT '',
  `MT_REK_PDAM` varchar(30) DEFAULT '',
  `MT_REK_PDAM_AN` varchar(30) DEFAULT '',
  `MT_TID1` varchar(30) DEFAULT '',
  `MT_TID1_NO` varchar(30) DEFAULT '',
  `MT_TID2` varchar(30) DEFAULT '',
  `MT_TID2_NO` varchar(30) DEFAULT '',
  `MT_TID3` varchar(30) DEFAULT '',
  `MT_TID3_NO` varchar(30) DEFAULT '',
  `MT_TID4` varchar(30) DEFAULT '',
  `MT_TID4_NO` varchar(30) DEFAULT '',
  `MT_LUAS_M2` int DEFAULT '0',
  `MT_STS_TOKO` char(1) NOT NULL DEFAULT '',
  `MT_LAT_LONG` varchar(50) NOT NULL DEFAULT '',
  `MT_DI` datetime NOT NULL DEFAULT '2007-01-01 00:00:00',
  `MT_NI` char(15) NOT NULL DEFAULT '',
  `MT_DU` datetime NOT NULL DEFAULT '2007-01-01 00:00:00',
  `MT_NU` char(15) NOT NULL DEFAULT '',
  `MT_IP_SERVER` varchar(30) NOT NULL DEFAULT 'localhost',
  `MP_PORT_SERVER` varchar(5) NOT NULL DEFAULT '3306',
  `MT_AKTIF` char(1) NOT NULL DEFAULT 'Y',
  `MT_MG_KODE` char(4) NOT NULL DEFAULT '-',
  `MT_CLUSTER` char(4) NOT NULL DEFAULT 'A',
  `MT_STATUS_UU` char(1) NOT NULL DEFAULT '3',
  `MT_UU_ACC` char(2) NOT NULL DEFAULT '00',
  `MT_ST_PKP_NPKP` char(1) NOT NULL DEFAULT 'N',
  `MT_KODE_PROFITCENTER` varchar(10) NOT NULL DEFAULT '00',
  PRIMARY KEY (`MT_KODE`),
  KEY `KODE_INIT` (`MT_INIT`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `m_toko` */

insert  into `m_toko`(`MT_KODE`,`MT_NAMA`,`MT_INIT`,`MT_ALM1`,`MT_ALM2`,`MT_KOTA`,`MT_KD_POS`,`MT_NAMA_NPWP`,`MT_NO_NPWP`,`MT_ALM_NPWP`,`MT_ALM2_NPWP`,`MT_ALM3_NPWP`,`MT_KOTA_NPWP`,`MT_DATE_NPWP`,`MT_NPWP_DI_STRUK`,`MT_TY`,`MT_TELP1`,`MT_TELP2`,`MT_FAX`,`MT_SFP`,`MT_ST_TF`,`MT_UU_TF`,`MT_HDR1`,`MT_HDR2`,`MT_HDR3`,`MT_HDR4`,`MT_FOOT1`,`MT_FOOT2`,`MT_FOOT3`,`MT_FOOT4`,`MT_D_OPEN`,`MT_D_CLOSE`,`MT_INET_ID`,`MT_INET_AN`,`MT_REK_PLN`,`MT_REK_PLN_AN`,`MT_REK_PDAM`,`MT_REK_PDAM_AN`,`MT_TID1`,`MT_TID1_NO`,`MT_TID2`,`MT_TID2_NO`,`MT_TID3`,`MT_TID3_NO`,`MT_TID4`,`MT_TID4_NO`,`MT_LUAS_M2`,`MT_STS_TOKO`,`MT_LAT_LONG`,`MT_DI`,`MT_NI`,`MT_DU`,`MT_NU`,`MT_IP_SERVER`,`MP_PORT_SERVER`,`MT_AKTIF`,`MT_MG_KODE`,`MT_CLUSTER`,`MT_STATUS_UU`,`MT_UU_ACC`,`MT_ST_PKP_NPKP`,`MT_KODE_PROFITCENTER`) values 
('2000','PUSAT GROSIR KACAMATA','HO','Jalan. Pasar Baru No. 88 ','JAKARTA SELATAN','JAKARTA','-','PT. PLASINDO LESTARI ','-','-','-','-','BANDUNG','2014-01-01','N','M','-','-','021-30061576','021-30061515','Y','-','PUSAT GROSIR KACAMATA ','Jalan. Pasar Baru No 88','Jakarta Pusat','Jakarta','** SUMBER ANEKA JAYA  SAHABAT BELANJA AN','** TERIMA KASIH ATAS KUNJUNGAN ANDA **','> KAMI TUNGGU KEDATANGAN ANDA KEMBALI <','','2007-01-01','2007-01-01','','','','','','','','','','','','','','',0,'','','2010-09-24 09:36:18','0110012','2019-11-18 23:46:25','11111111','localhost','3306','Y','2000','A','1','00','N','00'),
('3001','STORE PRAMA BANJARAN','BJ','-','-','-','-','-','-','-','-','-','-','2007-01-01','-','M','-','-','-','-','-','-','STORE PRAMA BANJARAN','-','-','- -','Terima Kasih Atas Kunjungan Anda','Untuk Barang Kena Pajak','Harga Sudah Termasuk PPn (10%)','No. NPWP -','2007-01-01','2007-01-01','','','','','','','','','','','','','','',0,'','','2018-12-04 03:28:47','11111111','2018-12-04 03:28:47','11111111','-','-','Y','2000','-','2','-','Y','00'),
('3000','DC PRAMA','DP','-','-','-','-','-','-','-','-','-','-','2007-01-01','-','M','-','-','-','-','-','-','DC PRAMA','-','-','- -','Terima Kasih Atas Kunjungan Anda','Untuk Barang Kena Pajak','Harga Sudah Termasuk PPn (10%)','No. NPWP -','2007-01-01','2007-01-01','','','','','','','','','','','','','','',0,'','','2018-12-04 03:29:59','11111111','2018-12-04 03:29:59','11111111','-','-','Y','2000','-','2','-','-','00'),
('4000','DC BORMA','DB','-','-','-','-','-','-','-','-','-','-','2007-01-01','-','M','-','-','-','-','-','-','DC BORMA','-','-','- -','Terima Kasih Atas Kunjungan Anda','Untuk Barang Kena Pajak','Harga Sudah Termasuk PPn (10%)','No. NPWP -','2007-01-01','2007-01-01','','','','','','','','','','','','','','',0,'','','2018-12-04 03:30:21','11111111','2018-12-19 16:35:33','11111111','-','-','Y','2000','-','2','-','-','00'),
('4001','STORE BORMA BUAH BATU','BB','-','-','-','-','-','-','-','-','-','-','2007-01-01','-','M','-','-','-','-','-','-','STORE BORMA BUAH BATU','-','-','- -','Terima Kasih Atas Kunjungan Anda','Untuk Barang Kena Pajak','Harga Sudah Termasuk PPn (10%)','No. NPWP -','2007-01-01','2007-01-01','','','','','','','','','','','','','','',0,'','','2018-12-04 03:28:47','11111111','2018-12-19 16:35:33','11111111','-','-','Y','2000','-','2','-','Y','00'),
('4002','TOKO SUMBER ANEKA JAYA','CK','-','-','-','-','-','-','-','-','-','-','2007-01-01','N','M','-','-','-','-','-','-','TOKO SUMBER ANEKA JAYA','Jl. Raya Sawit Kec Darangdan','kec Purwakarta','JAWA BARAT','Terima Kasih Atas Kunjungan Anda','Untuk Barang Kena Pajak','Harga Sudah Termasuk PPn (10%)','No. NPWP -','2007-01-01','2007-01-01','','','','','','','','','','','','','','',0,'','','2018-12-04 03:28:47','11111111','2019-11-18 21:05:53','11111111','-','-','Y','2000','-','1','-','Y','00'),
('4003','STORE BORMA CIJERAH','CJ','-','-','-','-','-','-','-','-','-','-','2007-01-01','-','M','-','-','-','-','-','-','STORE BORMA CIJERAH','-','-','- -','Terima Kasih Atas Kunjungan Anda','Untuk Barang Kena Pajak','Harga Sudah Termasuk PPn (10%)','No. NPWP -','2007-01-01','2007-01-01','','','','','','','','','','','','','','',0,'','','2018-12-04 03:28:47','11111111','2019-03-18 09:54:26','15','-','-','Y','2000','-','1','-','Y','00'),
('4004','STORE BORMA KERKOF','KK','-','-','-','-','-','-','-','-','-','-','2007-01-01','-','M','-','-','-','-','-','-','STORE BORMA KERKOF','-','-','- -','Terima Kasih Atas Kunjungan Anda','Untuk Barang Kena Pajak','Harga Sudah Termasuk PPn (10%)','No. NPWP -','2007-01-01','2007-01-01','','','','','','','','','','','','','','',0,'','','2018-12-04 03:28:47','11111111','2018-12-19 16:35:33','11111111','-','-','Y','2000','-','2','-','Y','00'),
('4005','STORE BORMA GEMPOL','GP','-','-','-','-','-','-','-','-','-','-','2007-01-01','-','M','-','-','-','-','-','-','STORE BORMA GEMPOL','-','-','- -','Terima Kasih Atas Kunjungan Anda','Untuk Barang Kena Pajak','Harga Sudah Termasuk PPn (10%)','No. NPWP -','2007-01-01','2007-01-01','','','','','','','','','','','','','','',0,'','','2018-12-04 03:28:47','11111111','2018-12-19 16:35:33','11111111','-','-','Y','2000','-','2','-','Y','00'),
('3002','STORE PRAMA BBS','BS','BABAKAN SARI','-','BANDUNG','-','-','-','-','-','-','-','2019-05-01','-','M','-','-','-','-','Y','-','-STORE PRAMA BABAKAN SARI','-BABAKAN SARI','-','-BANDUNG -','Terima Kasih Atas Kunjungan Anda','Untuk Barang Kena Pajak','Harga Sudah Termasuk PPn (10%)','No. NPWP -','2007-01-01','2007-01-01','','','','','','','','','','','','','','',0,'','','2019-03-11 09:48:52','11111111','2019-03-14 16:22:37','11111111','-','-','-','2000','-','2','-','Y','00'),
('2001','toko ho ke dua','-','-','-','-','-','-','-','-','-','-','-','2007-01-01','-','-','-','-','-','-','-','-','toko ho ke dua','-','-','- -','Terima Kasih Atas Kunjungan Anda','Untuk Barang Kena Pajak','Harga Sudah Termasuk PPn (10%)','No. NPWP -','2007-01-01','2007-01-01','','','','','','','','','','','','','','',0,'','','2019-12-17 12:20:29','11111111','2019-12-17 12:20:29','11111111','-','-','-','2000','-','-','-','-','00');

/*Table structure for table `m_toko_group` */

DROP TABLE IF EXISTS `m_toko_group`;

CREATE TABLE `m_toko_group` (
  `MTG_KODE` char(4) NOT NULL DEFAULT '',
  `MTG_NAMA` varchar(20) NOT NULL DEFAULT '',
  `MTG_UU_KODE` char(4) NOT NULL DEFAULT '',
  `MTG_STS` char(1) NOT NULL DEFAULT 'Y',
  `MTG_DI` datetime NOT NULL DEFAULT '2007-01-01 00:00:00',
  `MTG_NI` char(15) NOT NULL DEFAULT '',
  `MTG_DU` datetime NOT NULL DEFAULT '2007-01-01 00:00:00',
  `MTG_NU` char(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`MTG_KODE`,`MTG_UU_KODE`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `m_toko_group` */

insert  into `m_toko_group`(`MTG_KODE`,`MTG_NAMA`,`MTG_UU_KODE`,`MTG_STS`,`MTG_DI`,`MTG_NI`,`MTG_DU`,`MTG_NU`) values 
('2000','DINAMIXA','2000','Y','2007-01-01 00:00:00','','2007-01-01 00:00:00',''),
('2000','DINAMIXA','2001','Y','2007-01-01 00:00:00','','2007-01-01 00:00:00',''),
('2000','DINAMIXA','3001','Y','2007-01-01 00:00:00','','2007-01-01 00:00:00',''),
('2000','DINAMIXA','3000','Y','2007-01-01 00:00:00','','2007-01-01 00:00:00',''),
('5000','DINAMIXA','4000','Y','2007-01-01 00:00:00','','2007-01-01 00:00:00',''),
('2000','DINAMIXA','4002','Y','2007-01-01 00:00:00','','2007-01-01 00:00:00',''),
('2000','DINAMIXA','4003','Y','2019-04-10 18:42:25','','2019-04-10 18:42:25',''),
('2000','DINAMIXA','4004','Y','2019-04-10 18:42:32','','2019-04-10 18:42:32',''),
('2000','DINAMIXA','4005','Y','2019-04-10 18:42:39','','2019-04-10 18:42:39',''),
('5000','DINAMIXA','4001','Y','2019-04-10 18:42:42','','2019-04-10 18:42:42','');

/*Table structure for table `ms_business_unit` */

DROP TABLE IF EXISTS `ms_business_unit`;

CREATE TABLE `ms_business_unit` (
  `mbu_id` int NOT NULL,
  `mbu_code` varchar(12) NOT NULL,
  `mbu_name` varchar(100) NOT NULL,
  `mbu_address_line_1` varchar(100) NOT NULL,
  `mbu_address_line_2` varchar(100) NOT NULL,
  PRIMARY KEY (`mbu_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `ms_business_unit` */

/*Table structure for table `ms_products` */

DROP TABLE IF EXISTS `ms_products`;

CREATE TABLE `ms_products` (
  `mp_id` int NOT NULL,
  `mp_code` int NOT NULL,
  `mp_sku` int NOT NULL,
  `mp_barcode` int NOT NULL,
  `mp_desc_line_1` varchar(100) NOT NULL,
  `mp_desc_line_2` varchar(100) NOT NULL,
  `mp_avg_cost` decimal(10,2) DEFAULT NULL,
  `mp_last_cost` decimal(10,2) DEFAULT NULL,
  `mp_created_by` varchar(50) DEFAULT NULL,
  `mp_created_date` date DEFAULT NULL,
  `mp_updated_by` varchar(50) DEFAULT NULL,
  `mp_updated_date` date DEFAULT NULL,
  PRIMARY KEY (`mp_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `ms_products` */

/*Table structure for table `one_forms` */

DROP TABLE IF EXISTS `one_forms`;

CREATE TABLE `one_forms` (
  `of_pk` int DEFAULT NULL,
  `of_kode` int DEFAULT NULL,
  `of_nama` varchar(100) DEFAULT NULL,
  `of_tgl_form` date DEFAULT NULL,
  `of_ins_user` varchar(30) DEFAULT NULL,
  `of_ins_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `one_forms` */

insert  into `one_forms`(`of_pk`,`of_kode`,`of_nama`,`of_tgl_form`,`of_ins_user`,`of_ins_date`) values 
(NULL,1234,'AWALUDIN','1999-12-24',NULL,NULL);

/*Table structure for table `one_forms_det` */

DROP TABLE IF EXISTS `one_forms_det`;

CREATE TABLE `one_forms_det` (
  `ofd_of_pk` int DEFAULT NULL,
  `ofd_pk` int DEFAULT NULL,
  `ofd_ket_forms` varchar(50) DEFAULT NULL,
  `ofd_jumlah` int DEFAULT NULL,
  `ofd_ins_user` varchar(30) DEFAULT NULL,
  `ofd_ins_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `one_forms_det` */

/*Table structure for table `tr_purchase_order_details` */

DROP TABLE IF EXISTS `tr_purchase_order_details`;

CREATE TABLE `tr_purchase_order_details` (
  `tpod_id` varchar(50) NOT NULL,
  `tpod_tpoh_id` varchar(50) DEFAULT NULL,
  `tpod_mp_sku` int DEFAULT NULL,
  `tpod_mp_barcode` int DEFAULT NULL,
  `tpod_quantity` int DEFAULT NULL,
  `tpod_price` decimal(10,2) DEFAULT NULL,
  `tpod_tax_1` decimal(10,2) DEFAULT NULL,
  `tpod_tax_2` decimal(10,2) DEFAULT NULL,
  `tpod_total_price` decimal(10,2) DEFAULT NULL,
  `tpod_created_by` varchar(50) DEFAULT NULL,
  `tpod_created_date` date DEFAULT NULL,
  `tpod_updated_by` varchar(50) DEFAULT NULL,
  `tpod_updated_date` date DEFAULT NULL,
  PRIMARY KEY (`tpod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tr_purchase_order_details` */

insert  into `tr_purchase_order_details`(`tpod_id`,`tpod_tpoh_id`,`tpod_mp_sku`,`tpod_mp_barcode`,`tpod_quantity`,`tpod_price`,`tpod_tax_1`,`tpod_tax_2`,`tpod_total_price`,`tpod_created_by`,`tpod_created_date`,`tpod_updated_by`,`tpod_updated_date`) values 
('234786788540050580','234786786040050579',234,2343,10,23.00,24.00,NULL,10.00,NULL,NULL,NULL,NULL),
('234786790040050581','234786786040050579',2566,25444,12,14.00,18.00,NULL,100.00,NULL,NULL,NULL,NULL),
('234786819540050585','234786818140050584',234,144,4444,1221.00,1212.00,NULL,1212.00,NULL,NULL,NULL,NULL),
('234818466940050608','234818464640050607',2222,34534,333,222.00,222.00,NULL,2222.00,NULL,NULL,NULL,NULL),
('234818541640050612','234818538840050611',2344,2555,23,10.00,23.00,NULL,100.00,NULL,NULL,NULL,NULL),
('234818611140050615','234818608840050614',234,23232,12,12.00,3.00,NULL,147.00,NULL,NULL,NULL,NULL),
('235016810340050624','235016808640050623',234,12121,1,12.00,12.00,NULL,24.00,NULL,NULL,NULL,NULL),
('235016817740050627','235016808640050623',2355,2533,23,10.00,212.00,NULL,442.00,NULL,NULL,NULL,NULL),
('235017091740050631','235017090040050630',123,234,12,10.00,12.00,NULL,132.00,NULL,NULL,NULL,NULL),
('235117989640050635','235117986540050634',234,1111,10,12.00,15.00,NULL,135.00,NULL,NULL,NULL,NULL);

/*Table structure for table `tr_purchase_order_head` */

DROP TABLE IF EXISTS `tr_purchase_order_head`;

CREATE TABLE `tr_purchase_order_head` (
  `tpoh_id` varchar(50) NOT NULL,
  `tpoh_bu_id` int DEFAULT NULL,
  `tpoh_number` varchar(10) DEFAULT NULL,
  `tpoh_supplier_id` int DEFAULT NULL,
  `tpoh_order_date` date DEFAULT NULL,
  `tpoh_order_arrival_date` date DEFAULT NULL,
  `tpoh_top_id` varchar(1) DEFAULT NULL,
  `tpoh_total_amount` decimal(10,2) DEFAULT NULL,
  `tpoh_status` varchar(255) DEFAULT NULL,
  `tpoh_created_by` varchar(50) DEFAULT NULL,
  `tpoh_created_date` date DEFAULT NULL,
  `tpoh_updated_by` varchar(50) DEFAULT NULL,
  `tpoh_updated_date` date DEFAULT NULL,
  PRIMARY KEY (`tpoh_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tr_purchase_order_head` */

insert  into `tr_purchase_order_head`(`tpoh_id`,`tpoh_bu_id`,`tpoh_number`,`tpoh_supplier_id`,`tpoh_order_date`,`tpoh_order_arrival_date`,`tpoh_top_id`,`tpoh_total_amount`,`tpoh_status`,`tpoh_created_by`,`tpoh_created_date`,`tpoh_updated_by`,`tpoh_updated_date`) values 
('234786818140050584',NULL,NULL,1010,NULL,'0000-00-00',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('234818464640050607',NULL,'34543534',444,NULL,'0000-00-00','1',NULL,NULL,NULL,NULL,NULL,NULL),
('234818538840050611',235,'1',NULL,NULL,'0000-00-00','1',NULL,NULL,NULL,NULL,NULL,NULL),
('234818608840050614',232,'1',NULL,NULL,'0000-00-00','1',NULL,NULL,NULL,NULL,NULL,NULL),
('235788477440050638',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('235816475040050642',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/* Function  structure for function  `F_GET_PK` */

/*!50003 DROP FUNCTION IF EXISTS `F_GET_PK` */;
DELIMITER $$

/*!50003 CREATE FUNCTION `F_GET_PK`() RETURNS varchar(18) CHARSET utf8mb4
    DETERMINISTIC
BEGIN 

  DECLARE v_hasil VARCHAR(18) ; 
  DECLARE v_nilai INTEGER(4) ; 
  DECLARE v_too_many_rows,v_not_found BOOLEAN DEFAULT FALSE ; 

  SET v_nilai = (( DATE_FORMAT( SYSDATE(), '%m') - 1) * 50) + DATE_FORMAT( SYSDATE(), '%d') ; 
  SET v_hasil = CONCAT( DATE_FORMAT( SYSDATE(), '%y'), RPAD( v_nilai, 3, '0') ) ; 
  SET v_nilai = TIME_FORMAT( SYSDATE(), '%s') + (TIME_FORMAT( SYSDATE(), '%i') * 60) +  (TIME_FORMAT( SYSDATE(), '%H') * 3600) ; 
  SET v_hasil = CONCAT( v_hasil, LPAD( v_nilai, 5, '0'), @G_UU_CODE_AKTIF) ; 
  
  BEGIN 
    DECLARE EXIT HANDLER FOR 1172 SET v_too_many_rows = TRUE ; 
    DECLARE EXIT HANDLER FOR 1329 SET v_not_found = TRUE ; 
    SELECT MC_NO INTO v_nilai FROM M_COUNT ; 
  
  END ; 
  
  IF v_too_many_rows OR v_not_found THEN 
  
    DELETE FROM M_COUNT ; 
    INSERT INTO M_COUNT (MC_NO) VALUES (1) ; 
    SET v_nilai = 1; 
  END IF ; 

  SET v_hasil = CONCAT( v_hasil, LPAD( v_nilai, 4, '0')) ; 

  IF v_nilai >= 9999 THEN 
    UPDATE M_COUNT SET MC_NO = 0 ; 
  ELSE 
    UPDATE M_COUNT SET MC_NO = MC_NO + 1 ; 
  END IF ; 

  RETURN v_hasil; 

END */$$
DELIMITER ;

/* Procedure structure for procedure `P_INIT` */

/*!50003 DROP PROCEDURE IF EXISTS  `P_INIT` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `P_INIT`(v_nik VARCHAR(8), v_uu_aktif VARCHAR(4))
BEGIN  
  DECLARE v_uu_code,v_uu_klien     VARCHAR(4) ;  
  SET v_uu_code = '' ;  
  SET @G_ME_NIK        = v_nik ;  
  SET @G_UU_CODE_AKTIF = v_uu_aktif ;  
  SET @G_IDPK_KASIR='';  
  SET @G_KLAS_KLIEN='';  
    SELECT ME_MT_KODE INTO v_uu_code FROM (
     SELECT ME_NIK,ME_MT_KODE,MT_NAMA,MT_MG_KODE,MT_AKTIF,MTG_STS FROM (
                  SELECT ME_NIK,ME_MT_KODE FROM  M_EMPLY
               UNION ALL
               SELECT MES_NIK,MES_MT_KODE FROM M_EMPLY_STORE )
                M_EMPLY, M_TOKO,M_TOKO_GROUP 
               WHERE ME_NIK = v_nik AND ME_MT_KODE=MT_KODE AND MT_MG_KODE=MTG_KODE AND MT_AKTIF="Y" AND MTG_STS="Y"
               GROUP BY ME_MT_KODE ) a 
     WHERE ME_NIK = v_nik AND ME_MT_KODE = v_uu_aktif;
  IF v_uu_code IS NULL THEN  
    CALL RAISE_ERROR(' Nik_tidak_ditemukan_2 ') ;  
  END IF ;  
  SET @G_ME_NIK        = v_nik ;  
  SET @G_UU_CODE_AKTIF = v_uu_aktif ;  
  SELECT IP_PK  INTO @G_IDPK_KASIR FROM M_IP;  
END */$$
DELIMITER ;

/* Procedure structure for procedure `RAISE_ERROR` */

/*!50003 DROP PROCEDURE IF EXISTS  `RAISE_ERROR` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `RAISE_ERROR`(v_text VARCHAR(200))
BEGIN 
  DECLARE v_dup_val_on_index BOOLEAN DEFAULT FALSE ;
  IF @G_ME_NIK IS NOT NULL THEN
    BEGIN
      DECLARE EXIT HANDLER FOR 1062 SET v_dup_val_on_index = TRUE ;

      INSERT INTO M_ERROR( ME_NIK, ME_ERROR) VALUES ( @G_ME_NIK, v_text) ;
    END ;
    IF v_dup_val_on_index THEN
      UPDATE M_ERROR SET ME_ERROR = v_text WHERE ME_NIK = @G_ME_NIK ;
    END IF ;
  END IF ;
  CALL STOP_ALL( v_text ) ;
END */$$
DELIMITER ;

/* Procedure structure for procedure `STOP_ALL` */

/*!50003 DROP PROCEDURE IF EXISTS  `STOP_ALL` */;

DELIMITER $$

/*!50003 CREATE PROCEDURE `STOP_ALL`(v_text VARCHAR(200))
BEGIN  
  SET @A = CONCAT('SET ', v_text, ' -') ;  
  PREPARE v_error FROM @A ;  
  EXECUTE v_error ;  
  DEALLOCATE PREPARE v_error ;  
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
