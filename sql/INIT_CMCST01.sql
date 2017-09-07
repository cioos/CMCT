DROP DATABASE wcst;

CREATE DATABASE wcst;

USE wcst ;

DROP TABLE IF EXISTS emp ;
/*DROP TABLE IF EXISTS admingroupauth;
DROP TABLE IF EXISTS admin ;
DROP TABLE IF EXISTS admingroup ;
DROP TABLE IF EXISTS authenticationaction;
DROP TABLE IF EXISTS member;
DROP TABLE IF EXISTS areaplus;
DROP TABLE IF EXISTS area;
DROP TABLE IF EXISTS catalogplus;
DROP TABLE IF EXISTS catalog;
DROP TABLE IF EXISTS delivery;
DROP TABLE IF EXISTS memberlevel;
DROP TABLE IF EXISTS news;
DROP TABLE IF EXISTS pevaluate;
DROP TABLE IF EXISTS pay;
DROP TABLE IF EXISTS porderline;
DROP TABLE IF EXISTS porder;
DROP TABLE IF EXISTS product;	
DROP TABLE IF EXISTS productgroup;
DROP TABLE IF EXISTS productgroupmap;	

*/
/*==============================================================*/
/* Table: tbl_emp    管理员组                                */
/*==============================================================*/
create table emp
(
   empno                          int    AUTO_INCREMENT    not null,
   ename                           varchar(45)                    default NULL,
   description                     varchar(200)                   default NULL,
   job                             varchar(45)                    default NULL;
   hiredate                        dateime()                       default NULL;
   sal double 
	private Double sal ;
	private Double comm ;
	private Emp mgr ;
	private Dept dept ;
	
   primary key (empno)
) ;
/*
/*==============================================================*/
/* Table: admingroup    管理员组                                */
/*==============================================================*/
create table admingroup
(
   adgid                          int    AUTO_INCREMENT    not null,
   name                           varchar(45)                    default NULL,
   description                    varchar(200)                   default NULL,
   primary key (adgid)
) ;

/*==============================================================*/
/* Table: authenticationaction   权限                           */
/*==============================================================*/
create table authenticationaction
(
   ataid                          int               not null AUTO_INCREMENT,
   description                    varchar(255)                   default NULL,
   url				  varchar(255)	    ,
   primary key (ataid)
) ;


/*==============================================================*/
/* Table: admin     管理员                                      */
/*==============================================================*/
create table admin
(
   account                        varchar(45)                   primary key,
   pwd                            varchar(45)                    not null,
   lastlogindate                datetime                       not null,
   postdate                      datetime                       not null,
   adgid                          int                    not null,
   foreign key (adgid) references admingroup (adgid) on delete cascade
) ;




/*==============================================================*/
/* Table: admingroupauth       中间表                           */
/*==============================================================*/
create table admingroupauth
(
   adgid                          int               not null default 0,
   ataid                          int               not null default 0,
   primary key (adgid, ataid),
   foreign key (adgid) references admingroup (adgid) on delete cascade,
   foreign key (ataid) references authenticationaction (ataid) on delete cascade
) ;



/*==============================================================*/
/* Table: area          省份表                                  */
/*==============================================================*/
create table area
(
   id                             int AUTO_INCREMENT PRIMARY KEY NOT NULL,
   title                          varchar(100)     NOT NULL
) ;


/*==============================================================*/
/* Table: areaplus      城市表                                  */
/*==============================================================*/
CREATE TABLE areaplus (
  id     INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  upid	 INT NOT NULL,
  title varchar(100) default NULL ,
  foreign key (upid) references area (id) on delete cascade
) ;

/*==============================================================*/
/* Table: member            用户表                              */
/*==============================================================*/
CREATE TABLE member (
  account varchar(45) primary key ,
  pwd varchar(45) NOT NULL default '',
  email varchar(45) NOT NULL default '',
  name varchar(45) default NULL,
  sex VARCHAR(2) ,
  province int ,
  address varchar(200) default NULL,
  postcode varchar(45) default NULL,
  mobile varchar(45) default NULL,
  tel varchar(45) default NULL,
  postdate datetime default NULL,
  lastlogindate datetime default '1900-01-01 00:00:00',
  points int default '0',
  city int ,
  foreign key (province) references area (id) ,
  foreign key (city) references areaplus (id) 
) ;

/*==============================================================*/
/* Table: catalog       货架表                                  */
/*==============================================================*/
CREATE TABLE catalog (
  id int AUTO_INCREMENT PRIMARY KEY NOT NULL ,
  title varchar(100) default NULL,
  img varchar(100) default NULL,
  description varchar(255) default NULL
) ;


/*==============================================================*/
/* Table: catalogplus    子货架表                               */
/*==============================================================*/
CREATE TABLE catalogplus (
  id int AUTO_INCREMENT PRIMARY KEY NOT NULL,
  upid int NOT NULL ,
  title varchar(100) default NULL,
  foreign key (upid) references catalog (id) on delete cascade
) ;


/*==============================================================*/
/* Table: delivery     邮递方式表                               */
/*==============================================================*/
create table delivery
(
   drid                           int  AUTO_INCREMENT PRIMARY KEY NOT NULL,
   name                           varchar(45)                    default NULL,
   cost                           decimal(10,2)          default NULL,
   description                    varchar(255)                   default NULL
) ;

/*==============================================================*/
/* Table: pay         支付方式表                                */
/*==============================================================*/
CREATE TABLE pay (
  pyid int AUTO_INCREMENT PRIMARY KEY NOT NULL ,
  name varchar(45) default NULL,
  costpercent decimal(10,3) default NULL,
  description text,
  bankaccount varchar(45) default NULL,
  appendinfo varchar(255) default NULL
) ;


/*==============================================================*/
/* Table: news               新闻表                             */
/*==============================================================*/
CREATE TABLE news (
  nid int AUTO_INCREMENT PRIMARY KEY NOT NULL,
  title varchar(255) default NULL,
  content text,
  keyw varchar(200) default NULL,
  postdate datetime default NULL
) ;

/*==============================================================*/
/* Table: member_level        用户级别表                        */
/*==============================================================*/
CREATE TABLE memberlevel (
  mlid int AUTO_INCREMENT PRIMARY KEY NOT NULL,
  stp int NOT NULL,		
  enp int NOT NULL,		
  levelname varchar(100) NOT NULL default '',
  discount decimal(10,3)  NOT NULL default '1.000'
) ;


/*==============================================================*/
/* Table: product           商品表                              */
/*==============================================================*/
CREATE TABLE product (
  pid int AUTO_INCREMENT PRIMARY KEY NOT NULL,
  cid int NOT NULL default '0',
  name varchar(50) default NULL,
  shortdesc varchar(255) default NULL,
  detaildesc text,
  keywords varchar(30) default NULL,
  click int  default '0',
  buys int  default '0',
  alive int default '1',
  imgb varchar(50) default NULL,
  imgs varchar(50) default NULL,
  marketprice decimal(10,2)  default NULL,
  shopprice decimal(10,2)  default NULL,
  star int default '0',
  postdate datetime default NULL,
  starp int  default '0',
  foreign key (cid) references catalogplus (id) 
) ;

/*==============================================================*/
/* Table: productgroup    商品组表                              */
/*==============================================================*/
CREATE TABLE productgroup (
  pgid int AUTO_INCREMENT PRIMARY KEY NOT NULL,
  title varchar(50) NOT NULL default ''
) ;

/*==============================================================*/
/* Table: productgroupmap    中间表                             */
/*==============================================================*/
CREATE TABLE productgroupmap (
  pgid int NOT NULL,
  pid int NOT NULL,
  primary key (pgid,pid) ,
  foreign key (pid) references product (pid) on delete cascade ,
  foreign key (pgid) references productgroup (pgid) on delete cascade
) ;

/*==============================================================*/
/* Table: porder        定单表                                  */
/*==============================================================*/
CREATE TABLE porder (
  oid int AUTO_INCREMENT PRIMARY KEY NOT NULL ,
  sumprice decimal(10,2)  default '0.00',
  actualpay decimal(10,2)  default NULL,
 account varchar(50) default null,
  email varchar(45) default NULL,
  province int default '0',
  name varchar(45) default NULL,
  address varchar(200) default NULL,
  postcode varchar(45) default NULL,
  tel varchar(45) default NULL,
  mobile varchar(45) default NULL,
  note varchar(255) default NULL,
  postdate datetime default NULL,
  paytype int default NULL,
  paytypecostpercent decimal(10,3)  default NULL,
  deliveryno int default NULL,
  deltypecost decimal(10,2)  default NULL,
  handlestatus int default '0',
  handlenote varchar(255) default NULL,
  deliverytype varchar(100) default NULL,
  payappendinfo varchar(200) default NULL,
  city int default NULL,
  provincename varchar(45) default NULL,
  cityname varchar(45) default NULL
) ;


/*==============================================================*/
/* Table: porderline          定单明晰表                        */
/*==============================================================*/
CREATE TABLE porderline (
  polid int AUTO_INCREMENT PRIMARY KEY NOT NULL ,
  oid int NOT NULL,
  pid int NOT NULL,
  pcid int default '0',	
  pctitle varchar(45) default NULL,
  cid int default '0',
  ctitle varchar(45) default NULL,
  quantity int default '0',
  shopprice decimal(10,2) default '0.00',
  name varchar(45) default NULL,
  amount decimal(10,2) default '0.00',
  foreign key (oid) references porder (oid) on delete cascade 
) ;

/*==============================================================*/
/* Table: pevaluate         商品评论表                          */
/*==============================================================*/
CREATE TABLE pevaluate (
  peid int AUTO_INCREMENT PRIMARY KEY NOT NULL,
  pid int  NOT NULL default '0',
  author varchar(45) NOT NULL default '',
  content varchar(255) NOT NULL default '',
  star int  NOT NULL default '0',
  postdate datetime NOT NULL default '0000-00-00 00:00:00',
  feedback varchar(255) NOT NULL default '',
  foreign key (pid) references product (pid) on delete cascade 
) ;

-- 测试数据

INSERT INTO admingroup (name,description) VALUES ('超级管理员','描述');
INSERT INTO admingroup (name,description) VALUES ('普通管理员','描述2');


INSERT INTO `authenticationaction` VALUES 
(1,'发布商品','/admin/product.do?status=insertpre'),
(2,'商品管理','/admin/product.do?status=list'),
(3,'商品群组',NULL),(4,'评论管理','/admin/pevaluate.do?status=list'),
(5,'货架管理','/admin/catalog.do?status=list'),
(6,'订单管理','/admin/order!list.action'),
(7,'支付管理','/admin/pay!list.action'),
(8,'配送管理','/admin/delivery!list.action'),
(9,'会员管理','/admin/member!list.action'),
(10,'级别管理',NULL),(11,'地区管理',NULL),
(12,'发布新闻','/admin/news/news_insert.jsp'),
(13,'新闻管理','/admin/news.do?status=list'),
(14,'账号管理','/admin/admin!list.action'),
(15,'权限管理','/admin/group!list.action');

INSERT INTO admin (account,pwd,lastlogindate,postdate,adgid) VALUES 
 ('admin','21232F297A57A5A743894A0E4A801FC3','2006-08-10 17:32:50','2006-07-22 14:04:23',1);

INSERT INTO admin (account,pwd,lastlogindate,postdate,adgid) VALUES 
 ('admin2','21232F297A57A5A743894A0E4A801FC3','2006-08-10 17:32:50','2006-07-22 14:04:23',2);

INSERT INTO admingroupauth (adgid,ataid) VALUES 
 (1,1), (1,2), (1,3), (1,4), (1,5),
 (1,6), (1,7), (1,8), (1,9), (1,10),
 (1,11), (1,12), (1,13), (1,14), (1,15);

INSERT INTO admingroupauth (adgid,ataid) VALUES 
 (2,1),  (2,3), (2,4),(2,6), (2,7), (2,8), (2,9),(2,12), (2,14), (2,15);

INSERT INTO area (title) VALUES 
 ('其他'), ('北京'), ('重庆'), ('福建'), ('甘肃'), ('广东'),
 ('广西'), ('贵州'), ('海南'), ('河北'), ('黑龙江'), ('河南'),
 ('香港'), ('湖北'), ('湖南'), ('江苏'), ('江西'), ('吉林'),
 ('辽宁'), ('澳门'), ('内蒙古'), ('宁夏'), ('青海'), ('山东'),
 ('上海'), ('山西'), ('陕西'), ('四川'), ('台湾'), ('天津'),
 ('新疆'), ('西藏'), ('云南'), ('浙江'), ('安徽');

INSERT INTO areaplus (upid,title) VALUES 
 (1,'其他'),(35,'合肥'), (35,'安庆'), (35,'蚌埠'), (35,'亳州'), (35,'巢湖'), (35,'滁州'),
 (35,'阜阳'), (35,'贵池'), (35,'淮北'), (35,'淮化'), (35,'淮南'), (35,'黄山'),
 (35,'九华山'), (35,'六安'), (35,'马鞍山'), (35,'宿州'), (35,'铜陵'), (35,'屯溪'),
 (35,'芜湖'), (35,'宣城'), (2,'北京'), (3,'重庆'), (4,'福州'), (4,'福安'),
 (4,'龙岩'), (4,'南平'), (4,'宁德'), (4,'莆田'), (4,'泉州'), (4,'三明'),
 (4,'邵武'), (4,'石狮'), (4,'永安'), (4,'武夷山'), (4,'厦门'), (4,'漳州'),
 (5,'兰州'), (5,'白银'), (5,'定西'), (5,'敦煌'), (5,'甘南'), (5,'金昌');

INSERT INTO areaplus (upid,title) VALUES 
 (5,'酒泉'), (5,'临夏'), (5,'平凉'), (5,'天水'), (5,'武都'), (5,'武威'),
 (5,'西峰'), (5,'张掖'), (6,'广州'), (6,'潮阳'), (6,'潮州'), (6,'澄海'),
 (6,'东莞'), (6,'佛山'), (6,'河源'), (6,'惠州'), (6,'江门'), (6,'揭阳'),
 (6,'开平'), (6,'茂名'), (6,'梅州'), (6,'清远'), (6,'汕头'), (6,'汕尾'),
 (6,'韶关'), (6,'深圳'), (6,'顺德'), (6,'阳江'), (6,'英德'), (6,'云浮'),
 (6,'增城'), (6,'湛江'), (6,'肇庆'), (6,'中山'), (6,'珠海'), (7,'南宁');

INSERT INTO areaplus (upid,title) VALUES 
 (7,'百色'), (7,'北海'), (7,'桂林'), (7,'防城港'), (7,'河池'), (7,'贺州'),
 (7,'柳州'), (7,'钦州'), (7,'梧州'), (7,'玉林'), (8,'贵阳'), (8,'安顺'),
 (8,'毕节'), (8,'都匀'), (8,'凯里'), (8,'六盘水'), (8,'铜仁'), (8,'兴义'),
 (8,'玉屏'), (8,'遵义'), (9,'海口'), (9,'儋县'), (9,'陵水'), (9,'琼海'),
 (9,'三亚'), (9,'五指山'), (9,'万宁'), (10,'石家庄'), (10,'保定'), (10,'北戴河'),
 (10,'沧州'), (10,'承德'), (10,'丰润'), (10,'邯郸'), (10,'衡水'), (10,'廊坊');

INSERT INTO areaplus (upid,title) VALUES 
 (10,'南戴河'), (10,'秦皇岛'), (10,'唐山'), (10,'新城'), (10,'邢台'), (10,'张家口'),
 (11,'哈尔滨'), (11,'北安'), (11,'大庆'), (11,'大兴安岭'), (11,'鹤岗'), (11,'黑河'),
 (11,'佳木斯'), (11,'鸡西'), (11,'牡丹江'), (11,'齐齐哈尔'), (11,'七台河'), (11,'双鸭山'),
 (11,'绥化'), (11,'伊春'), (12,'郑州'), (12,'安阳'), (12,'鹤壁'), (12,'潢川'),
 (12,'焦作'), (12,'济源'), (12,'开封'), (12,'漯河'), (12,'洛阳'), (12,'南阳'), (12,'平顶山'),
 (12,'濮阳'), (12,'三门峡'), (12,'商丘'), (12,'新乡');

INSERT INTO areaplus (upid,title) VALUES 
 (12,'信阳'), (12,'许昌'), (12,'周口'), (12,'驻马店'), (13,'香港'), (13,'九龙'),
 (13,'新界'), (14,'武汉'), (14,'恩施'), (14,'鄂州'), (14,'黄冈'), (14,'黄石'),
 (14,'荆门'), (14,'荆州'), (14,'潜江'), (14,'十堰'), (14,'随州'), (14,'武穴'), (14,'仙桃'),
 (14,'咸宁'), (14,'襄阳'), (14,'襄樊'), (14,'孝感'), (14,'宜昌'), (15,'长沙'), (15,'常德'),
 (15,'郴州'), (15,'衡阳'), (15,'怀化'), (15,'吉首'), (15,'娄底'), (15,'邵阳'), (15,'湘潭'),
 (15,'益阳'), (15,'岳阳'), (15,'永州');

INSERT INTO areaplus (upid,title) VALUES 
 (15,'张家界'), (15,'株洲'), (16,'南京'), (16,'常熟'), (16,'常州'), (16,'海门'),
 (16,'淮安'), (16,'江都'), (16,'江阴'), (16,'昆山'), (16,'连云港'), (16,'南通'),
 (16,'启东'), (16,'沭阳'), (16,'宿迁'), (16,'苏州'), (16,'太仓'), (16,'泰州'),
 (16,'同里'), (16,'无锡'), (16,'徐州'), (16,'盐城'), (16,'扬州'), (16,'宜兴'),
 (16,'仪征'), (16,'张家港'), (16,'镇江'), (16,'周庄'), (17,'南昌'), (17,'抚州'),
 (17,'赣州'), (17,'吉安'), (17,'景德镇'), (17,'井冈山'), (17,'九江'), (17,'庐山');

INSERT INTO areaplus (upid,title) VALUES 
 (17,'萍乡'), (17,'上饶'), (17,'新余'), (17,'宜春'), (17,'鹰潭'), (18,'长春'),
 (18,'白城'), (18,'白山'), (18,'珲春'), (18,'辽源'), (18,'梅河'), (18,'吉林'),
 (18,'四平'), (18,'松原'), (18,'通化'), (18,'延吉'), (19,'沈阳'), (19,'鞍山'),
 (19,'本溪'), (19,'朝阳'), (19,'大连'), (19,'丹东'), (19,'抚顺'), (19,'阜新'),
 (19,'葫芦岛'), (19,'锦州'), (19,'辽阳'), (19,'盘锦'), (19,'铁岭'), (19,'营口'),
 (20,'澳门'), (21,'呼和浩特'), (21,'阿拉善盟'), (21,'包头'), (21,'赤峰'), (21,'东胜');

INSERT INTO areaplus (upid,title) VALUES 
 (21,'海拉尔'), (21,'集宁'), (21,'临河'), (21,'通辽'), (21,'乌海'), (21,'乌兰浩特'),
 (21,'锡林浩特'), (22,'银川'), (22,'固原'), (22,'石嘴山'), (22,'吴忠'), (23,'西宁'),
 (23,'德令哈'), (23,'格尔木'), (23,'共和'), (23,'海东'), (23,'海晏'), (23,'玛沁'),
 (23,'同仁'), (23,'玉树'), (24,'济南'), (24,'滨州'), (24,'兖州'), (24,'德州'),
 (24,'东营'), (24,'菏泽'), (24,'济宁'), (24,'莱芜'), (24,'聊城'), (24,'临沂'),
 (24,'蓬莱'), (24,'青岛'), (24,'曲阜'), (24,'日照'), (24,'泰安');

INSERT INTO areaplus (upid,title) VALUES 
 (24,'潍坊'), (24,'威海'), (24,'烟台'), (24,'枣庄'), (24,'淄博'), (25,'上海'),
 (25,'崇明'), (25,'朱家角'), (26,'太原'), (26,'长治'), (26,'大同'), (26,'候马'),
 (26,'晋城'), (26,'离石'), (26,'临汾'), (26,'宁武'), (26,'朔州'), (26,'忻州'),
 (26,'阳泉'), (26,'榆次'), (26,'运城'), (27,'西安'), (27,'安康'), (27,'宝鸡'),
 (27,'汉中'), (27,'渭南'), (27,'商州'), (27,'绥德'), (27,'铜川'), (27,'咸阳'),
 (27,'延安'), (27,'榆林'), (28,'成都'), (28,'巴中'), (28,'达州'), (28,'德阳');

INSERT INTO areaplus (upid,title) VALUES 
 (28,'都江堰'), (28,'峨眉山'), (28,'涪陵'), (28,'广安'), (28,'广元'), (28,'九寨沟'),
 (28,'康定'), (28,'乐山'), (28,'泸州'), (28,'马尔康'), (28,'绵阳'), (28,'眉山'),
 (28,'南充'), (28,'内江'), (28,'攀枝花'), (28,'遂宁'), (28,'汶川'), (28,'西昌'),
 (28,'雅安'), (28,'宜宾'), (28,'自贡'), (28,'资阳'), (29,'台北'), (29,'基隆'),
 (29,'台南'), (29,'台中'), (30,'天津'), (31,'乌鲁木齐'), (31,'阿克苏'), (31,'阿勒泰'),
 (31,'阿图什'), (31,'博乐'), (31,'昌吉'), (31,'东山'), (31,'哈密');

INSERT INTO areaplus (upid,title) VALUES 
 (31,'和田'), (31,'喀什'), (31,'克拉玛依'), (31,'库车'), (31,'库尔勒'), (31,'奎屯'),
 (31,'石河子'), (31,'塔城'), (31,'吐鲁番'), (31,'伊宁'), (32,'拉萨'), (32,'阿里'),
 (32,'昌都'), (32,'林芝'), (32,'那曲'), (32,'日喀则'), (32,'山南'), (33,'昆明'),
 (33,'大理'), (33,'保山'), (33,'楚雄'), (33,'东川'), (33,'个旧'),
 (33,'景洪'), (33,'开远'), (33,'临沧'), (33,'丽江'), (33,'六库'), (33,'潞西'),
 (33,'曲靖'), (33,'思茅'), (33,'文山'), (33,'西双版纳'), (33,'玉溪');

INSERT INTO areaplus (upid,title) VALUES 
 (33,'中甸'), (33,'昭通'), (34,'杭州'), (34,'安吉'), (34,'慈溪'), (34,'定海'),
 (34,'奉化'), (34,'海盐'), (34,'黄岩'), (34,'湖州'), (34,'嘉兴'), (34,'金华'),
 (34,'临安'), (34,'临海'), (34,'丽水'), (34,'宁波'), (34,'瓯海'), (34,'平湖'),
 (34,'千岛湖'), (34,'衢州'), (34,'江山'), (34,'瑞安'), (34,'绍兴'), (34,'嵊州'),
 (34,'台州'), (34,'温岭'), (34,'温州'), (34,'舟山') ;

INSERT INTO catalog (title,img,description) VALUES 
 ('电脑、软件、网络','11540709315040.jpg','各种品牌笔记本电脑全线大优惠'),
 ('MP3、MP4、音响','11540722111920.gif','各种时尚、高档MP3、MP3'),
 ('手机、通讯设备、卡','11540721784890.gif','手机 CDMA 智能 充值 配件 小灵通 蓝牙 诺基亚 三星 索爱 MOTO 拍卖'),
 ('数码相机、摄影摄像','11540708454570.gif','走过路过千万别错过，各种品牌液晶大优惠'),
 ('珠宝首饰、手表、眼镜','11540708241600.jpg','HIFI音响 纽曼 CD MD 一元 99元 199元 森海塞尔'),
 ('彩妆、香水、护肤','11540708010040.gif','佳能 索尼 尼康 三星 配件 闪存卡 数码相机 数码单反 DV 镜头 读卡器'),
 ('女装、女士精品','11540707778790.gif','银饰 韩国 水晶 外贸原单 Swatch 施华洛世奇 名表 发夹 项链 钻石'),
 ('男装、服饰配件','11540707582540.gif','ZIPPO 打火机 瑞士军刀 刀具 男包 饰品 烟具 烟斗 酒具 配件 剃须刀'),
 ('网络游戏虚拟商品','11540707403320.gif','杂志 小说 瑞丽 外语 考研 求职'),
 ('音乐、影视、明星、娱乐','11540707172390.gif','这是一个美得上帝也要叹息的地方!它被浓阴华盖遮蔽，恬静、怡然，没有一丝尘世的喧嚣');

INSERT INTO catalogplus (upid,title) VALUES 
 (1,'硬件'), (1,'全新笔记本'), (1,'二手笔记本'), (1,'PDA'), (1,'笔记本配件'),
 (1,'电脑周边'), (1,'网络服务'), (3,'手机'), (3,'CDMA'), (3,'配件'),
 (3,'小灵通'), (2,'便携视听'), (2,'HIFI音响'), (2,'电脑音箱'), (4,'数码相机'),
 (4,'数码单反'), (4,'专业相机'), (4,'DV'), (5,'银饰'), (5,'韩国'), (5,'水晶'),
 (5,'外贸'), (6,'丰胸'), (6,'Swarovski'), (6,'减肥'), (6,'护肤'), (6,'香水'),
 (6,'面膜'), (6,'雅芳'), (7,'吊带衫'), (7,'背心'), (7,'针织衫'), (7,'毛衣'),
 (7,'衬衫'), (7,'T恤'), (8,'毛衣'), (8,'线衫'), (8,'外套'), (8,'帽衫'),
 (8,'西装'), (8,'风衣'), (9,'梦幻/大话'), (9,'魔兽'), (9,'QQ 点卡'), (9,'装备'),
 (9,'帐号'), (10,'韩剧'), (10,'明星'), (10,'演唱会'), (10,'音乐CD'), (10,'电影DVD');


INSERT INTO delivery (name,cost,description) VALUES 
 ('EMS','15.00','邮政EMS'),
 ('申通快递','10.00','申通快递'),
 ('普通平邮','5.00','邮政普通平邮'),
 ('圆通快递','8.00','还行的快递公司');

INSERT INTO memberlevel (stp,enp,levelname,discount) VALUES 
 (0,1000,'普通客户','1.000'),
 (1000,2000,'VIP客户','0.900'),
 (2000,555555,'钻石客户','0.850'),
 (555555,999999,'批发商家','0.700'),
 (999999,9999999,'成本价格','0.500');

INSERT INTO news (title,content,keyw,postdate) VALUES 
 ('放心购物在当当网联营店','放心购物在当当网联营店','网联营店','2006-07-06 07:46:52'),
 ('当当网联营店：先行赔付','当当网联营店：先行赔付<BR>','先行赔付','2006-07-06 08:16:48'),
 ('贴心保障：假一赔一','贴心保障：假一赔一','假一赔一','2006-07-06 08:17:03'),
 ('买贵了:双倍礼券赔付','买贵了:双倍礼券赔付<BR>','礼券','2006-07-06 08:17:22'),
 ('服务提速:4小时专递','服务提速:4小时专递','专递','2006-07-06 08:18:50'),
 ('购物无忧：24小时服务','购物无忧：24小时服务','24小时服务','2006-07-06 08:19:07'),
 ('购物满99元免运费','购物满99元免运费','购物满99元免运费','2006-07-06 08:19:17'),
 ('浦发卡网上支付优惠说明!','优惠说明','浦发卡网上支付优惠说明','2006-07-06 08:19:26'),
 ('常见问题','常见问题','常见问题','2006-07-06 16:46:32'),
 ('安全交易','本网站采取了各种措施以确保您进行购物等活动的安全性，我们采用了SSL（安全套层）协议加密技术，可以有效地防止信息在传送中出现丢失，盗用或被篡改等情况。同时，我们采用网上屏蔽技术以保护信用卡资料的传输。您可放心地在网上购买商品，享受网上购物的乐趣。 ','安全交易','2006-07-06 16:47:24'),
 ('关于我们','&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 鲜花网是专业从事全国鲜花速递的网站,秉承着<FONT color=#ff0000>“新鲜花材、专业花艺、热诚服务、郑重承诺”</FONT>的快乐原则，保持着网站流畅、易操作、页面简洁时尚等优点，渐渐得到了“快乐会员”们的赞赏和厚爱。 <P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Ever鲜花成立了网络部在全国拥有鲜花设计部、采购部、配送部同时实现了全国范围内配送和网上支付，使得订花者轻松自如就能及时地陪送到收花者手中，而且享受与商城购物同样便捷和安全保障。自建网以来快乐发展迅速，您对亲朋好友的情和意，我们在3小时内就可以为您传递；花卉设计人员通过专门教育实践和引进台湾、韩国、日本等设计风格，每年开发研究新品牌来迎合不同顾客的要求，而且对于不同需求，我们还提供了多种不同艺术造型、具有鲜明个性、适宜不同场合、赠送不同亲朋好友的鲜花作品和多种时尚礼品供您选择定购。&nbsp;</P><P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<STRONG><FONT color=#ff0080 size=2>选择鲜花，给情人一个最意外的惊喜！</FONT></STRONG></P>','关于我们','2006-07-06 16:50:00'),
 ('病后再度公开露面邵逸夫赏港姐','a','aaa','2006-08-14 03:54:28'),
 ('你买丰田车将会付出“色狼费”丰田赔女秘','bbbb','bb','2006-08-14 03:54:33'),
 ('证监会重掌红筹监管权','ccccc','ccccc','2006-08-14 03:54:39'),
 ('数百亿温州“民资”回撤清晰','ddddddddddd','dddddd','2006-08-14 03:54:47'),
 ('联想年金引发企业年金冲动从','eeeee','eeeee','2006-08-14 03:54:52'),
 ('Google中国耍流氓？','fffff','fffff','2006-08-14 03:54:57'),
 ('大陆省市亿万富翁户数排行','gggggggg','gggggggggg','2006-08-14 03:55:03'),
 ('中国热点城市房价与收入比为12:1','hhhhhhhhhhh','hhhh','2006-08-14 03:55:10'),
 ('基尼系数不打\"国情折扣\"又当如何?','s','ss','2006-08-14 04:08:02'),
 ('加工业是中国高储蓄的制造者 刺激消费难题待解','s','s','2006-08-14 04:08:10'),
 ('姚明应住豪华套房的N个理由','s','d','2006-08-14 04:08:22');

INSERT INTO pay (name,costpercent,description,bankaccount,appendinfo) VALUES 
 ('<font color=blue>支付宝</font>','0.000','支付宝','ciooskf@163.com',NULL),
 ('<font color=red>网银在线</font>','0.015','网银在线','53973',''),
 ('PayPal(贝宝)','0.000','全球领先的在线支付','ciooshr@163.com',''),
 ('银行转帐','0.000','名称：张先生开户行：工商银行 　　　帐号：9558 8040 0012 88888888\r\n\r\n名称：张先生 \r\n开户行： 招商银行 　   帐号：6225 8875 5780 88888888\r\n\r\n名称：张先生 \r\n开户行： 中国银行 　   帐号：4055 1256 3102 88888888\r\n\r\n特别提醒：1. 请在电汇用途中注明您的订单号和会员名\r\n　　　　　2. 请您电汇时尽量保证汇款人名称和订单收货人名称一致！','','工商银行\r\n招商银行\r\n中国银行'),
 ('邮局汇款','0.000','名称：张先生\r\n地址：深圳深南大道888号　 邮政编码：888888 \r\n\r\n特别提醒：\r\n1. 请在汇款单背面附言中注明您的订单号和用户名\r\n2. 请您邮汇时尽量保证汇款人名称和订单收货人名称一致！','',''),
 ('货到附款','0.000','当收到货物后直接附款','','');

INSERT INTO productgroup (title) VALUES 
 ('省10元'), ('精品推荐'), ('特价'), ('特别推荐'),
 ('购物车推荐商品'), ('本周热卖');

*/