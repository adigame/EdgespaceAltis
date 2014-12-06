/*
Navicat MySQL Data Transfer

Source Server         : Local
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : arma3life

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2014-12-06 11:45:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for economy
-- ----------------------------
DROP TABLE IF EXISTS `economy`;
CREATE TABLE `economy` (
  `numero` int(12) NOT NULL,
  `ressource` varchar(32) NOT NULL,
  `sellprice` int(100) NOT NULL DEFAULT '0',
  `buyprice` int(100) NOT NULL DEFAULT '0',
  `varprice` int(100) NOT NULL,
  `minprice` int(100) NOT NULL,
  `maxprice` int(100) NOT NULL,
  `factor` enum('0','1','2','3','4','5','6','7') NOT NULL DEFAULT '0',
  `shoptype` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of economy
-- ----------------------------
INSERT INTO `economy` VALUES ('0', 'salema', '40', '55', '100', '40', '50', '7', 'fishmarket');
INSERT INTO `economy` VALUES ('1', 'water', '5', '10', '100', '10', '30', '7', 'market');
INSERT INTO `economy` VALUES ('3', 'rabbit', '50', '75', '100', '75', '150', '7', 'market');
INSERT INTO `economy` VALUES ('4', 'apple', '40', '50', '100', '75', '150', '2', 'market');
INSERT INTO `economy` VALUES ('5', 'storagebig', '240000', '250000', '10', '10', '10', '1', 'market');
INSERT INTO `economy` VALUES ('6', 'storagesmall', '124000', '125000', '0', '0', '0', '0', 'market');
INSERT INTO `economy` VALUES ('7', 'bottledbeer', '1100', '1250', '0', '0', '0', '0', 'market');
INSERT INTO `economy` VALUES ('8', 'bottledwhiskey', '5000', '5500', '0', '0', '0', '0', 'market');
INSERT INTO `economy` VALUES ('9', 'redgull', '800', '1000', '0', '0', '0', '0', 'market');
INSERT INTO `economy` VALUES ('10', 'battery', '80', '100', '0', '0', '0', '0', 'market');
INSERT INTO `economy` VALUES ('11', 'tbacon', '65', '75', '0', '0', '0', '0', 'market');
INSERT INTO `economy` VALUES ('12', 'lockpick', '3500', '4000', '0', '0', '0', '0', 'market');
INSERT INTO `economy` VALUES ('13', 'pickaxe', '1100', '1200', '0', '0', '0', '0', 'market');
INSERT INTO `economy` VALUES ('14', 'zipties', '450', '500', '0', '0', '0', '0', 'market');
INSERT INTO `economy` VALUES ('15', 'peach', '65', '70', '0', '0', '0', '0', 'market');
INSERT INTO `economy` VALUES ('16', 'boltcutter', '7000', '8000', '0', '0', '0', '0', 'market');
INSERT INTO `economy` VALUES ('17', 'blastingcharge', '40000', '50000', '0', '0', '0', '0', 'market');
INSERT INTO `economy` VALUES ('18', 'water', '8', '10', '0', '0', '0', '0', 'rebel');
INSERT INTO `economy` VALUES ('19', 'rabbit', '65', '75', '0', '0', '0', '0', 'rebel');
INSERT INTO `economy` VALUES ('20', 'apple', '40', '50', '0', '0', '0', '0', 'rebel');
INSERT INTO `economy` VALUES ('21', 'redgull', '900', '1000', '0', '0', '0', '0', 'rebel');
INSERT INTO `economy` VALUES ('22', 'tbacon', '50', '75', '0', '0', '0', '0', 'rebel');
INSERT INTO `economy` VALUES ('23', 'lockpick', '3500', '4000', '0', '0', '0', '0', 'rebel');
INSERT INTO `economy` VALUES ('24', 'pickaxe', '1100', '1200', '0', '0', '0', '0', 'rebel');
INSERT INTO `economy` VALUES ('25', 'fuelF', '800', '850', '0', '0', '0', '0', 'rebel');
INSERT INTO `economy` VALUES ('26', 'peach', '50', '70', '0', '0', '0', '0', 'rebel');
INSERT INTO `economy` VALUES ('27', 'blastingcharge', '40000', '50000', '0', '0', '0', '0', 'rebel');
INSERT INTO `economy` VALUES ('28', 'boltcutter', '7000', '8000', '0', '0', '0', '0', 'rebel');
INSERT INTO `economy` VALUES ('29', 'turtlesoup', '12500', '15000', '0', '0', '0', '0', 'wongs');
INSERT INTO `economy` VALUES ('30', 'turtle', '12500', '15000', '0', '0', '0', '0', 'wongs');
INSERT INTO `economy` VALUES ('31', 'moonshine', '8000', '9000', '0', '0', '0', '0', 'wongs');
INSERT INTO `economy` VALUES ('32', 'coffee', '8', '10', '0', '0', '0', '0', 'coffee');
INSERT INTO `economy` VALUES ('33', 'donuts', '8', '10', '0', '0', '0', '0', 'coffee');
INSERT INTO `economy` VALUES ('33', 'cocainep', '5000', '6000', '0', '0', '0', '0', 'heroin');
INSERT INTO `economy` VALUES ('34', 'heroinp', '4000', '5000', '0', '0', '0', '0', 'heroin');
INSERT INTO `economy` VALUES ('33', 'marijuana', '800', '1000', '0', '0', '0', '0', 'heroin');
INSERT INTO `economy` VALUES ('34', 'methp', '12000', '15000', '0', '0', '0', '0', 'heroin');
INSERT INTO `economy` VALUES ('35', 'ornate', '40', '50', '0', '0', '0', '0', 'fishmarket');
INSERT INTO `economy` VALUES ('36', 'mackerel', '180', '200', '0', '0', '0', '0', 'fishmarket');
INSERT INTO `economy` VALUES ('37', 'mullet', '270', '300', '0', '0', '0', '0', 'fishmarket');
INSERT INTO `economy` VALUES ('38', 'tuna', '700', '900', '0', '0', '0', '0', 'fishmarket');
INSERT INTO `economy` VALUES ('39', 'catshark', '330', '350', '0', '0', '0', '0', 'fishmarket');
INSERT INTO `economy` VALUES ('40', 'glass', '1400', '1500', '0', '0', '0', '0', 'glass');
INSERT INTO `economy` VALUES ('41', 'iron_r', '1800', '2000', '0', '0', '0', '0', 'iron');
INSERT INTO `economy` VALUES ('42', 'copper_r', '1800', '2000', '0', '0', '0', '0', 'iron');
INSERT INTO `economy` VALUES ('43', 'diamond', '7500', '8000', '0', '0', '0', '0', 'diamond');
INSERT INTO `economy` VALUES ('44', 'diamondc', '8000', '8500', '0', '0', '0', '0', 'diamond');
INSERT INTO `economy` VALUES ('45', 'salt_r', '400', '450', '0', '0', '0', '0', 'salt');
INSERT INTO `economy` VALUES ('46', 'donuts', '8', '10', '0', '0', '0', '0', 'cop');
INSERT INTO `economy` VALUES ('47', 'coffee', '8', '10', '0', '0', '0', '0', 'cop');
INSERT INTO `economy` VALUES ('48', 'spikeStrip', '8', '10', '0', '0', '0', '0', 'cop');
INSERT INTO `economy` VALUES ('49', 'mauer', '450', '500', '0', '0', '0', '0', 'cop');
INSERT INTO `economy` VALUES ('50', 'battery', '85', '100', '0', '0', '0', '0', 'cop');
INSERT INTO `economy` VALUES ('51', 'painkillers', '450', '500', '0', '0', '0', '0', 'cop');
INSERT INTO `economy` VALUES ('52', 'redgull', '900', '1000', '0', '0', '0', '0', 'cop');
INSERT INTO `economy` VALUES ('53', 'defusekit', '450', '500', '0', '0', '0', '0', 'cop');
INSERT INTO `economy` VALUES ('54', 'cement', '500', '600', '0', '0', '0', '0', 'cement');
INSERT INTO `economy` VALUES ('55', 'wine', '3800', '4000', '0', '0', '0', '0', 'beer');
INSERT INTO `economy` VALUES ('56', 'painkillers', '450', '500', '0', '0', '0', '0', 'pharmacy');
INSERT INTO `economy` VALUES ('57', 'morphium', '1400', '1500', '0', '0', '0', '0', 'pharmacy');
INSERT INTO `economy` VALUES ('58', 'scalpel', '7000', '7500', '0', '0', '0', '0', 'pharmacy');
INSERT INTO `economy` VALUES ('59', 'kidney', '14500', '15000', '0', '0', '0', '0', 'pharmacy');
INSERT INTO `economy` VALUES ('60', 'apple', '50', '65', '0', '0', '0', '0', 'medic');
INSERT INTO `economy` VALUES ('61', 'donuts', '8', '10', '0', '0', '0', '0', 'medic');
INSERT INTO `economy` VALUES ('62', 'coffee', '8', '10', '0', '0', '0', '0', 'medic');
INSERT INTO `economy` VALUES ('63', 'battery', '70', '75', '0', '0', '0', '0', 'medic');
INSERT INTO `economy` VALUES ('64', 'redgull', '800', '1000', '0', '0', '0', '0', 'medic');
INSERT INTO `economy` VALUES ('65', 'fuelF', '750', '850', '0', '0', '0', '0', 'medic');
INSERT INTO `economy` VALUES ('66', 'bottledbeer', '1100', '1250', '0', '0', '0', '0', 'speakeasy');
INSERT INTO `economy` VALUES ('67', 'bottledwhiskey', '5000', '5500', '0', '0', '0', '0', 'speakeasy');
INSERT INTO `economy` VALUES ('68', 'bottledshine', '11000', '12000', '0', '0', '0', '0', 'speakeasy');
INSERT INTO `economy` VALUES ('69', 'bottles', '80', '100', '0', '0', '0', '0', 'bar');
INSERT INTO `economy` VALUES ('70', 'cornmeal', '450', '500', '0', '0', '0', '0', 'bar');
INSERT INTO `economy` VALUES ('71', 'ipuranium', '8000', '9000', '0', '0', '0', '0', 'uranium');
INSERT INTO `economy` VALUES ('72', 'puranium', '900', '1000', '0', '0', '0', '0', 'uranium');
INSERT INTO `economy` VALUES ('73', 'wine', '850', '0', '0', '0', '0', '0', 'market');

-- ----------------------------
-- Table structure for gangs
-- ----------------------------
DROP TABLE IF EXISTS `gangs`;
CREATE TABLE `gangs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `members` text,
  `maxmembers` int(2) DEFAULT '8',
  `bank` int(100) DEFAULT '0',
  `active` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of gangs
-- ----------------------------
INSERT INTO `gangs` VALUES ('1', '76561197971386121', 'Your Gang Name', '\"[`76561197971386121`]\"', '8', '1', '1');

-- ----------------------------
-- Table structure for houses
-- ----------------------------
DROP TABLE IF EXISTS `houses`;
CREATE TABLE `houses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` varchar(32) NOT NULL,
  `pos` varchar(64) DEFAULT NULL,
  `inventory` text,
  `containers` text,
  `owned` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`,`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of houses
-- ----------------------------

-- ----------------------------
-- Table structure for messages
-- ----------------------------
DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages` (
  `uid` int(12) NOT NULL AUTO_INCREMENT,
  `fromID` varchar(50) NOT NULL,
  `toID` varchar(50) NOT NULL,
  `message` text,
  `fromName` varchar(32) NOT NULL,
  `toName` varchar(32) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of messages
-- ----------------------------

-- ----------------------------
-- Table structure for players
-- ----------------------------
DROP TABLE IF EXISTS `players`;
CREATE TABLE `players` (
  `uid` int(12) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `playerid` varchar(50) NOT NULL,
  `cash` int(100) NOT NULL DEFAULT '0',
  `bankacc` int(100) NOT NULL DEFAULT '0',
  `coplevel` enum('0','1','2','3','4','5','6','7') NOT NULL DEFAULT '0',
  `cop_licenses` text,
  `civ_licenses` text,
  `med_licenses` text,
  `cop_gear` text NOT NULL,
  `med_gear` text NOT NULL,
  `mediclevel` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0',
  `arrested` tinyint(1) NOT NULL DEFAULT '0',
  `aliases` text NOT NULL,
  `adminlevel` enum('0','1','2','3') NOT NULL DEFAULT '0',
  `donatorlvl` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0',
  `civ_gear` text NOT NULL,
  `blacklist` tinyint(1) NOT NULL DEFAULT '0',
  `jail_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `playerid` (`playerid`),
  KEY `name` (`name`),
  KEY `blacklist` (`blacklist`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of players
-- ----------------------------
INSERT INTO `players` VALUES ('12', 'NightShade', '76561197971386121', '985759', '4896704', '7', '\"[[`license_cop_air`,1],[`license_cop_swat`,0],[`license_cop_cg`,1]]\"', '\"[[`license_civ_driver`,1],[`license_civ_air`,1],[`license_civ_heroin`,0],[`license_civ_marijuana`,1],[`license_civ_gang`,0],[`license_civ_boat`,1],[`license_civ_oil`,0],[`license_civ_dive`,0],[`license_civ_truck`,1],[`license_civ_gun`,1],[`license_civ_rebel`,1],[`license_civ_coke`,1],[`license_civ_diamond`,0],[`license_civ_copper`,0],[`license_civ_iron`,0],[`license_civ_sand`,0],[`license_civ_salt`,0],[`license_civ_cement`,0],[`license_civ_grapes`,1],[`license_civ_moonshine`,0],[`license_civ_meth`,1],[`license_civ_home`,1],[`license_civ_stiller`,0],[`license_civ_liquor`,0],[`license_civ_bottler`,0],[`license_civ_uranium`,1]]\"', '\"[[`license_med_air`,1],[`license_med_adac`,0]]\"', '\"[`U_B_CombatUniform_mcam_worn`,`V_PlateCarrier1_blk`,`B_Carryall_oucamo`,`G_Sport_Checkered`,``,[`ItemMap`,`ItemCompass`,`ItemWatch`,`ItemGPS`],`arifle_SDAR_F`,`hgun_Rook40_F`,[`optic_DMS`],[`16Rnd_9x21_Mag`,`16Rnd_9x21_Mag`,`16Rnd_9x21_Mag`],[`H_CrewHelmetHeli_B`],[],[`V_PlateCarrier1_blk`,`H_Watchcap_blk`],[`16Rnd_9x21_Mag`,`16Rnd_9x21_Mag`,`20Rnd_556x45_UW_mag`,`20Rnd_556x45_UW_mag`,`20Rnd_556x45_UW_mag`,`20Rnd_556x45_UW_mag`,`20Rnd_556x45_UW_mag`,`16Rnd_9x21_Mag`],[``,``,``],[``,``,``],[`life_inv_coffee`,`life_inv_spikeStrip`,`life_inv_spikeStrip`,`life_inv_defusekit`]]\"', '\"[``,``,``,``,``,[],[],[],[],[],[],[],[],[],[],[],[]]\"', '5', '0', '\"[`NightShade`]\"', '3', '5', '\"[`U_C_Poloshirt_stripped`,``,``,``,``,[`ItemMap`,`ItemCompass`,`ItemWatch`,`ItemGPS`],``,``,[],[],[],[],[],[],[],[],[]]\"', '0', '0');

-- ----------------------------
-- Table structure for vehicles
-- ----------------------------
DROP TABLE IF EXISTS `vehicles`;
CREATE TABLE `vehicles` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `side` varchar(15) NOT NULL,
  `classname` varchar(32) NOT NULL,
  `type` varchar(12) NOT NULL,
  `pid` varchar(32) NOT NULL,
  `alive` tinyint(1) NOT NULL DEFAULT '1',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `plate` int(20) NOT NULL,
  `color` int(20) NOT NULL,
  `inventory` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `side` (`side`),
  KEY `pid` (`pid`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of vehicles
-- ----------------------------
INSERT INTO `vehicles` VALUES ('1', 'civ', 'B_Heli_Light_01_F', 'Air', '76561197971386121', '1', '1', '360733', '1', '\"[]\"');
INSERT INTO `vehicles` VALUES ('2', 'civ', 'C_Kart_01_Blu_F', 'Car', '76561197971386121', '1', '1', '696861', '0', '\"[]\"');
INSERT INTO `vehicles` VALUES ('3', 'civ', 'C_SUV_01_F', 'Car', '76561197971386121', '1', '1', '602644', '0', '\"[]\"');
INSERT INTO `vehicles` VALUES ('4', 'civ', 'O_Heli_Light_02_unarmed_F', 'Air', '76561197971386121', '1', '0', '321674', '0', '\"[]\"');
INSERT INTO `vehicles` VALUES ('5', 'civ', 'C_SUV_01_F', 'Car', '76561197971386121', '1', '1', '818637', '0', '\"[]\"');
INSERT INTO `vehicles` VALUES ('6', 'civ', 'C_SUV_01_F', 'Car', '76561197971386121', '1', '1', '56926', '0', '\"[]\"');
INSERT INTO `vehicles` VALUES ('7', 'civ', 'C_Van_01_fuel_F', 'Car', '76561197971386121', '1', '1', '693271', '0', '\"[]\"');
INSERT INTO `vehicles` VALUES ('8', 'civ', 'C_Hatchback_01_F', 'Car', '76561197971386121', '1', '1', '316127', '0', '\"[]\"');
INSERT INTO `vehicles` VALUES ('9', 'cop', 'I_MRAP_03_F', 'Car', '76561197971386121', '1', '1', '531100', '1', '\"[]\"');
INSERT INTO `vehicles` VALUES ('10', 'cop', 'B_MRAP_01_F', 'Car', '76561197971386121', '1', '1', '497589', '0', '\"[]\"');
INSERT INTO `vehicles` VALUES ('11', 'cop', 'B_MRAP_01_F', 'Car', '76561197971386121', '1', '1', '919511', '2', '\"[]\"');
INSERT INTO `vehicles` VALUES ('12', 'cop', 'B_MRAP_01_F', 'Car', '76561197971386121', '1', '1', '823791', '0', '\"[]\"');
INSERT INTO `vehicles` VALUES ('13', 'cop', 'C_Hatchback_01_F', 'Car', '76561197971386121', '1', '1', '706292', '8', '\"[]\"');
INSERT INTO `vehicles` VALUES ('14', 'civ', 'C_SUV_01_F', 'Car', '76561197971386121', '1', '0', '239989', '0', '\"[]\"');

-- ----------------------------
-- Procedure structure for deleteDeadVehicles
-- ----------------------------
DROP PROCEDURE IF EXISTS `deleteDeadVehicles`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteDeadVehicles`()
BEGIN
	DELETE FROM `vehicles` WHERE `alive` = 0;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for deleteEconomyPrices
-- ----------------------------
DROP PROCEDURE IF EXISTS `deleteEconomyPrices`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteEconomyPrices`()
    NO SQL
TRUNCATE `economy`;
;;
DELIMITER ;
