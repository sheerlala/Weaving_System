
--CREATE TABLE users (
--  username VARCHAR(45) NOT NULL ,
--  password VARCHAR(45) NOT NULL ,
--  enabled TINYINT NOT NULL DEFAULT 1 ,
--  PRIMARY KEY (username));#主键
--
--# --用户角色
--CREATE TABLE user_roles (
--  user_role_id int(11) NOT NULL AUTO_INCREMENT,
--  username varchar(45) NOT NULL,
--  role varchar(45) NOT NULL,
--  PRIMARY KEY (user_role_id),
--  UNIQUE KEY uni_username_role (role,username),
--  KEY fk_username_idx (username),
--  CONSTRAINT fk_username FOREIGN KEY (username) REFERENCES users (username));
--
--#--增加测试
--INSERT INTO users(username,password,enabled)
--VALUES ('xk','1', true);
--INSERT INTO users(username,password,enabled)
--VALUES ('alex','1', true);
--
--INSERT INTO user_roles (username, role)
--VALUES ('xk', 'USER');
--INSERT INTO user_roles (username, role)
--VALUES ('xk', 'ADMIN');
--INSERT INTO user_roles (username, role)
--VALUES ('alex', 'USER');

#-----------更改为角色表，用户，用户角色映射-------------#
--#资源表
--CREATE TABLE resc(
--  id BIGINT AUTO_INCREMENT,
--  name VARCHAR(50),
--  res_type VARCHAR(50),
--  res_string VARCHAR(200),
--  priority INTEGER,
--  descn VARCHAR(200),
--  PRIMARY KEY (id)
--);

#资源表
create table resource(
id int not null auto_increment,
msg varchar(200),
list varchar(200),
src varchar(200),
primary key (id)
);

#角色表
CREATE TABLE role(
  id int AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL ,
  descn VARCHAR(200),
  PRIMARY KEY (id)
);
#用户表
CREATE TABLE user(
  id BIGINT AUTO_INCREMENT,
  username VARCHAR(50),
  name varchar(50),
  password VARCHAR(50),
  email VARCHAR(50),
  phonenumber VARCHAR(50),
  plate varchar(50),
  plate_color varchar(50),
  location_id bigint,
  cartype varchar(50),
  enabled TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (id)
);
#资源角色连接表
CREATE TABLE resc_role(
  resc_id int ,
  role_id int ,
  PRIMARY KEY (resc_id, role_id),
  CONSTRAINT fk_resc_role_resc FOREIGN KEY (resc_id) REFERENCES resource(id),
  CONSTRAINT fk_resc_role_role FOREIGN KEY (role_id) REFERENCES role(id)
);
#用户角色连接表
CREATE TABLE user_role(
  user_id BIGINT,
  role_id int,
  PRIMARY KEY (user_id, role_id),
  CONSTRAINT fk_user_role_user FOREIGN KEY (user_id) REFERENCES user(id),
  CONSTRAINT fk_user_role_role FOREIGN KEY (role_id) REFERENCES role(id)
);

#--增加测试
#--id已经是auto_increment了,所以不需要在插入新对象的时候添加id
INSERT INTO user(username,password,enabled) VALUES ('admin','c4ca4238a0b923820dcc509a6f75849b',true);
INSERT INTO user(username,password,enabled) VALUES ('carowner','c4ca4238a0b923820dcc509a6f75849b',true);
INSERT INTO user(username,password,enabled) VALUES ('seat','c4ca4238a0b923820dcc509a6f75849b',true);
INSERT INTO user(username,password,enabled) VALUES ('guard','c4ca4238a0b923820dcc509a6f75849b',true);

INSERT INTO role(name,descn) VALUES ('ROLE_ADMIN','管理员角色');
INSERT INTO role(name,descn) VALUES ('ROLE_CAROWNER','车主角色');
INSERT INTO role(name,descn) VALUES ('ROLE_SEAT','座席角色');
INSERT INTO role(name,descn) VALUES ('ROLE_GUARD','保安角色');

--INSERT INTO resc(id,name,res_type,res_string,priority,descn) VALUES (1,'','URL','/admin.jsp',1,'');
--INSERT INTO resc(id,name,res_type,res_string,priority,descn) VALUES (2,'','URL','/**',2,'');

--INSERT INTO resc_role(resc_id, role_id) VALUES (1,1);
--INSERT INTO resc_role(resc_id, role_id) VALUES (2,1);
--INSERT INTO resc_role(resc_id, role_id) VALUES (2,2);

INSERT INTO user_role(user_id, role_id) VALUES (1,1);
INSERT INTO user_role(user_id, role_id) VALUES (2,2);
INSERT INTO user_role(user_id, role_id) VALUES (3,3);
INSERT INTO user_role(user_id, role_id) VALUES (4,4);

create table money(
id bigint not null auto_increment,
companyID int,
parkID int,
timestamp timestamp,
count int default 0,
primary key (id)
);

create table location(
id bigint not null auto_increment,
parent_id bigint,
name varchar(50),
type int,
primary key (id)
);

create table record(
id bigint not null auto_increment,
plate varchar(50),
gate_id int,
plate_image varchar(32000),
car_image varchar(32000),
location_id bigint,
carstatus varchar(20),
timestamp timestamp,
primary key (id)
);

INSERT INTO resource(msg,list, src) VALUES ('用户管理', '所有用户信息', 'allUserMessage.jsp,');
INSERT INTO resource(msg,list, src) VALUES ('个人信息', '个人信息查询,个人信息修改', 'userMessage.jsp,message.jsp');
INSERT INTO resource(msg,list, src) VALUES ('报表查询', '财务报表', 'charger.jsp');
INSERT INTO resource(msg,list, src) VALUES ('道闸管理', '道闸控制', '../park');
INSERT INTO resource(msg,list, src) VALUES ('全国小区', '小区信息', 'map.jsp');
insert into resource(msg,list, src) VALUES ('岗亭管理','岗亭监控','guard_video.jsp');

INSERT INTO resc_role(resc_id, role_id) VALUES (1,1);
INSERT INTO resc_role(resc_id, role_id) VALUES (2,1);
INSERT INTO resc_role(resc_id, role_id) VALUES (3,1);
INSERT INTO resc_role(resc_id, role_id) VALUES (4,1);
INSERT INTO resc_role(resc_id, role_id) VALUES (5,1);
INSERT INTO resc_role(resc_id, role_id) VALUES (2,2);
INSERT INTO resc_role(resc_id, role_id) VALUES (2,3);
INSERT INTO resc_role(resc_id, role_id) VALUES (4,3);
INSERT INTO resc_role(resc_id, role_id) VALUES (2,4);
INSERT INTO resc_role(resc_id, role_id) VALUES (6,4);


INSERT INTO `location` VALUES (1,0,'中国',0);
INSERT INTO `location` VALUES (2,1,'北京',1);
INSERT INTO `location` VALUES (3,1,'安徽',1);
INSERT INTO `location` VALUES (4,1,'福建',1);
INSERT INTO `location` VALUES (5,1,'甘肃',1);
INSERT INTO `location` VALUES (6,1,'广东',1);
INSERT INTO `location` VALUES (7,1,'广西',1);
INSERT INTO `location` VALUES (8,1,'贵州',1);
INSERT INTO `location` VALUES (9,1,'海南',1);
INSERT INTO `location` VALUES (10,1,'河北',1);
INSERT INTO `location` VALUES (11,1,'河南',1);
INSERT INTO `location` VALUES (12,1,'黑龙江',1);
INSERT INTO `location` VALUES (13,1,'湖北',1);
INSERT INTO `location` VALUES (14,1,'湖南',1);
INSERT INTO `location` VALUES (15,1,'吉林',1);
INSERT INTO `location` VALUES (16,1,'江苏',1);
INSERT INTO `location` VALUES (17,1,'江西',1);
INSERT INTO `location` VALUES (18,1,'辽宁',1);
INSERT INTO `location` VALUES (19,1,'内蒙古',1);
INSERT INTO `location` VALUES (20,1,'宁夏',1);
INSERT INTO `location` VALUES (21,1,'青海',1);
INSERT INTO `location` VALUES (22,1,'山东',1);
INSERT INTO `location` VALUES (23,1,'山西',1);
INSERT INTO `location` VALUES (24,1,'陕西',1);
INSERT INTO `location` VALUES (25,1,'上海',1);
INSERT INTO `location` VALUES (26,1,'四川',1);
INSERT INTO `location` VALUES (27,1,'天津',1);
INSERT INTO `location` VALUES (28,1,'西藏',1);
INSERT INTO `location` VALUES (29,1,'新疆',1);
INSERT INTO `location` VALUES (30,1,'云南',1);
INSERT INTO `location` VALUES (31,1,'浙江',1);
INSERT INTO `location` VALUES (32,1,'重庆',1);
INSERT INTO `location` VALUES (33,1,'香港',1);
INSERT INTO `location` VALUES (34,1,'澳门',1);
INSERT INTO `location` VALUES (35,1,'台湾',1);
INSERT INTO `location` VALUES (35,1,'台湾',1);
INSERT INTO `location`(parent_id,name,type) VALUES (6,'广州',2);
INSERT INTO `location`(parent_id,name,type) VALUES (36,'萝岗区',3);
INSERT INTO `location`(parent_id,name,type) VALUES (37,'万科东荟城',4);

DROP TABLE IF EXISTS `charge_total`;
CREATE TABLE `charge_total` (
  `id` int(10) NOT NULL auto_increment,
  `parkingName` varchar(100) default NULL,
  `date` date default NULL,
  `total` double(255,3) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of charge_total
-- ----------------------------
INSERT INTO `charge_total` VALUES ('1', '加速器A4', '2016-03-15', '2.000');
INSERT INTO `charge_total` VALUES ('2', '加速器A4', '2016-03-16', '3.000');
INSERT INTO `charge_total` VALUES ('3', '加速器A4', '2016-03-17', '4.000');
INSERT INTO `charge_total` VALUES ('4', '加速器B3', '2016-03-15', '5.000');
INSERT INTO `charge_total` VALUES ('5', '加速器B3', '2016-03-16', '3.000');
INSERT INTO `charge_total` VALUES ('6', '加速器B3', '2016-03-17', '4.000');
INSERT INTO `charge_total` VALUES ('7', '万科东荟城C14', '2016-03-15', '4.000');
INSERT INTO `charge_total` VALUES ('8', '万科东荟城C14', '2016-03-16', '6.000');
INSERT INTO `charge_total` VALUES ('9', '万科东荟城C14', '2016-03-17', '6.000');
INSERT INTO `charge_total` VALUES ('10', '万科东荟城A3', '2016-03-15', '5.000');
INSERT INTO `charge_total` VALUES ('11', '万科东荟城A3', '2016-03-16', '5.000');
INSERT INTO `charge_total` VALUES ('12', '万科东荟城A3', '2016-03-17', '4.000');
INSERT INTO `charge_total` VALUES ('13', '彩悦大厦', '2016-03-15', '4.000');
INSERT INTO `charge_total` VALUES ('14', '彩悦大厦', '2016-03-16', '5.000');
INSERT INTO `charge_total` VALUES ('15', '彩悦大厦', '2016-03-17', '3.000');
INSERT INTO `charge_total` VALUES ('16', '彩能小区', '2016-03-15', '2.000');
INSERT INTO `charge_total` VALUES ('17', '彩能小区', '2016-03-16', '2.000');
INSERT INTO `charge_total` VALUES ('18', '彩能小区', '2016-03-17', '1.000');
INSERT INTO `charge_total` VALUES ('19', '龙华地产', '2016-03-15', '3.000');
INSERT INTO `charge_total` VALUES ('20', '龙华地产', '2016-03-16', '3.000');
INSERT INTO `charge_total` VALUES ('21', '龙华地产', '2016-03-17', '7.000');
INSERT INTO `charge_total` VALUES ('22', '万达广场', '2016-03-15', '5.000');
INSERT INTO `charge_total` VALUES ('23', '万达广场', '2016-03-16', '6.000');
INSERT INTO `charge_total` VALUES ('24', '万达广场', '2016-03-17', '5.000');
INSERT INTO `charge_total` VALUES ('25', '高德汇', '2016-03-15', '5.000');
INSERT INTO `charge_total` VALUES ('26', '高德汇', '2016-03-16', '2.000');
INSERT INTO `charge_total` VALUES ('27', '高德汇', '2016-03-17', '4.000');
INSERT INTO `charge_total` VALUES ('28', '高德汇', '2016-03-18', '5.000');
INSERT INTO `charge_total` VALUES ('29', '高德汇', '2016-03-19', '4.000');
INSERT INTO `charge_total` VALUES ('30', '高德汇', '2016-03-18', '3.000');

DROP TABLE IF EXISTS `parkinglot`;
CREATE TABLE `parkinglot` (
  `id` int(2) NOT NULL auto_increment,
  `pid` varchar(30) default NULL,
  `parkingName` varchar(100) default NULL,
  `src` varchar(100) default NULL,
  `msg` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of parkinglot
-- ----------------------------
INSERT INTO `parkinglot` VALUES ('1', '1001', '加速器B3', 'images/1.jpg', '加速器B3，测试用语');
INSERT INTO `parkinglot` VALUES ('2', '1001', '加速器A4', 'images/2.jpg', '加速器A4，测试用语');
INSERT INTO `parkinglot` VALUES ('3', '1002', '万科东荟城C14', 'images/3.jpg', '万科东荟城C14，测试用语');
INSERT INTO `parkinglot` VALUES ('4', '1002', '万科东荟城A3', 'images/4.jpg', '万科东荟城A3，测试用语');
INSERT INTO `parkinglot` VALUES ('5', '1003', '彩悦大厦', 'images/1.jpg', '彩悦大厦，测试用语');
INSERT INTO `parkinglot` VALUES ('6', '1003', '彩能小区', 'images/3.jpg', '彩能小区，测试用语');
INSERT INTO `parkinglot` VALUES ('7', '1001', '龙华地产', 'images/6.jpg', '龙华地产，测试用语');
INSERT INTO `parkinglot` VALUES ('8', '1001', '万达广场', 'images/5.jpg', '万达广场，测试用语');
INSERT INTO `parkinglot` VALUES ('9', '1002', '高德汇', 'images/2.jpg', '高德汇，测试用语');

DROP TABLE IF EXISTS `provinces`;
CREATE TABLE `provinces` (
  `id` int(10) NOT NULL auto_increment,
  `name` varchar(50) default NULL,
  `pid` varchar(100) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of provinces
-- ----------------------------
INSERT INTO `provinces` VALUES ('1', '广东', '1001');
INSERT INTO `provinces` VALUES ('2', '福建', '1002');
INSERT INTO `provinces` VALUES ('3', '浙江', '1003');


DROP TABLE IF EXISTS `time_money`;
CREATE TABLE `time_money` (
  `id` int(10) NOT NULL auto_increment,
  `parkingName` varchar(100) default NULL,
  `date` date default NULL,
  `time00` double(50,3) default NULL,
  `time02` double(50,3) default NULL,
  `time04` double(50,3) default NULL,
  `time06` double(50,3) default NULL,
  `time08` double(50,3) default NULL,
  `time10` double(50,3) default NULL,
  `time12` double(50,3) default NULL,
  `time14` double(50,3) default NULL,
  `time16` double(50,3) default NULL,
  `time18` double(50,3) default NULL,
  `time20` double(50,3) default NULL,
  `time22` double(50,3) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of time_money
-- ----------------------------
INSERT INTO `time_money` VALUES ('1', '加速器B3', '2016-03-15', '1.000', '2.000', '2.000', '2.000', '3.000', '3.000', '3.000', '4.000', '5.000', '5.000', '5.000', '5.000');
INSERT INTO `time_money` VALUES ('2', '加速器B3', '2016-03-16', '1.000', '1.000', '2.000', '3.000', '3.000', '3.000', '4.000', '5.000', '6.000', '7.000', '5.000', '2.000');
INSERT INTO `time_money` VALUES ('3', '加速器B3', '2016-03-17', '1.000', '2.000', '1.000', '2.000', '3.000', '4.000', '1.000', '2.000', '1.000', '3.000', '1.000', '2.000');
INSERT INTO `time_money` VALUES ('4', '加速器A4', '2016-03-15', '4.000', '1.000', '1.000', '5.000', '6.000', '2.000', '3.000', '1.000', '2.000', '3.000', '2.000', '1.000');
INSERT INTO `time_money` VALUES ('5', '加速器A4', '2016-03-16', '4.000', '1.000', '2.000', '3.000', '2.000', '2.000', '1.000', '3.000', '4.000', '5.000', '8.000', '6.000');
INSERT INTO `time_money` VALUES ('6', '加速器A4', '2016-03-17', '4.000', '5.000', '2.000', '3.000', '1.000', '5.000', '8.000', '6.000', '4.000', '2.000', '1.000', '3.000');
INSERT INTO `time_money` VALUES ('7', '万科东荟城C14', '2016-03-15', '2.000', '5.000', '4.000', '8.000', '6.000', '2.000', '3.000', '15.000', '4.000', '5.000', '8.000', '2.000');
INSERT INTO `time_money` VALUES ('8', '万科东荟城C14', '2016-03-16', '5.000', '5.000', '6.000', '1.000', '5.000', '1.000', '3.000', '5.000', '8.000', '4.000', '6.000', '1.000');
INSERT INTO `time_money` VALUES ('9', '万科东荟城C14', '2016-03-17', '2.000', '5.000', '6.000', '8.000', '4.000', '2.000', '1.000', '5.000', '8.000', '4.000', '1.000', '3.000');
INSERT INTO `time_money` VALUES ('10', '万科东荟城A3', '2016-03-15', '2.000', '5.000', '8.000', '4.000', '1.000', '2.000', '3.000', '5.000', '8.000', '4.000', '6.000', '2.000');
INSERT INTO `time_money` VALUES ('11', '万科东荟城A3', '2016-03-16', '5.000', '2.000', '5.000', '8.000', '6.000', '2.000', '1.000', '2.000', '3.000', '5.000', '4.000', '8.000');
INSERT INTO `time_money` VALUES ('12', '万科东荟城A3', '2016-03-17', '5.000', '2.000', '1.000', '3.000', '5.000', '4.000', '8.000', '8.000', '8.000', '5.000', '2.000', '1.000');
INSERT INTO `time_money` VALUES ('13', '彩悦大厦', '2016-03-15', '2.000', '3.000', '5.000', '4.000', '1.000', '2.000', '3.000', '5.000', '6.000', '4.000', '5.000', '6.000');
INSERT INTO `time_money` VALUES ('14', '彩悦大厦', '2016-03-16', '2.000', '5.000', '6.000', '1.000', '5.000', '5.000', '5.000', '2.000', '6.000', '8.000', '4.000', '2.000');
INSERT INTO `time_money` VALUES ('15', '彩悦大厦', '2016-03-17', '2.000', '3.000', '2.000', '2.000', '1.000', '2.000', '1.000', '5.000', '6.000', '5.000', '4.000', '1.000');
INSERT INTO `time_money` VALUES ('16', '彩能小区', '2016-03-15', '2.000', '3.000', '2.000', '1.000', '5.000', '6.000', '4.000', '2.000', '3.000', '2.000', '1.000', '2.000');
INSERT INTO `time_money` VALUES ('17', '彩能小区', '2016-03-16', '2.000', '5.000', '6.000', '2.000', '3.000', '2.000', '1.000', '5.000', '6.000', '5.000', '6.000', '5.000');
INSERT INTO `time_money` VALUES ('18', '彩能小区', '2016-03-17', '2.000', '5.000', '6.000', '2.000', '3.000', '2.000', '1.000', '5.000', '2.000', '3.000', '5.000', '1.000');
INSERT INTO `time_money` VALUES ('19', '龙华地产', '2016-03-15', '3.000', '3.000', '5.000', '5.000', '6.000', '5.000', '2.000', '4.000', '1.000', '5.000', '1.000', '2.000');
INSERT INTO `time_money` VALUES ('20', '龙华地产', '2016-03-16', '2.000', '5.000', '4.000', '8.000', '5.000', '3.000', '2.000', '1.000', '5.000', '1.000', '5.000', '6.000');
INSERT INTO `time_money` VALUES ('21', '龙华地产', '2016-03-17', '2.000', '3.000', '5.000', '4.000', '5.000', '4.000', '1.000', '2.000', '3.000', '5.000', '6.000', '5.000');
INSERT INTO `time_money` VALUES ('22', '万达广场', '2016-03-15', '2.000', '5.000', '6.000', '2.000', '4.000', '5.000', '1.000', '2.000', '3.000', '5.000', '6.000', '2.000');
INSERT INTO `time_money` VALUES ('23', '万达广场', '2016-03-16', '1.000', '11.000', '1.000', '5.000', '3.000', '5.000', '5.000', '6.000', '1.000', '2.000', '3.000', '2.000');
INSERT INTO `time_money` VALUES ('24', '万达广场', '2016-03-17', '1.000', '2.000', '5.000', '6.000', '2.000', '3.000', '2.000', '1.000', '4.000', '5.000', '8.000', '9.000');
INSERT INTO `time_money` VALUES ('25', '高德汇', '2016-03-15', '2.000', '5.000', '4.000', '8.000', '5.000', '6.000', '2.000', '3.000', '1.000', '5.000', '3.000', '2.000');
INSERT INTO `time_money` VALUES ('26', '高德汇', '2016-03-16', '5.000', '4.000', '2.000', '3.000', '5.000', '4.000', '1.000', '2.000', '3.000', '5.000', '6.000', '5.000');
INSERT INTO `time_money` VALUES ('27', '高德汇', '2016-03-17', '5.000', '5.000', '4.000', '1.000', '2.000', '3.000', '5.000', '6.000', '8.000', '4.000', '5.000', '6.000');
INSERT INTO `time_money` VALUES ('28', '高德汇', '2016-03-18', '5.000', '2.000', '3.000', '2.000', '1.000', '4.000', '5.000', '6.000', '5.000', '8.000', '5.000', '6.000');
INSERT INTO `time_money` VALUES ('29', '加速器B3', '2016-03-18', '5.000', '2.000', '5.000', '4.000', '8.000', '9.000', '5.000', '6.000', '4.000', '1.000', '2.000', '3.000');
INSERT INTO `time_money` VALUES ('30', '加速器B3', '2016-03-21', '2.000', '3.000', '4.000', '5.000', '6.000', '7.000', '8.000', '9.000', '9.000', '10.000', '11.000', '12.000');
INSERT INTO `time_money` VALUES ('31', '加速器B3', '2016-03-20', '3.000', '3.000', '4.000', '5.000', '6.000', '5.000', '5.000', '4.000', '5.000', '5.000', '6.000', '7.000');
INSERT INTO `time_money` VALUES ('32', '万科东荟城C14', '2016-03-20', '2.000', '2.000', '5.000', '5.000', '5.000', '5.000', '8.000', '8.000', '9.000', '7.000', '8.000', '9.000');
INSERT INTO `time_money` VALUES ('33', '万科东荟城C14', '2016-03-21', '4.000', '5.000', '6.000', '8.000', '2.000', '3.000', '4.000', '5.000', '8.000', '6.000', '8.000', '5.000');


DROP TABLE IF EXISTS `watchhouse`;
CREATE TABLE `watchhouse` (
  `id` int(10) NOT NULL auto_increment,
  `location` varchar(100) default NULL,
  `leaveTime` time default NULL,
  `stayTime` varchar(100) default NULL,
  `charge` int(10) default NULL,
  `carType` int(2) default NULL COMMENT '卡类型0为临时卡，1为月卡，2为年卡',
  `parkingName` varchar(100) default NULL,
  `name` varchar(100) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of watchhouse
-- ----------------------------
INSERT INTO `watchhouse` VALUES ('1', '西区', '13:57:44', '2小时', '5', '1', '加速器B3', null);
INSERT INTO `watchhouse` VALUES ('2', '南区', '16:58:41', '1小时', '2', '0', '加速器B3', null);
INSERT INTO `watchhouse` VALUES ('3', '东区', '13:59:13', '5小时', '10', '1', '加速器B3', null);
INSERT INTO `watchhouse` VALUES ('4', '西区', '09:59:57', '3小时', '7', '1', '加速器A4', null);
INSERT INTO `watchhouse` VALUES ('5', '东区', '12:00:58', '5小时', '10', '1', '加速器A4', null);
INSERT INTO `watchhouse` VALUES ('6', '前门', '14:01:28', '1小时', '2', '0', '万科东荟城C14', null);
INSERT INTO `watchhouse` VALUES ('7', '后门', '15:02:00', '3小时', '7', '1', '万科东荟城C14', null);
INSERT INTO `watchhouse` VALUES ('8', '前门', '14:02:34', '12小时', '20', '2', '万科东荟城A3', null);
INSERT INTO `watchhouse` VALUES ('9', '后门', '19:03:04', '5小时', '10', '2', '万科东荟城A3', null);
INSERT INTO `watchhouse` VALUES ('10', '前门', '14:03:31', '3小时', '7', '1', '彩悦大厦', null);
INSERT INTO `watchhouse` VALUES ('11', '后门', '15:03:57', '1小时', '2', '0', '彩悦大厦', null);
INSERT INTO `watchhouse` VALUES ('12', '前门', '14:04:29', '3小时', '7', '2', '彩能小区', null);
INSERT INTO `watchhouse` VALUES ('13', '后门', '14:04:53', '1小时', '2', '0', '彩能小区', null);
INSERT INTO `watchhouse` VALUES ('14', '前门', '14:05:21', '24小时', '25', '2', '龙华地产', null);
INSERT INTO `watchhouse` VALUES ('15', '后门', '00:05:56', '3小时', '7', '1', '龙华地产', null);
INSERT INTO `watchhouse` VALUES ('16', '前门', '12:06:22', '2小时', '5', '1', '万达广场', null);
INSERT INTO `watchhouse` VALUES ('17', '后门', '17:06:50', '3小时', '7', '1', '万达广场', null);
INSERT INTO `watchhouse` VALUES ('18', '前门', '14:07:38', '5小时', '10', '1', '高德汇', null);
INSERT INTO `watchhouse` VALUES ('19', '后门', '15:07:41', '3小时', '7', '1', '高德汇', null);


DROP TABLE IF EXISTS `park`;
CREATE TABLE `park` (
  `id` int(10) NOT NULL auto_increment,
  `companyID` int default NULL,
  `parkID` int default NULL,
  `desc` varchar(200),
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into park values(1,17,325,'汉王测试车场2');
insert into park values(2,17,368,'汉王测试车场1');
insert into park values(3,17,387,'汉王测试车场0');
