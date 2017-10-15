---------------------------------------表结构----------------------------------------------
-- 商品表
create table T_MC
(
  MCID        NUMBER primary key,
  MCNAME      VARCHAR2(20),
  MCDECX      VARCHAR2(1024),
  PRICE       NUMBER(11,2),
  PIC         VARCHAR2(500),
  FLAG        CHAR(1),
  SMALLTYPEID NUMBER,
  CREATEDATE  DATE,
  QUANTITY    NUMBER
);

-- 商品类别表
create table T_MCTYPE
(
  TYPEID   NUMBER primary key,
  TYPENAME VARCHAR2(50),
  FATHERID NUMBER
);

-- 前台用户表
create table T_USER
(
  USERID     NUMBER primary key,
  USERNAME   VARCHAR2(20),
  PASSWORD   VARCHAR2(20),
  TRUENAME   VARCHAR2(20),
  USERSEX    CHAR(1),
  BIRTHDAY   DATE,
  EMAIL      VARCHAR2(50),
  PHONENO    VARCHAR2(20),
  POSTCADE   VARCHAR2(20),
  ADDRESS    VARCHAR2(1024),
  REGDATE    DATE,
  LOCKSTATE  CHAR(1),
  LASTACCESS DATE,
  LOGIN      NUMBER
);

-- 订单表
create table T_ORDERS
(
  ORDERID      VARCHAR2(20) primary key,
  USERID       NUMBER,
  QUANTITY     NUMBER,
  ALLTYPE      NUMBER,
  TOTALPRICE   NUMBER(11,2),
  PAYTYPE      VARCHAR2(20),
  RECEIVEDTYPE VARCHAR2(20),
  USERNAME     VARCHAR2(20),
  ADDRESS      VARCHAR2(500),
  POSTCODE     VARCHAR2(20),
  PHONENO      VARCHAR2(20),
  EMAIL        VARCHAR2(20),
  ORDERDATE    DATE,
  STATUS       CHAR(1),
  APPROVEDUSER VARCHAR2(20),
  APPROVEDDATE DATE,
  MSG          VARCHAR2(1024)
);

-- 订单详情表
create table T_ORDERDETAIL
(
  DETAILID NUMBER primary key,
  ORDERID  VARCHAR2(20),
  MCID     NUMBER,
  BUYNUM   NUMBER
);
-- 后台管理员表
create table T_MANAGER
(
  MID       NUMBER(5) primary key,
  MUSERNAME VARCHAR2(20),
  MPASSWORD VARCHAR2(20),
  MTRUENAME VARCHAR2(20),
  MSEX      VARCHAR2(4),
  MLEVEL    NUMBER(2),
  MDATE     DATE
);
------------------------------相关序列------------------------------------------------
--商品类别序列
create sequence seq_t_mctype
start with 20
increment by 1;
--前台用户
create sequence seq_t_user
start with 20
increment by 1;
--商品信息序列
create sequence seq_t_mc
start with 20
increment by 1;
--后台管理员序列
create sequence seq_t_manager
start with 20
increment by 1;
--订单详情序列
create sequence seq_t_ORDERDETAIL
start with 20
increment by 1;

----------------------------- 数据 -----------------------------------------
-- 商品信息数据
insert into T_MC (MCID, MCNAME, MCDECX, PRICE, PIC, FLAG, SMALLTYPEID, CREATEDATE, QUANTITY)
values (1, '佳能IXUS510', '相机类型:  长焦数码相机' || chr(13) || '' || chr(10) || '有效像素:  1010万像素' || chr(13) || '' || chr(10) || '变焦倍数:  12倍光学变焦' || chr(13) || '' || chr(10) || '数码变焦倍数:  4倍数码变焦' || chr(13) || '' || chr(10) || '操作模式:  全自动' || chr(13) || '' || chr(10) || '传感器类型:  CMOS传感器' || chr(13) || '' || chr(10) || '传感器尺寸:  1/2.3英寸', 1399, '1379390427587.jpg', '0', 6, to_date('17-09-2013 11:58:30', 'dd-mm-yyyy hh24:mi:ss'), 50);
insert into T_MC (MCID, MCNAME, MCDECX, PRICE, PIC, FLAG, SMALLTYPEID, CREATEDATE, QUANTITY)
values (2, '佳能LEGRIAHFR46', '型号:  EOS C100' || chr(13) || '' || chr(10) || '产品类型:  专业摄像机' || chr(13) || '' || chr(10) || '总像素;  830万像素' || chr(13) || '' || chr(10) || '光学变焦:  无光学变焦' || chr(13) || '' || chr(10) || '传感器类型:  CMOS传感器,HD CMOS' || chr(13) || '' || chr(10) || '传感器尺寸:  1/4.85英寸' || chr(13) || '' || chr(10) || 'LCD液晶屏:  3.5英寸', 2988, '1379390605786.jpg', '0', 7, to_date('17-09-2013 12:02:50', 'dd-mm-yyyy hh24:mi:ss'), 50);
insert into T_MC (MCID, MCNAME, MCDECX, PRICE, PIC, FLAG, SMALLTYPEID, CREATEDATE, QUANTITY)
values (3, '明基S21', '型号:  S21' || chr(13) || '' || chr(10) || '产品类型:  高清摄像机,闪存摄像机' || chr(13) || '' || chr(10) || '总像素:  500万像素' || chr(13) || '' || chr(10) || '光学变焦:  无光学变焦' || chr(13) || '' || chr(10) || '数码变焦倍数:  4倍' || chr(13) || '' || chr(10) || '镜头描述:  f=7.0mm,F=3.25,等效于35mm f=52mm(静态摄像)' || chr(13) || '' || chr(10) || 'LCD液晶屏:  3.0英寸' || chr(13) || '' || chr(10) || '传感器类型:  CMOS传感器' || chr(13) || '' || chr(10) || '传感器尺寸:  1/2.5英寸', 1899, '1379390716971.jpg', '0', 7, to_date('17-09-2013 12:04:41', 'dd-mm-yyyy hh24:mi:ss'), 50);
insert into T_MC (MCID, MCNAME, MCDECX, PRICE, PIC, FLAG, SMALLTYPEID, CREATEDATE, QUANTITY)
values (4, '谷歌Nexus7', '型号别称' || chr(9) || 'Nexus 7(32G/4G)' || chr(13) || '' || chr(10) || '操作系统' || chr(9) || 'Android,4.1' || chr(13) || '' || chr(10) || '处理器' || chr(9) || 'Nvidia Tegra 3,T30L' || chr(13) || '' || chr(10) || '处理器类型' || chr(9) || '四核' || chr(13) || '' || chr(10) || '处理器主频' || chr(9) || '1.3GHz' || chr(13) || '' || chr(10) || '系统内存' || chr(9) || '1GB' || chr(13) || '' || chr(10) || '存储容量' || chr(9) || '32GB' || chr(13) || '' || chr(10) || '硬盘类型' || chr(9) || '闪存硬盘' || chr(13) || '' || chr(10) || '传感器' || chr(9) || '重力传感器,环境光传感器,电子罗盘,加速传感器', 2299, '1379390815568.jpg', '0', 4, to_date('17-09-2013 12:06:13', 'dd-mm-yyyy hh24:mi:ss'), 50);
insert into T_MC (MCID, MCNAME, MCDECX, PRICE, PIC, FLAG, SMALLTYPEID, CREATEDATE, QUANTITY)
values (5, '苹果iPadMini', '型号别称' || chr(9) || 'iPad Mini(16G/WiFi版)' || chr(13) || '' || chr(10) || '操作系统' || chr(9) || 'iOS,6.0' || chr(13) || '' || chr(10) || '处理器' || chr(9) || 'Apple A5(1GHz)' || chr(13) || '' || chr(10) || '处理器类型' || chr(9) || '双核' || chr(13) || '' || chr(10) || '处理器主频' || chr(9) || '1.0GHz' || chr(13) || '' || chr(10) || '系统内存' || chr(9) || '512MB' || chr(13) || '' || chr(10) || '存储容量' || chr(9) || '16GB' || chr(13) || '' || chr(10) || '传感器' || chr(9) || '三轴传感器,环境光传感器,陀螺仪,加速感应器', 2899, '1379393048296.jpg', '0', 4, to_date('17-09-2013 12:43:35', 'dd-mm-yyyy hh24:mi:ss'), 50);
insert into T_MC (MCID, MCNAME, MCDECX, PRICE, PIC, FLAG, SMALLTYPEID, CREATEDATE, QUANTITY)
values (6, '微软XboxSurface', '型号别称' || chr(9) || 'Xbox Surface' || chr(13) || '' || chr(10) || '处理器' || chr(9) || 'IBM POWER7' || chr(13) || '' || chr(10) || '处理器类型' || chr(9) || '12核' || chr(13) || '' || chr(10) || '处理器主频' || chr(9) || '3.1GHz' || chr(13) || '' || chr(10) || '系统内存' || chr(9) || '5GB' || chr(13) || '' || chr(10) || '内存类型' || chr(9) || 'DDR3,LRDIMM' || chr(13) || '' || chr(10) || '存储容量' || chr(9) || '250GB' || chr(13) || '' || chr(10) || '显卡芯片' || chr(9) || 'AMD GCN' || chr(13) || '' || chr(10) || '传感器' || chr(9) || '重力传感器', 2399, '1379393186240.jpg', '0', 4, to_date('17-09-2013 12:45:11', 'dd-mm-yyyy hh24:mi:ss'), 50);
insert into T_MC (MCID, MCNAME, MCDECX, PRICE, PIC, FLAG, SMALLTYPEID, CREATEDATE, QUANTITY)
values (7, 'JVCGZGX8BACM', '型号' || chr(9) || 'GZ-GX8BACM' || chr(13) || '' || chr(10) || '产品类型' || chr(9) || '高清摄像机,闪存摄像机' || chr(13) || '' || chr(10) || '总像素' || chr(9) || '1000万像素' || chr(13) || '' || chr(10) || '光学变焦' || chr(9) || '10倍' || chr(13) || '' || chr(10) || '光圈范围' || chr(9) || 'F1.2(最大大光圈)' || chr(13) || '' || chr(10) || 'LCD液晶屏' || chr(9) || '3.5英寸' || chr(13) || '' || chr(10) || '屏幕特性' || chr(9) || '触摸屏' || chr(13) || '' || chr(10) || '传感器类型' || chr(9) || 'CMOS传感器,背照式CMOS传感器' || chr(13) || '' || chr(10) || '传感器尺寸' || chr(9) || '1/2.3英寸', 8399, '1379390753896.jpg', '0', 7, to_date('17-09-2013 12:05:20', 'dd-mm-yyyy hh24:mi:ss'), 50);
insert into T_MC (MCID, MCNAME, MCDECX, PRICE, PIC, FLAG, SMALLTYPEID, CREATEDATE, QUANTITY)
values (8, 'ThinkPidB470', '屏幕尺寸:15英寸 CPU型号：Intel 酷睿i5 3110M ', 4542, 'thinkpid.jpg', '0', 3, to_date('04-09-2013 11:30:54', 'dd-mm-yyyy hh24:mi:ss'), 43);
insert into T_MC (MCID, MCNAME, MCDECX, PRICE, PIC, FLAG, SMALLTYPEID, CREATEDATE, QUANTITY)
values (9, '索尼NEX900E', '型号:  索尼 NEX VG-900E' || chr(13) || '' || chr(10) || '产品类型:  高清摄像机' || chr(13) || '' || chr(10) || '总像素:  1280万像素' || chr(13) || '' || chr(10) || '光学变焦:  无光学变焦' || chr(13) || '' || chr(10) || '光圈范围:  F2.8' || chr(13) || '' || chr(10) || 'LCD液晶屏:  2.7英寸' || chr(13) || '' || chr(10) || '传感器类型:  CMOS传感器传感器', 2499, '1379390646146.jpg', '0', 7, to_date('17-09-2013 12:03:31', 'dd-mm-yyyy hh24:mi:ss'), 50);
insert into T_MC (MCID, MCNAME, MCDECX, PRICE, PIC, FLAG, SMALLTYPEID, CREATEDATE, QUANTITY)
values (10, '三星GalaxyTab', '型号别称' || chr(9) || 'Galaxy Tab 3 10.1' || chr(13) || '' || chr(10) || '操作系统' || chr(9) || 'Android,4.2' || chr(13) || '' || chr(10) || '定位' || chr(9) || '英特尔芯平板' || chr(13) || '' || chr(10) || '处理器' || chr(9) || 'Intel Atom Z2560' || chr(13) || '' || chr(10) || '处理器类型' || chr(9) || '双核' || chr(13) || '' || chr(10) || '处理器主频' || chr(9) || '1.6GHz' || chr(13) || '' || chr(10) || '系统内存' || chr(9) || '1GB' || chr(13) || '' || chr(10) || '存储容量' || chr(9) || '16GB' || chr(13) || '' || chr(10) || '传感器' || chr(9) || '重力传感器,环境光传感器', 2399, '1379393011732.jpg', '0', 4, to_date('17-09-2013 12:42:12', 'dd-mm-yyyy hh24:mi:ss'), 50);
insert into T_MC (MCID, MCNAME, MCDECX, PRICE, PIC, FLAG, SMALLTYPEID, CREATEDATE, QUANTITY)
values (11, '联想IdeaCentre', '型号' || chr(9) || 'K315 ' || chr(13) || '' || chr(10) || '类型' || chr(9) || '家用台式机' || chr(13) || '' || chr(10) || '处理器' || chr(9) || 'AMD Athlon II X4 631' || chr(13) || '' || chr(10) || '处理器类型' || chr(9) || '速龙II四核' || chr(13) || '' || chr(10) || '处理器频率' || chr(9) || '2.6GHz' || chr(13) || '' || chr(10) || '二级缓存' || chr(9) || 'L2 4M' || chr(13) || '' || chr(10) || '操作系统' || chr(9) || 'DOS系统', 3499, '1379393238043.jpg', '0', 2, to_date('17-09-2013 12:46:50', 'dd-mm-yyyy hh24:mi:ss'), 50);
insert into T_MC (MCID, MCNAME, MCDECX, PRICE, PIC, FLAG, SMALLTYPEID, CREATEDATE, QUANTITY)
values (12, '惠普HPE355CN', '型号' || chr(9) || 'HPE-355CN' || chr(13) || '' || chr(10) || '类型' || chr(9) || '家用台式机' || chr(13) || '' || chr(10) || '处理器' || chr(9) || 'Intel Core i7 930' || chr(13) || '' || chr(10) || '处理器类型' || chr(9) || '酷睿i7' || chr(13) || '' || chr(10) || '处理器频率' || chr(9) || '2.8GHz' || chr(13) || '' || chr(10) || '处理器接口' || chr(9) || 'LGA 1366' || chr(13) || '' || chr(10) || '操作系统' || chr(9) || 'Windows 7 Home Premium' || chr(13) || '' || chr(10) || '处理器外频' || chr(9) || '133MHz', 3599, '1379393287601.jpg', '0', 2, to_date('17-09-2013 12:47:26', 'dd-mm-yyyy hh24:mi:ss'), 50);
insert into T_MC (MCID, MCNAME, MCDECX, PRICE, PIC, FLAG, SMALLTYPEID, CREATEDATE, QUANTITY)
values (13, '戴尔Inspiron560s', '型号' || chr(9) || 'Inspiron 560s(I560SD-158)' || chr(13) || '' || chr(10) || '类型' || chr(9) || '家用台式机' || chr(13) || '' || chr(10) || '处理器' || chr(9) || 'Intel Core2 Duo E7500 2.93G' || chr(13) || '' || chr(10) || '处理器类型' || chr(9) || '酷睿2双核' || chr(13) || '' || chr(10) || '处理器频率' || chr(9) || '2.93GHz' || chr(13) || '' || chr(10) || '处理器接口' || chr(9) || 'LGA 775' || chr(13) || '' || chr(10) || '操作系统' || chr(9) || 'Windows 7 Home Basic' || chr(13) || '' || chr(10) || '处理器外频' || chr(9) || '200MHz', 3799, '1379393316849.jpg', '0', 2, to_date('17-09-2013 12:48:13', 'dd-mm-yyyy hh24:mi:ss'), 50);
insert into T_MC (MCID, MCNAME, MCDECX, PRICE, PIC, FLAG, SMALLTYPEID, CREATEDATE, QUANTITY)
values (14, '联想B470', '屏幕尺寸:14英寸 CPU型号：Intel 酷睿i3 3110M ', 3242, 'lenson.jpg', '1', 3, to_date('08-09-2013 13:05:27', 'dd-mm-yyyy hh24:mi:ss'), 0);
insert into T_MC (MCID, MCNAME, MCDECX, PRICE, PIC, FLAG, SMALLTYPEID, CREATEDATE, QUANTITY)
values (15, '联想G480', '屏幕尺寸：14英寸 1366x768' || chr(10) || 'CPU型号：Intel 酷睿i5 3230M' || chr(10) || 'CPU主频：2.6GHz' || chr(10) || '内存容量：4GB DDR3' || chr(10) || '硬盘容量：500GB 5400转' || chr(10) || '显卡芯片：NVIDIA GeForce GT 610M', 3256, 'lenovoG4801.jpg', '0', 3, to_date('11-09-2013 16:31:41', 'dd-mm-yyyy hh24:mi:ss'), 50);
insert into T_MC (MCID, MCNAME, MCDECX, PRICE, PIC, FLAG, SMALLTYPEID, CREATEDATE, QUANTITY)
values (16, '戴尔Inspiron灵越', '屏幕尺寸：14英寸 1366x768CPU型号：Intel 酷睿i5 3337UCPU主频：1.8GHz 内存容量：4GB DDR3 1600MHz硬盘容量：500GB 5400转', 3242, 'dell14R1.jpg', '0', 3, to_date('11-09-2013 16:31:41', 'dd-mm-yyyy hh24:mi:ss'), 49);
insert into T_MC (MCID, MCNAME, MCDECX, PRICE, PIC, FLAG, SMALLTYPEID, CREATEDATE, QUANTITY)
values (17, '三星NX300', '型号:  NX300套机(配18-55mm镜头)' || chr(13) || '' || chr(10) || '相机类型:  单电数码相机' || chr(13) || '' || chr(10) || '总像素:  2160万像素' || chr(13) || '' || chr(10) || '扩展变焦:  智能编辑:1.2倍,1.4倍,1.7倍,2倍' || chr(13) || '' || chr(10) || '操作模式:  带全手动功能' || chr(13) || '' || chr(10) || '传感器类型:  CMOS传感器' || chr(13) || '' || chr(10) || '传感器尺寸:  23.5×15.7mm' || chr(13) || '' || chr(10) || '传感器描述:  色彩滤镜系统:RGB原色滤镜; 长宽比:3:2,16:9,1:1', 3999, '1379390524388.jpg', '0', 6, to_date('17-09-2013 12:01:14', 'dd-mm-yyyy hh24:mi:ss'), 50);
insert into T_MC (MCID, MCNAME, MCDECX, PRICE, PIC, FLAG, SMALLTYPEID, CREATEDATE, QUANTITY)
values (18, '索尼F14217SCW', '屏幕尺寸：14英寸 1600x900' || chr(10) || 'CPU型号：Intel 酷睿i5 3337U' || chr(10) || 'CPU主频：1.8GHz' || chr(10) || '内存容量：4GB DDR3L 1600MHz（低电压版）' || chr(10) || '硬盘容量：750GB 5400转' || chr(10) || '显卡芯片：NVIDIA GeForce GT 740M ', 3800, 'sonyB.jpg', '0', 3, to_date('11-09-2013 16:14:10', 'dd-mm-yyyy hh24:mi:ss'), 50);
insert into T_MC (MCID, MCNAME, MCDECX, PRICE, PIC, FLAG, SMALLTYPEID, CREATEDATE, QUANTITY)
values (19, '索尼1542ETD', '屏幕尺寸：14英寸 1600x900' || chr(10) || 'CPU型号：Intel 酷睿i3 3337U' || chr(10) || 'CPU主频：1.8GHz' || chr(10) || '内存容量：4GB DDR3L 1600MHz（低电压版）' || chr(10) || '硬盘容量：750GB 5400转' || chr(10) || '显卡芯片：NVIDIA GeForce GT 740M ', 4899, 'sonyB1.jpg', '0', 3, to_date('11-09-2013 16:31:42', 'dd-mm-yyyy hh24:mi:ss'), 50);
insert into T_MC (MCID, MCNAME, MCDECX, PRICE, PIC, FLAG, SMALLTYPEID, CREATEDATE, QUANTITY)
values (20, '联想扬天', '显示器尺寸：20英寸' || chr(10) || 'CPU 型号：Intel 酷睿 i5 3470' || chr(10) || '内存容量：4GB DDR3' || chr(10) || '硬盘容量：1TB 7200转' || chr(10) || '显卡芯片：AMD Radeon HD 7450 1GB', 5000, 'lenovoA1.jpg', '0', 2, to_date('11-09-2013 16:31:42', 'dd-mm-yyyy hh24:mi:ss'), 49);
insert into T_MC (MCID, MCNAME, MCDECX, PRICE, PIC, FLAG, SMALLTYPEID, CREATEDATE, QUANTITY)
values (21, 'Ipad4', '屏幕尺寸：9.7英寸 电容式触摸屏' || chr(10) || '操作系统：iOS 5.1' || chr(10) || '存储容量：16GB' || chr(10) || '屏幕分辨率：2048x1536', 3500, 'ipad1.jpg', '0', 4, to_date('11-09-2013 16:31:42', 'dd-mm-yyyy hh24:mi:ss'), 50);
insert into T_MC (MCID, MCNAME, MCDECX, PRICE, PIC, FLAG, SMALLTYPEID, CREATEDATE, QUANTITY)
values (22, 'SonyTX66', '机身特性：卡片机' || chr(10) || '有效像素：1820万' || chr(10) || '显示屏尺寸：3.3英寸 123万像素液晶屏 光学变焦：5倍' || chr(10) || '高清摄像：全高清（1080）' || chr(10) || '防抖性能：光学防抖', 1300, 'sonyPhoto1.jpg', '0', 6, to_date('11-09-2013 16:31:42', 'dd-mm-yyyy hh24:mi:ss'), 49);
insert into T_MC (MCID, MCNAME, MCDECX, PRICE, PIC, FLAG, SMALLTYPEID, CREATEDATE, QUANTITY)
values (23, '佳能IXUS230', '机身特性：卡片机' || chr(13) || '' || chr(10) || '有效像素：1210万' || chr(13) || '' || chr(10) || '显示屏尺寸：3英寸 46万像素液晶屏' || chr(13) || '' || chr(10) || '光学变焦：8倍' || chr(13) || '' || chr(10) || '防抖性能：光学防抖' || chr(13) || '' || chr(10) || '传感器尺寸：（1/2.3）英寸 背照式CMOS', 1160, 'canonPhoto1.jpg', '1', 6, to_date('11-09-2013 16:31:42', 'dd-mm-yyyy hh24:mi:ss'), 0);
commit;

--- 商品类别表数据
insert into T_MCTYPE (TYPEID, TYPENAME, FATHERID)
values (1, '计算机', 0);
insert into T_MCTYPE (TYPEID, TYPENAME, FATHERID)
values (2, '台式机', 1);
insert into T_MCTYPE (TYPEID, TYPENAME, FATHERID)
values (3, '笔记本', 1);
insert into T_MCTYPE (TYPEID, TYPENAME, FATHERID)
values (4, '掌上电脑', 1);
insert into T_MCTYPE (TYPEID, TYPENAME, FATHERID)
values (5, '数码产品', 0);
insert into T_MCTYPE (TYPEID, TYPENAME, FATHERID)
values (6, '数码照相机', 5);
insert into T_MCTYPE (TYPEID, TYPENAME, FATHERID)
values (7, '数码摄像机', 5);
commit;
--- 前台用户 数据
insert into T_USER (USERID, USERNAME, PASSWORD, TRUENAME, USERSEX, BIRTHDAY, EMAIL, PHONENO, POSTCADE, ADDRESS, REGDATE, LOCKSTATE, LASTACCESS, LOGIN)
values (1, 'a00001', '123456', '张三', '0', to_date('12-12-2001', 'dd-mm-yyyy'), '12345@qq.com', '15394415750', '123456', '福州市', to_date('07-12-2016 17:51:33', 'dd-mm-yyyy hh24:mi:ss'), '0', to_date('07-12-2016 17:51:33', 'dd-mm-yyyy hh24:mi:ss'), 2);
insert into T_USER (USERID, USERNAME, PASSWORD, TRUENAME, USERSEX, BIRTHDAY, EMAIL, PHONENO, POSTCADE, ADDRESS, REGDATE, LOCKSTATE, LASTACCESS, LOGIN)
values (2, 'a00002', '123456', '李四', '1', to_date('12-06-1991', 'dd-mm-yyyy'), '12345@qq.com', '15394415750', '123456', '福州市', to_date('07-12-2016 17:51:33', 'dd-mm-yyyy hh24:mi:ss'), '0', to_date('07-12-2016 17:51:33', 'dd-mm-yyyy hh24:mi:ss'), 2);
insert into T_USER (USERID, USERNAME, PASSWORD, TRUENAME, USERSEX, BIRTHDAY, EMAIL, PHONENO, POSTCADE, ADDRESS, REGDATE, LOCKSTATE, LASTACCESS, LOGIN)
values (3, 'a00003', '123456', '敏红', '1', to_date('12-05-2001', 'dd-mm-yyyy'), '12345@qq.com', '15394415750', '123456', '福州市', to_date('07-12-2016 17:51:33', 'dd-mm-yyyy hh24:mi:ss'), '1', to_date('07-12-2016 17:51:33', 'dd-mm-yyyy hh24:mi:ss'), 1);
insert into T_USER (USERID, USERNAME, PASSWORD, TRUENAME, USERSEX, BIRTHDAY, EMAIL, PHONENO, POSTCADE, ADDRESS, REGDATE, LOCKSTATE, LASTACCESS, LOGIN)
values (4, 'Test', '888888', '江定奇', '0', to_date('11-06-1991', 'dd-mm-yyyy'), '179491757@qq.com', '15394415750', '350001', '福州市鼓楼市', to_date('07-12-2016 17:51:33', 'dd-mm-yyyy hh24:mi:ss'), '0', to_date('07-12-2016 17:51:33', 'dd-mm-yyyy hh24:mi:ss'), 1);
commit;

-- 订单表 数据

insert into T_ORDERS (ORDERID, USERID, QUANTITY, ALLTYPE, TOTALPRICE, PAYTYPE, RECEIVEDTYPE, USERNAME, ADDRESS, POSTCODE, PHONENO, EMAIL, ORDERDATE, STATUS, APPROVEDUSER, APPROVEDDATE, MSG)
values ('130917205949004', 4, 5, 3, 14586, '第三方付款', '快递', '江定奇', '福州市鼓楼市', '350001', '15394415750', '179491757@qq.com', to_date('11-09-2013 20:59:47', 'dd-mm-yyyy hh24:mi:ss'), '0', null, null, null);
insert into T_ORDERS (ORDERID, USERID, QUANTITY, ALLTYPE, TOTALPRICE, PAYTYPE, RECEIVEDTYPE, USERNAME, ADDRESS, POSTCODE, PHONENO, EMAIL, ORDERDATE, STATUS, APPROVEDUSER, APPROVEDDATE, MSG)
values ('130917210122004', 4, 2, 2, 6741, '第三方付款', '快递', '张三', '福州市晋安区', '350001', '18259002145', '179491757@qq.com', to_date('12-09-2013 21:01:00', 'dd-mm-yyyy hh24:mi:ss'), '0', null, null, null);
insert into T_ORDERS (ORDERID, USERID, QUANTITY, ALLTYPE, TOTALPRICE, PAYTYPE, RECEIVEDTYPE, USERNAME, ADDRESS, POSTCODE, PHONENO, EMAIL, ORDERDATE, STATUS, APPROVEDUSER, APPROVEDDATE, MSG)
values ('130917210253004', 4, 2, 2, 7199, '在线付款', '平邮', '江定奇', '福州市鼓楼市', '350001', '15394415750', '179491757@qq.com', to_date('12-09-2013 21:02:52', 'dd-mm-yyyy hh24:mi:ss'), '0', null, null, null);
insert into T_ORDERS (ORDERID, USERID, QUANTITY, ALLTYPE, TOTALPRICE, PAYTYPE, RECEIVEDTYPE, USERNAME, ADDRESS, POSTCODE, PHONENO, EMAIL, ORDERDATE, STATUS, APPROVEDUSER, APPROVEDDATE, MSG)
values ('130917210356004', 4, 2, 2, 5641, '在线付款', '平邮', '江定奇', '福州市鼓楼市', '350001', '15394415750', '179491757@qq.com', to_date('11-09-2013 21:03:55', 'dd-mm-yyyy hh24:mi:ss'), '0', null, null, null);
insert into T_ORDERS (ORDERID, USERID, QUANTITY, ALLTYPE, TOTALPRICE, PAYTYPE, RECEIVEDTYPE, USERNAME, ADDRESS, POSTCODE, PHONENO, EMAIL, ORDERDATE, STATUS, APPROVEDUSER, APPROVEDDATE, MSG)
values ('130917210940004', 4, 1, 1, 2988, '在线付款', '平邮', '江定奇', '福州市鼓楼市', '350001', '15394415750', '179491757@qq.com', to_date('14-09-2013 21:09:39', 'dd-mm-yyyy hh24:mi:ss'), '2', 'SuperAdmin', to_date('17-09-2013 22:27:10', 'dd-mm-yyyy hh24:mi:ss'), '商品在路上被破坏');
insert into T_ORDERS (ORDERID, USERID, QUANTITY, ALLTYPE, TOTALPRICE, PAYTYPE, RECEIVEDTYPE, USERNAME, ADDRESS, POSTCODE, PHONENO, EMAIL, ORDERDATE, STATUS, APPROVEDUSER, APPROVEDDATE, MSG)
values ('130917210231004', 4, 2, 2, 3599, '第三方付款', '快递', '江定奇', '福州市鼓楼市', '350001', '15394415750', '179491757@qq.com', to_date('15-09-2013 21:02:30', 'dd-mm-yyyy hh24:mi:ss'), '0', null, null, null);
insert into T_ORDERS (ORDERID, USERID, QUANTITY, ALLTYPE, TOTALPRICE, PAYTYPE, RECEIVEDTYPE, USERNAME, ADDRESS, POSTCODE, PHONENO, EMAIL, ORDERDATE, STATUS, APPROVEDUSER, APPROVEDDATE, MSG)
values ('130917210452004', 4, 2, 2, 12941, '在线付款', '平邮', '江定奇', '福州市鼓楼市', '350001', '15394415750', '179491757@qq.com', to_date('16-09-2013 21:04:51', 'dd-mm-yyyy hh24:mi:ss'), '0', null, null, null);
insert into T_ORDERS (ORDERID, USERID, QUANTITY, ALLTYPE, TOTALPRICE, PAYTYPE, RECEIVEDTYPE, USERNAME, ADDRESS, POSTCODE, PHONENO, EMAIL, ORDERDATE, STATUS, APPROVEDUSER, APPROVEDDATE, MSG)
values ('130917210616004', 4, 1, 1, 3799, '在线付款', '平邮', '江定奇', '福州市鼓楼市', '350001', '15394415750', '179491757@qq.com', to_date('16-09-2013 21:06:15', 'dd-mm-yyyy hh24:mi:ss'), '0', null, null, null);
insert into T_ORDERS (ORDERID, USERID, QUANTITY, ALLTYPE, TOTALPRICE, PAYTYPE, RECEIVEDTYPE, USERNAME, ADDRESS, POSTCODE, PHONENO, EMAIL, ORDERDATE, STATUS, APPROVEDUSER, APPROVEDDATE, MSG)
values ('130917210638004', 4, 1, 1, 5000, '在线付款', '平邮', '江定奇', '福州市鼓楼市', '350001', '15394415750', '179491757@qq.com', to_date('15-09-2013 21:06:37', 'dd-mm-yyyy hh24:mi:ss'), '2', 'admin001', to_date('17-09-2013 22:29:34', 'dd-mm-yyyy hh24:mi:ss'), '阿斯达法师打发斯蒂芬阿斯蒂芬撒地方');
insert into T_ORDERS (ORDERID, USERID, QUANTITY, ALLTYPE, TOTALPRICE, PAYTYPE, RECEIVEDTYPE, USERNAME, ADDRESS, POSTCODE, PHONENO, EMAIL, ORDERDATE, STATUS, APPROVEDUSER, APPROVEDDATE, MSG)
values ('130917212607004', 4, 1, 1, 5000, '在线付款', '平邮', '江定奇', '福州市鼓楼市', '350001', '15394415750', '179491757@qq.com', to_date('14-09-2013 21:26:05', 'dd-mm-yyyy hh24:mi:ss'), '1', 'SuperAdmin', to_date('17-09-2013 22:19:54', 'dd-mm-yyyy hh24:mi:ss'), '阿斯达法师打发斯蒂芬阿斯蒂芬撒地方');
insert into T_ORDERS (ORDERID, USERID, QUANTITY, ALLTYPE, TOTALPRICE, PAYTYPE, RECEIVEDTYPE, USERNAME, ADDRESS, POSTCODE, PHONENO, EMAIL, ORDERDATE, STATUS, APPROVEDUSER, APPROVEDDATE, MSG)
values ('130917205525004', 4, 3, 2, 6786, '第三方付款', '快递', '江定奇', '福州市鼓楼市', '350001', '15394415750', '179491757@qq.com', to_date('17-09-2013 20:55:23', 'dd-mm-yyyy hh24:mi:ss'), '0', null, null, null);
insert into T_ORDERS (ORDERID, USERID, QUANTITY, ALLTYPE, TOTALPRICE, PAYTYPE, RECEIVEDTYPE, USERNAME, ADDRESS, POSTCODE, PHONENO, EMAIL, ORDERDATE, STATUS, APPROVEDUSER, APPROVEDDATE, MSG)
values ('130917210709004', 4, 2, 2, 5555, '第三方付款', '平邮', '江定奇', '福州市鼓楼市', '350001', '15394415750', '179491757@qq.com', to_date('11-09-2013 21:07:08', 'dd-mm-yyyy hh24:mi:ss'), '0', null, null, null);
insert into T_ORDERS (ORDERID, USERID, QUANTITY, ALLTYPE, TOTALPRICE, PAYTYPE, RECEIVEDTYPE, USERNAME, ADDRESS, POSTCODE, PHONENO, EMAIL, ORDERDATE, STATUS, APPROVEDUSER, APPROVEDDATE, MSG)
values ('130917170655004', 4, 1, 1, 1399, '在线付款', '平邮', '江定奇', '福州市鼓楼市', '350001', '15394415750', '179491757@qq.com', to_date('06-09-2013 17:06:54', 'dd-mm-yyyy hh24:mi:ss'), '0', null, null, null);
insert into T_ORDERS (ORDERID, USERID, QUANTITY, ALLTYPE, TOTALPRICE, PAYTYPE, RECEIVEDTYPE, USERNAME, ADDRESS, POSTCODE, PHONENO, EMAIL, ORDERDATE, STATUS, APPROVEDUSER, APPROVEDDATE, MSG)
values ('130917205558004', 4, 1, 1, 2299, '第三方付款', '快递', '江定奇', '福州市鼓楼市', '350001', '15394415750', '179491757@qq.com', to_date('14-09-2013 20:55:56', 'dd-mm-yyyy hh24:mi:ss'), '0', null, null, null);
insert into T_ORDERS (ORDERID, USERID, QUANTITY, ALLTYPE, TOTALPRICE, PAYTYPE, RECEIVEDTYPE, USERNAME, ADDRESS, POSTCODE, PHONENO, EMAIL, ORDERDATE, STATUS, APPROVEDUSER, APPROVEDDATE, MSG)
values ('130917210028004', 4, 2, 2, 12398, '在线付款', '平邮', '江定奇', '福州市鼓楼市', '350014', '15394415750', '179491757@qq.com', to_date('15-09-2013 21:00:18', 'dd-mm-yyyy hh24:mi:ss'), '0', null, null, null);
insert into T_ORDERS (ORDERID, USERID, QUANTITY, ALLTYPE, TOTALPRICE, PAYTYPE, RECEIVEDTYPE, USERNAME, ADDRESS, POSTCODE, PHONENO, EMAIL, ORDERDATE, STATUS, APPROVEDUSER, APPROVEDDATE, MSG)
values ('130917210040004', 4, 1, 1, 3499, '在线付款', '平邮', '江定奇', '福州市鼓楼市', '350001', '15394415750', '179491757@qq.com', to_date('16-09-2013 21:00:39', 'dd-mm-yyyy hh24:mi:ss'), '0', null, null, null);
insert into T_ORDERS (ORDERID, USERID, QUANTITY, ALLTYPE, TOTALPRICE, PAYTYPE, RECEIVEDTYPE, USERNAME, ADDRESS, POSTCODE, PHONENO, EMAIL, ORDERDATE, STATUS, APPROVEDUSER, APPROVEDDATE, MSG)
values ('130917210142004', 4, 1, 1, 2899, '第三方付款', '快递', '张三', '福州市鼓楼市', '350001', '15394415750', '179491757@qq.com', to_date('14-09-2013 21:01:34', 'dd-mm-yyyy hh24:mi:ss'), '0', null, null, null);
insert into T_ORDERS (ORDERID, USERID, QUANTITY, ALLTYPE, TOTALPRICE, PAYTYPE, RECEIVEDTYPE, USERNAME, ADDRESS, POSTCODE, PHONENO, EMAIL, ORDERDATE, STATUS, APPROVEDUSER, APPROVEDDATE, MSG)
values ('130917210324004', 4, 1, 1, 3256, '在线付款', '平邮', '江定奇', '福州市鼓楼市', '350001', '15394415750', '179491757@qq.com', to_date('16-09-2013 21:03:22', 'dd-mm-yyyy hh24:mi:ss'), '0', null, null, null);
insert into T_ORDERS (ORDERID, USERID, QUANTITY, ALLTYPE, TOTALPRICE, PAYTYPE, RECEIVEDTYPE, USERNAME, ADDRESS, POSTCODE, PHONENO, EMAIL, ORDERDATE, STATUS, APPROVEDUSER, APPROVEDDATE, MSG)
values ('130917210425004', 4, 1, 1, 2499, '在线付款', '平邮', '江定奇', '福州市鼓楼市', '350001', '15394415750', '179491757@qq.com', to_date('14-09-2013 21:04:24', 'dd-mm-yyyy hh24:mi:ss'), '0', null, null, null);
insert into T_ORDERS (ORDERID, USERID, QUANTITY, ALLTYPE, TOTALPRICE, PAYTYPE, RECEIVEDTYPE, USERNAME, ADDRESS, POSTCODE, PHONENO, EMAIL, ORDERDATE, STATUS, APPROVEDUSER, APPROVEDDATE, MSG)
values ('130917210507004', 4, 1, 1, 3256, '在线付款', '平邮', '江定奇', '福州市鼓楼市', '350001', '15394415750', '179491757@qq.com', to_date('15-09-2013 21:05:05', 'dd-mm-yyyy hh24:mi:ss'), '0', null, null, null);
insert into T_ORDERS (ORDERID, USERID, QUANTITY, ALLTYPE, TOTALPRICE, PAYTYPE, RECEIVEDTYPE, USERNAME, ADDRESS, POSTCODE, PHONENO, EMAIL, ORDERDATE, STATUS, APPROVEDUSER, APPROVEDDATE, MSG)
values ('130917210547004', 4, 3, 3, 7397, '第三方付款', '货到付款', '江定奇', '福州市鼓楼市', '350001', '15394415750', '179491757@qq.com', to_date('14-09-2013 21:05:46', 'dd-mm-yyyy hh24:mi:ss'), '0', null, null, null);
insert into T_ORDERS (ORDERID, USERID, QUANTITY, ALLTYPE, TOTALPRICE, PAYTYPE, RECEIVEDTYPE, USERNAME, ADDRESS, POSTCODE, PHONENO, EMAIL, ORDERDATE, STATUS, APPROVEDUSER, APPROVEDDATE, MSG)
values ('130917210754004', 4, 5, 5, 14095, '在线付款', '平邮', '江定奇', '福州市鼓楼市', '350001', '15394415750', '179491757@qq.com', to_date('16-09-2013 21:07:52', 'dd-mm-yyyy hh24:mi:ss'), '1', 'SuperAdmin', to_date('17-09-2013 22:19:12', 'dd-mm-yyyy hh24:mi:ss'), '商品足够，近期发货');
commit;

--- 订单详情 数据
insert into T_ORDERDETAIL (DETAILID, ORDERID, MCID, BUYNUM)
values (24, '130917205949004', 21, 2);
insert into T_ORDERDETAIL (DETAILID, ORDERID, MCID, BUYNUM)
values (25, '130917205949004', 4, 2);
insert into T_ORDERDETAIL (DETAILID, ORDERID, MCID, BUYNUM)
values (26, '130917205949004', 2, 1);
insert into T_ORDERDETAIL (DETAILID, ORDERID, MCID, BUYNUM)
values (30, '130917210122004', 16, 1);
insert into T_ORDERDETAIL (DETAILID, ORDERID, MCID, BUYNUM)
values (31, '130917210122004', 11, 1);
insert into T_ORDERDETAIL (DETAILID, ORDERID, MCID, BUYNUM)
values (35, '130917210253004', 6, 1);
insert into T_ORDERDETAIL (DETAILID, ORDERID, MCID, BUYNUM)
values (36, '130917210253004', 18, 1);
insert into T_ORDERDETAIL (DETAILID, ORDERID, MCID, BUYNUM)
values (38, '130917210356004', 16, 1);
insert into T_ORDERDETAIL (DETAILID, ORDERID, MCID, BUYNUM)
values (39, '130917210356004', 6, 1);
insert into T_ORDERDETAIL (DETAILID, ORDERID, MCID, BUYNUM)
values (56, '130917210940004', 2, 1);
insert into T_ORDERDETAIL (DETAILID, ORDERID, MCID, BUYNUM)
values (33, '130917210231004', 4, 1);
insert into T_ORDERDETAIL (DETAILID, ORDERID, MCID, BUYNUM)
values (34, '130917210231004', 22, 1);
insert into T_ORDERDETAIL (DETAILID, ORDERID, MCID, BUYNUM)
values (41, '130917210452004', 8, 1);
insert into T_ORDERDETAIL (DETAILID, ORDERID, MCID, BUYNUM)
values (42, '130917210452004', 7, 1);
insert into T_ORDERDETAIL (DETAILID, ORDERID, MCID, BUYNUM)
values (47, '130917210616004', 13, 1);
insert into T_ORDERDETAIL (DETAILID, ORDERID, MCID, BUYNUM)
values (48, '130917210638004', 20, 1);
insert into T_ORDERDETAIL (DETAILID, ORDERID, MCID, BUYNUM)
values (57, '130917212607004', 20, 1);
insert into T_ORDERDETAIL (DETAILID, ORDERID, MCID, BUYNUM)
values (21, '130917205525004', 2, 1);
insert into T_ORDERDETAIL (DETAILID, ORDERID, MCID, BUYNUM)
values (22, '130917205525004', 3, 2);
insert into T_ORDERDETAIL (DETAILID, ORDERID, MCID, BUYNUM)
values (49, '130917210709004', 4, 1);
insert into T_ORDERDETAIL (DETAILID, ORDERID, MCID, BUYNUM)
values (50, '130917210709004', 15, 1);
insert into T_ORDERDETAIL (DETAILID, ORDERID, MCID, BUYNUM)
values (1, '130917170655004', 1, 1);
insert into T_ORDERDETAIL (DETAILID, ORDERID, MCID, BUYNUM)
values (23, '130917205558004', 4, 1);
insert into T_ORDERDETAIL (DETAILID, ORDERID, MCID, BUYNUM)
values (27, '130917210028004', 17, 1);
insert into T_ORDERDETAIL (DETAILID, ORDERID, MCID, BUYNUM)
values (28, '130917210028004', 7, 1);
insert into T_ORDERDETAIL (DETAILID, ORDERID, MCID, BUYNUM)
values (29, '130917210040004', 11, 1);
insert into T_ORDERDETAIL (DETAILID, ORDERID, MCID, BUYNUM)
values (32, '130917210142004', 5, 1);
insert into T_ORDERDETAIL (DETAILID, ORDERID, MCID, BUYNUM)
values (37, '130917210324004', 15, 1);
insert into T_ORDERDETAIL (DETAILID, ORDERID, MCID, BUYNUM)
values (40, '130917210425004', 9, 1);
insert into T_ORDERDETAIL (DETAILID, ORDERID, MCID, BUYNUM)
values (43, '130917210507004', 15, 1);
insert into T_ORDERDETAIL (DETAILID, ORDERID, MCID, BUYNUM)
values (44, '130917210547004', 1, 1);
insert into T_ORDERDETAIL (DETAILID, ORDERID, MCID, BUYNUM)
values (45, '130917210547004', 12, 1);
insert into T_ORDERDETAIL (DETAILID, ORDERID, MCID, BUYNUM)
values (46, '130917210547004', 10, 1);
insert into T_ORDERDETAIL (DETAILID, ORDERID, MCID, BUYNUM)
values (51, '130917210754004', 4, 1);
insert into T_ORDERDETAIL (DETAILID, ORDERID, MCID, BUYNUM)
values (52, '130917210754004', 11, 1);
insert into T_ORDERDETAIL (DETAILID, ORDERID, MCID, BUYNUM)
values (53, '130917210754004', 10, 1);
insert into T_ORDERDETAIL (DETAILID, ORDERID, MCID, BUYNUM)
values (54, '130917210754004', 17, 1);
insert into T_ORDERDETAIL (DETAILID, ORDERID, MCID, BUYNUM)
values (55, '130917210754004', 3, 1);
commit;