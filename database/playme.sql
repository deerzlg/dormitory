create table tb_user
(
    id        int auto_increment
        primary key,
    user_pwd  varchar(50) null,
    user_name varchar(50) null,
    gender    int         null comment '用户性别：女=0；男=1',
    email     varchar(50) null,
    room_id   int         null,
    user_type int         null comment '角色类型：学生=0；宿舍管理员=1；后勤中心=2'
)
    comment '用户信息表';


create table tb_bill
(
    id          int auto_increment
        primary key,
    bill_year   int    null,
    bill_month  int    null,
    building_id int    null,
    room_id     int    null,
    water_used  double null,
    water_fee   double null,
    energy_used double null,
    energy_fee  double null,
    total_fee   double null,
    paid        int    null comment '是否缴费。0：未交费；1：已缴费。'
)
    comment '水电账单';

create index tb_bill_tb_room_room_id_fk
    on tb_bill (room_id);



create table tb_bookkeeping
(
    id             int auto_increment
        primary key,
    room_id        int         null,
    user_id        int         null,
    bk_money       double      null,
    bk_type        int         null comment '账目的类型：支出=0；收入=1',
    classification int         null comment '分类：
1. 对于支出：水电网=0；餐饮=1；图书=2；游玩=3；电影=4；其它=5。
2. 对于收入：舍费=0；红包=1',
    remark         varchar(50) null,
    bk_time        datetime    null,
    balance        double      null
)
    comment '记账表';



create table tb_building
(
    id            int auto_increment
        primary key,
    building_name varchar(20) null comment '楼栋名',
    floor_num     int         null comment '楼层数',
    liver_gender  int         null comment '此栋楼居住学生性别：女生=0；男生=1',
    manager_id    int         null comment '管理员ID',
    manager_name  varchar(50) null comment '管理员姓名',
    constraint tb_building_tb_user_user_id_fk
        foreign key (manager_id) references tb_user (id)
);


create table tb_exchange
(
    id           int auto_increment
        primary key,
    stu_id       int          null,
    stu_name     varchar(50)  null,
    gender       int          null comment '学生性别：女生=0；男生=1',
    building_id  int          null,
    room_id      int          null,
    ex_reason    varchar(140) null,
    ex_intention varchar(50)  null,
    ex_date      datetime     null,
    ex_status    int          null comment '调换状态：审核中=0，通过=1，未通过=2'
);



create table tb_intention
(
    id           int auto_increment comment '学号'
        primary key,
    stu_name     varchar(50) null,
    gender       int         null comment '性别：女=0；男=1',
    late         int         null comment '是否晚睡：不晚睡=0；晚睡=1',
    noise        int         null comment '是否吵闹：不吵闹=0；吵闹=1',
    late_n_noise int         null comment '行为习惯及意向：不吵闹不晚睡=0；不吵闹晚睡=1；吵闹不晚睡=2；吵闹晚睡=3'
)
    comment '意向信息表';





create table tb_menu
(
    id        int auto_increment
        primary key,
    title     varchar(50)  null comment '标题',
    icon      varchar(50)  null comment '图标',
    href      varchar(100) null comment '链接',
    target    varchar(50)  null comment '目标',
    parent_id int          null,
    user_type int          null comment '菜单类型：学生=0，宿管=1，后勤=2'
)
    comment '功能菜单';



create table tb_notification
(
    id           int auto_increment
        primary key,
    user_id      int          null,
    noti_head    varchar(140) null,
    noti_content varchar(140) null,
    noti_range   int          null comment '通知范围：即宿舍楼编号',
    noti_type    int          null comment '通知类型：一般=0，重要=1',
    noti_date    datetime     null
);


create table tb_repair
(
    id          int auto_increment
        primary key,
    rep_item    varchar(50) null,
    description varchar(50) null,
    rep_date    datetime    null,
    stu_id      int         null,
    building_id int         null,
    room_id     int         null,
    rep_status  int         null comment '维修状态：等待维修=0；维修完成=1',
    rep_man     varchar(50) null
);


create table tb_room
(
    id            int    not null
        primary key,
    building_id   int    null,
    brand         int    null,
    floor         int    null,
    room_capacity int    null comment '房间容量：无人间=0；一人间=1；二人间=2；四人间=4；六人间=6',
    room_status   int    null comment '房间状态：空房间=0；未满=1；已满=2',
    room_type     int    null comment '房间类型：学生寝室=0；宿管寝室=1；后勤办公室=2；招待所=3；小卖部=4；杂物间=5',
    balance       double null comment '舍费余额',
    constraint tb_room_tb_building_id_fk
        foreign key (building_id) references tb_building (id)
);


create table tb_schedule
(
    id           int auto_increment
        primary key,
    user_id      int          null,
    sch_name     varchar(140) null,
    sch_content  varchar(140) null,
    sch_time     datetime     null comment '日程进行时间',
    sch_location varchar(50)  null comment '日程地点',
    sch_priority int          null comment '日程优先级：普通=0；重要=1；极度重要=2'
);



create table tb_user_menu
(
    id        int auto_increment
        primary key,
    user_type int null,
    menu_id   int null
);







INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (10000002, '123M', '兰阿姨', 0, 'lan2003@dorman.com', 171003, 1);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (10000003, '123M', '宋阿姨', 0, 'song2003@dorman.com', 175015, 1);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (10000008, '123M', '杨大爷', 1, 'yang2003@dorman.com', null, 1);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (10000011, '123M', '张大妈', 0, 'zhang2005@dorman.com', null, 1);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (10000018, '123M', '邓阿姨', 0, 'deng2008@dorman.com', null, 1);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (10000023, '123M', '王阿姨', 0, 'wang2010@dorman.com', null, 1);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (10000025, '123M', '林阿姨', 0, 'lin2012@dorman.com', null, 1);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (10000027, '123M', '姜阿姨', 0, 'jiang2013@dorman.com', null, 1);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (10000034, '123M', '李大爷', 1, 'li2016@dorman.com', null, 1);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (10002894, '123456', 'Sherlooock', 1, 'sherlooock@qq.com', 112033, 1);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (19200002, '123A', 'tester', 0, 'test@test.test', 121029, 2);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (20000000, '123A', '222', 0, 'AppleStore', 175015, 0);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (20030143, '123A', 'Admin', 1, 'admin@dormitory.cn', 11005, 2);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (20160811, '123456', 'real_lymq', 1, 'asgar0dia@qq.com', 171010, 0);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (20160812, '1234561', 'fake_lymq', 0, 'fk_lymq@163.com', 11005, 1);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (20192202, '123456', 'Eva', 0, 'eva@gmail.com', 171010, 0);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (20192893, '123456', 'Lena', 0, 'lena@temp.com', 171010, 0);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (20192895, '123456', 'euria', 0, 'euria@gmail.com', 123009, 0);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (20200011, '123L', 'Linda', 0, 'linda@linda.linda', 171010, 0);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (20200012, '123456', 'Nymeria', 0, 'nymeria@qq.com', 171010, 0);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (20200035, '123S', 'Silk', 1, 'silk@onedrive.com', 171001, 1);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (20200394, '123456', 'Silky', 1, 'real_silk@onedrive.com', 119290, 0);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (20215816, '123456', '徐淮南', 1, null, 11002, 0);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (20218964, '123456', '徐偃兵', 1, null, 11003, 0);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (20219283, null, '李淳罡', 1, null, 11004, 0);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (20220291, null, '温华', 1, null, 141004, 0);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (20220304, '123456', '邓太阿', 1, null, 141004, 0);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (20222922, '123456', '洪洗象', 1, null, 141003, 0);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (20228281, null, '吴六鼎', 1, null, 141003, 0);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (20229213, '123455', 'Amen', 1, 'amen@qq.com', 71002, 0);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (20229383, null, '赵希抟', 1, null, 123009, 0);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (20229814, '123456', '徐北栀', 1, null, 141004, 0);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (20229815, '123456', 'lymq', 1, '201998273@qq.com', 122001, 0);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (20239214, '123456', '周俞莹', 0, null, 21002, 0);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (20239215, '123456', '赖展文', 0, null, 21002, 0);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (20239216, '123456', '汪访云', 0, null, 21002, 0);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (20239217, '123456', '赵轶丽', 0, null, 21002, 0);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (20239218, '123456', '徐金枝', 0, null, 21003, 0);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (20239219, '123456', '崔素欣', 0, null, 21003, 0);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (20239220, '123456', '余婷婷', 0, null, 21003, 0);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (20239221, '123456', '范琴韵', 0, null, 21003, 0);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (20239222, '123456', '夏静芙', 0, null, 21004, 0);




INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317001, 2021, 3, 17, 171001, 7.34, 17.62, 12.46, 6.48, 24.1, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317002, 2021, 3, 17, 171002, 9.08, 21.79, 16.89, 8.78, 30.57, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317003, 2021, 3, 17, 171003, 7.84, 18.82, 32.6, 16.95, 35.77, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317004, 2021, 3, 17, 171004, 17.95, 43.08, 59.89, 31.14, 74.22, 1);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317005, 2021, 3, 17, 171005, 8.38, 20.11, 20.12, 10.46, 30.57, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317006, 2021, 3, 17, 171006, 9.13, 21.91, 12.68, 6.59, 28.51, 1);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317007, 2021, 3, 17, 171007, 7.33, 17.59, 31.69, 16.48, 34.07, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317008, 2021, 3, 17, 171008, 7.62, 18.29, 50.98, 26.51, 44.8, 1);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317009, 2021, 3, 17, 171009, 7.24, 17.38, 15.05, 7.83, 25.2, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317010, 2021, 3, 17, 171010, 6.14, 14.74, 15.74, 8.18, 22.92, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317011, 2021, 3, 17, 171011, 9.78, 23.47, 20.16, 10.48, 33.96, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317012, 2021, 3, 17, 171012, 7.25, 17.4, 36.02, 18.73, 36.13, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317013, 2021, 3, 17, 171013, 9.86, 23.66, 32.45, 16.87, 40.54, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317014, 2021, 3, 17, 171014, 7.67, 18.41, 171.46, 89.16, 107.57, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317015, 2021, 3, 17, 171015, 8.42, 20.21, 17.74, 9.22, 29.43, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317016, 2021, 3, 17, 171016, 9.15, 21.96, 12.7, 6.6, 28.56, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317017, 2021, 3, 17, 171017, 7.98, 19.15, 10.7, 5.56, 24.72, 1);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317018, 2021, 3, 17, 171018, 19.55, 46.92, 30.58, 15.9, 62.82, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317019, 2021, 3, 17, 171019, 8.45, 20.28, 25.3, 13.16, 33.44, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317020, 2021, 3, 17, 171020, 6.54, 15.7, 107.19, 55.74, 71.43, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317021, 2021, 3, 17, 172001, 5.89, 14.14, 15.21, 7.91, 22.05, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317022, 2021, 3, 17, 172002, 5.33, 12.79, 21.27, 11.06, 23.85, 2);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317023, 2021, 3, 17, 172003, 9.83, 23.59, 39.85, 20.72, 44.31, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317024, 2021, 3, 17, 172004, 7.09, 17.02, 24.43, 12.7, 29.72, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317025, 2021, 3, 17, 172005, 8.44, 20.26, 18.46, 9.6, 29.86, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317026, 2021, 3, 17, 172006, 6.96, 16.7, 26.19, 13.62, 30.32, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317027, 2021, 3, 17, 172007, 6.72, 16.13, 10.85, 5.64, 21.77, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317028, 2021, 3, 17, 172008, 5.78, 13.87, 25.87, 13.45, 27.32, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317029, 2021, 3, 17, 172009, 5.78, 13.87, 30.74, 15.98, 29.86, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317030, 2021, 3, 17, 172010, 8.81, 21.14, 16.55, 8.61, 29.75, 1);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317031, 2021, 3, 17, 172011, 11.8, 28.32, 21.05, 10.95, 39.27, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317032, 2021, 3, 17, 172012, 8.14, 19.54, 50.73, 26.38, 45.92, 2);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317033, 2021, 3, 17, 172013, 5.14, 12.34, 28.61, 14.88, 27.21, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317034, 2021, 3, 17, 172014, 7.52, 18.05, 24.18, 12.57, 30.62, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317035, 2021, 3, 17, 172015, 19.76, 47.42, 31.89, 16.58, 64.01, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317036, 2021, 3, 17, 172016, 5.87, 14.09, 17.26, 8.98, 23.06, 1);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317037, 2021, 3, 17, 172017, 6.76, 16.22, 185.52, 96.47, 112.69, 1);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317038, 2021, 3, 17, 172018, 5.75, 13.8, 29.86, 15.53, 29.33, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317039, 2021, 3, 17, 172019, 8.1, 19.44, 98.31, 51.12, 70.56, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317040, 2021, 3, 17, 172020, 7.38, 17.71, 16.12, 8.38, 26.09, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317041, 2021, 3, 17, 173001, 12.07, 28.97, 26.44, 13.75, 42.72, 2);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317042, 2021, 3, 17, 173002, 9.59, 23.02, 17.5, 9.1, 32.12, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317043, 2021, 3, 17, 173003, 5.43, 13.03, 31.02, 16.13, 29.16, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317044, 2021, 3, 17, 173004, 6.61, 15.86, 23.85, 12.4, 28.27, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317045, 2021, 3, 17, 173005, 9.63, 23.11, 32.98, 17.15, 40.26, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317046, 2021, 3, 17, 173006, 6.4, 15.36, 28.58, 14.86, 30.22, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317047, 2021, 3, 17, 173007, 8.75, 21, 15.95, 8.29, 29.29, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317048, 2021, 3, 17, 173008, 5.14, 12.34, 23.97, 12.46, 24.8, 2);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317049, 2021, 3, 17, 173009, 6.4, 15.36, 30.17, 15.69, 31.05, 1);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317050, 2021, 3, 17, 173010, 9.37, 22.49, 58.04, 30.18, 52.67, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317051, 2021, 3, 17, 173011, 5.23, 12.55, 29.69, 15.44, 27.99, 1);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317052, 2021, 3, 17, 173012, 8.16, 19.58, 41.38, 21.52, 41.1, 1);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317053, 2021, 3, 17, 173013, 6.27, 15.05, 49.4, 25.69, 40.74, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317054, 2021, 3, 17, 173014, 6.65, 15.96, 67.96, 35.34, 51.3, 2);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317055, 2021, 3, 17, 173015, 6.02, 14.45, 18.62, 9.68, 24.13, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317056, 2021, 3, 17, 173016, 8.74, 20.98, 133.49, 69.41, 90.39, 1);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317057, 2021, 3, 17, 173017, 9.8, 23.52, 25.89, 13.46, 36.98, 1);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317058, 2021, 3, 17, 173018, 7.94, 19.06, 42.47, 22.08, 41.14, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317059, 2021, 3, 17, 173019, 8.73, 20.95, 31.08, 16.16, 37.11, 1);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317060, 2021, 3, 17, 173020, 17.93, 43.03, 34.51, 17.95, 60.98, 1);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317061, 2021, 3, 17, 174001, 7.44, 17.86, 14.45, 7.51, 25.37, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317062, 2021, 3, 17, 174002, 7.81, 18.74, 34.49, 17.93, 36.68, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317063, 2021, 3, 17, 174003, 9.79, 23.5, 31.54, 16.4, 39.9, 1);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317064, 2021, 3, 17, 174004, 17.76, 42.62, 45.29, 23.55, 66.17, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317065, 2021, 3, 17, 174005, 8.28, 19.87, 24.66, 12.82, 32.7, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317066, 2021, 3, 17, 174006, 7.5, 18, 31.11, 16.18, 34.18, 1);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317067, 2021, 3, 17, 174007, 7.73, 18.55, 22.44, 11.67, 30.22, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317068, 2021, 3, 17, 174008, 9.63, 23.11, 29.64, 15.41, 38.52, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317069, 2021, 3, 17, 174009, 6.59, 15.82, 33.85, 17.6, 33.42, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317070, 2021, 3, 17, 174010, 7.88, 18.91, 34.21, 17.79, 36.7, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317071, 2021, 3, 17, 174011, 8.73, 20.95, 13.49, 7.01, 27.97, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317072, 2021, 3, 17, 174012, 7.17, 17.21, 20.94, 10.89, 28.1, 1);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317073, 2021, 3, 17, 174013, 9.95, 23.88, 28.71, 14.93, 38.81, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317074, 2021, 3, 17, 174014, 5.94, 14.26, 89.39, 46.48, 60.74, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317075, 2021, 3, 17, 174015, 7.54, 18.1, 28.87, 15.01, 33.11, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317076, 2021, 3, 17, 174016, 8.74, 20.98, 17.45, 9.07, 30.05, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317077, 2021, 3, 17, 174017, 9.67, 23.21, 20.02, 10.41, 33.62, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317078, 2021, 3, 17, 174018, 6.24, 14.98, 24.15, 12.56, 27.53, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317079, 2021, 3, 17, 174019, 8.13, 19.51, 12.06, 6.27, 25.78, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317080, 2021, 3, 17, 174020, 8.98, 21.55, 10.82, 5.63, 27.18, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317081, 2021, 3, 17, 175001, 9.79, 23.5, 15.39, 8, 31.5, 1);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317082, 2021, 3, 17, 175002, 7.97, 19.13, 12.54, 6.52, 25.65, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317083, 2021, 3, 17, 175003, 8.91, 21.38, 24.73, 12.86, 34.24, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317084, 2021, 3, 17, 175004, 7.27, 17.45, 33.34, 17.34, 34.78, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317085, 2021, 3, 17, 175005, 6.15, 14.76, 19.6, 10.19, 24.95, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317086, 2021, 3, 17, 175006, 8.37, 20.09, 131.37, 68.31, 88.4, 1);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317087, 2021, 3, 17, 175007, 15.51, 37.22, 32.88, 17.1, 54.32, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317088, 2021, 3, 17, 175008, 7.33, 17.59, 32.54, 16.92, 34.51, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317089, 2021, 3, 17, 175009, 6.3, 15.12, 22.06, 11.47, 26.59, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317090, 2021, 3, 17, 175010, 6.49, 15.58, 32.91, 17.11, 32.69, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317091, 2021, 3, 17, 175011, 5, 12, 17.71, 9.21, 21.21, 1);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317092, 2021, 3, 17, 175012, 7.53, 18.07, 51.09, 26.57, 44.64, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317093, 2021, 3, 17, 175013, 8.12, 19.49, 34.64, 18.01, 37.5, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317094, 2021, 3, 17, 175014, 8.38, 20.11, 50.54, 26.28, 46.39, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317095, 2021, 3, 17, 175015, 9.09, 21.82, 22.43, 11.66, 33.48, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317096, 2021, 3, 17, 175016, 8.87, 21.29, 26.53, 13.8, 35.08, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317097, 2021, 3, 17, 175017, 8.03, 19.27, 18.97, 9.86, 29.14, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317098, 2021, 3, 17, 175018, 9.1, 21.84, 37.61, 19.56, 41.4, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317099, 2021, 3, 17, 175019, 9.61, 23.06, 26.56, 13.81, 36.88, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210317100, 2021, 3, 17, 175020, 7.47, 17.93, 23.95, 12.45, 30.38, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210417101, 2021, 4, 17, 171001, 9.16, 21.98, 23.85, 12.4, 34.39, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210417102, 2021, 4, 17, 171002, 6.84, 16.42, 15.4, 8.01, 24.42, 0);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210417103, 2021, 1, 17, 171002, 102.84, 246.82, 392.65, 204.18, 451, 1);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210417104, 2021, 2, 17, 171002, 6.84, 16.42, 15.4, 8.01, 24.42, 1);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210417105, 2021, 5, 17, 171002, 40.32, 96.77, 398.4, 207.17, 303.94, 1);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210417106, 2021, 6, 17, 171002, 1320.23, 1768.55, 1783.4, 1407.37, 3175.92, 1);
INSERT INTO tb_bill (id, bill_year, bill_month, building_id, room_id, water_used, water_fee, energy_used, energy_fee, total_fee, paid) VALUES (210417107, 2021, 2, 17, 171010, 400, 960, 1000, 520, 1480, 1);





INSERT INTO tb_bookkeeping (id, room_id, user_id, bk_money, bk_type, classification, remark, bk_time, balance) VALUES (171010001, 171010, 20200011, 40, 0, 0, '桶装水', '2021-06-03 08:22:33', 80);
INSERT INTO tb_bookkeeping (id, room_id, user_id, bk_money, bk_type, classification, remark, bk_time, balance) VALUES (171010002, 171010, 20200011, 100, 1, 0, '舍费', '2021-06-02 08:22:42', 180);
INSERT INTO tb_bookkeeping (id, room_id, user_id, bk_money, bk_type, classification, remark, bk_time, balance) VALUES (171011005, 171011, 20200015, 10, 0, 0, '桶装水', '2021-05-14 08:22:33', 40);
INSERT INTO tb_bookkeeping (id, room_id, user_id, bk_money, bk_type, classification, remark, bk_time, balance) VALUES (171011006, 171010, 20192202, 85, 0, 0, '水电费', '2021-06-02 14:35:33', null);
INSERT INTO tb_bookkeeping (id, room_id, user_id, bk_money, bk_type, classification, remark, bk_time, balance) VALUES (171011008, 171010, 20192893, 240.8, 0, 3, '太古里', '2021-06-02 14:35:42', null);
INSERT INTO tb_bookkeeping (id, room_id, user_id, bk_money, bk_type, classification, remark, bk_time, balance) VALUES (171011009, 171010, 20192893, 225, 0, 1, '海底捞', '2021-06-01 14:50:18', null);
INSERT INTO tb_bookkeeping (id, room_id, user_id, bk_money, bk_type, classification, remark, bk_time, balance) VALUES (171011010, 171010, 20200011, 308, 0, 1, '烤鸭', '2021-06-01 14:50:23', null);
INSERT INTO tb_bookkeeping (id, room_id, user_id, bk_money, bk_type, classification, remark, bk_time, balance) VALUES (171011011, 171010, 20192893, 140, 0, 4, 'F9', '2021-06-02 14:50:29', null);
INSERT INTO tb_bookkeeping (id, room_id, user_id, bk_money, bk_type, classification, remark, bk_time, balance) VALUES (171011012, 171010, 20192893, 96.5, 0, 4, '沙丘', '2021-06-01 14:50:35', null);
INSERT INTO tb_bookkeeping (id, room_id, user_id, bk_money, bk_type, classification, remark, bk_time, balance) VALUES (171011013, 171010, 20192202, 199, 0, 5, '瑜伽垫', '2021-06-01 14:50:44', null);
INSERT INTO tb_bookkeeping (id, room_id, user_id, bk_money, bk_type, classification, remark, bk_time, balance) VALUES (171011014, 171010, 20192202, 223, 0, 5, '眼罩', '2021-06-02 21:19:13', null);
INSERT INTO tb_bookkeeping (id, room_id, user_id, bk_money, bk_type, classification, remark, bk_time, balance) VALUES (171011015, 171010, 20192202, 128, 0, 0, null, '2021-03-01 16:55:17', null);
INSERT INTO tb_bookkeeping (id, room_id, user_id, bk_money, bk_type, classification, remark, bk_time, balance) VALUES (171011016, 171010, 20192202, 38, 0, 1, null, '2021-03-04 16:55:33', null);
INSERT INTO tb_bookkeeping (id, room_id, user_id, bk_money, bk_type, classification, remark, bk_time, balance) VALUES (171011018, 171010, 20192202, 35, 0, 3, null, '2021-03-04 16:55:40', null);
INSERT INTO tb_bookkeeping (id, room_id, user_id, bk_money, bk_type, classification, remark, bk_time, balance) VALUES (171011019, 171010, 20192202, 129, 0, 4, null, '2021-03-04 16:55:44', null);
INSERT INTO tb_bookkeeping (id, room_id, user_id, bk_money, bk_type, classification, remark, bk_time, balance) VALUES (171011020, 171010, 20192202, 49, 0, 5, null, '2021-03-04 16:55:47', null);
INSERT INTO tb_bookkeeping (id, room_id, user_id, bk_money, bk_type, classification, remark, bk_time, balance) VALUES (171011021, 171010, 20192202, 180, 0, 0, null, '2021-04-01 16:55:51', null);
INSERT INTO tb_bookkeeping (id, room_id, user_id, bk_money, bk_type, classification, remark, bk_time, balance) VALUES (171011022, 171010, 20200011, 384.5, 0, 1, null, '2021-04-05 18:46:47', null);
INSERT INTO tb_bookkeeping (id, room_id, user_id, bk_money, bk_type, classification, remark, bk_time, balance) VALUES (171011024, 171010, 20200011, 92, 0, 3, null, '2021-04-04 18:47:03', null);
INSERT INTO tb_bookkeeping (id, room_id, user_id, bk_money, bk_type, classification, remark, bk_time, balance) VALUES (171011025, 171010, 20200011, 270, 0, 4, null, '2021-04-04 18:47:08', null);
INSERT INTO tb_bookkeeping (id, room_id, user_id, bk_money, bk_type, classification, remark, bk_time, balance) VALUES (171011026, 171010, 20200011, 39, 0, 5, null, '2021-04-04 18:48:33', null);
INSERT INTO tb_bookkeeping (id, room_id, user_id, bk_money, bk_type, classification, remark, bk_time, balance) VALUES (171011027, 171010, 20200011, 82.3, 0, 0, null, '2021-05-04 18:48:40', null);
INSERT INTO tb_bookkeeping (id, room_id, user_id, bk_money, bk_type, classification, remark, bk_time, balance) VALUES (171011028, 171010, 20200011, 94.3, 0, 1, null, '2021-05-04 18:48:44', null);
INSERT INTO tb_bookkeeping (id, room_id, user_id, bk_money, bk_type, classification, remark, bk_time, balance) VALUES (171011030, 171010, 20200011, 157.8, 0, 3, null, '2021-05-04 18:48:54', null);
INSERT INTO tb_bookkeeping (id, room_id, user_id, bk_money, bk_type, classification, remark, bk_time, balance) VALUES (171011031, 171010, 20200011, 28.5, 0, 4, null, '2021-05-04 18:49:01', null);
INSERT INTO tb_bookkeeping (id, room_id, user_id, bk_money, bk_type, classification, remark, bk_time, balance) VALUES (171011032, 171010, 20200011, 130, 0, 5, null, '2021-05-04 18:49:07', null);
INSERT INTO tb_bookkeeping (id, room_id, user_id, bk_money, bk_type, classification, remark, bk_time, balance) VALUES (171011049, 171010, 20200011, 40, 0, 2, '而已集', '2021-06-03 17:15:36', null);
INSERT INTO tb_bookkeeping (id, room_id, user_id, bk_money, bk_type, classification, remark, bk_time, balance) VALUES (171011050, 171010, 20200011, 30, 0, 2, null, '2021-05-06 17:15:40', null);
INSERT INTO tb_bookkeeping (id, room_id, user_id, bk_money, bk_type, classification, remark, bk_time, balance) VALUES (171011051, 171010, 20200011, 40, 0, 2, null, '2021-04-06 17:15:44', null);
INSERT INTO tb_bookkeeping (id, room_id, user_id, bk_money, bk_type, classification, remark, bk_time, balance) VALUES (171011052, 171010, 20200011, 80, 0, 2, null, '2021-03-06 19:31:44', null);
INSERT INTO tb_bookkeeping (id, room_id, user_id, bk_money, bk_type, classification, remark, bk_time, balance) VALUES (171011056, 171010, 20200011, 1000, 1, 0, '红包', '2021-06-01 15:51:47', null);




INSERT INTO tb_building (id, building_name, floor_num, liver_gender, manager_id, manager_name) VALUES (1, '必贵园', 13, 1, 10000018, null);
INSERT INTO tb_building (id, building_name, floor_num, liver_gender, manager_id, manager_name) VALUES (2, '开心楼', 8, 0, 10000008, null);
INSERT INTO tb_building (id, building_name, floor_num, liver_gender, manager_id, manager_name) VALUES (3, '丹桂园', 6, 1, 10000025, null);
INSERT INTO tb_building (id, building_name, floor_num, liver_gender, manager_id, manager_name) VALUES (4, '修身楼', 6, 1, 20160812, null);
INSERT INTO tb_building (id, building_name, floor_num, liver_gender, manager_id, manager_name) VALUES (5, '淡泊楼', 7, 1, 10000003, null);
INSERT INTO tb_building (id, building_name, floor_num, liver_gender, manager_id, manager_name) VALUES (6, '紫云阁', 6, 1, 10000023, null);
INSERT INTO tb_building (id, building_name, floor_num, liver_gender, manager_id, manager_name) VALUES (7, '夕可楼', 5, 0, 10000034, null);
INSERT INTO tb_building (id, building_name, floor_num, liver_gender, manager_id, manager_name) VALUES (8, '京城居', 6, 0, 10000034, null);
INSERT INTO tb_building (id, building_name, floor_num, liver_gender, manager_id, manager_name) VALUES (9, '梦仙阁', 6, 1, null, null);
INSERT INTO tb_building (id, building_name, floor_num, liver_gender, manager_id, manager_name) VALUES (10, '开放楼', 7, 1, null, null);
INSERT INTO tb_building (id, building_name, floor_num, liver_gender, manager_id, manager_name) VALUES (11, '文轩苑', 8, 1, 10000011, null);
INSERT INTO tb_building (id, building_name, floor_num, liver_gender, manager_id, manager_name) VALUES (12, '杏林楼', 6, 1, 10000025, null);
INSERT INTO tb_building (id, building_name, floor_num, liver_gender, manager_id, manager_name) VALUES (13, '梧桐苑', 6, 0, null, null);
INSERT INTO tb_building (id, building_name, floor_num, liver_gender, manager_id, manager_name) VALUES (14, '妙手阁', 4, 1, 10000008, null);
INSERT INTO tb_building (id, building_name, floor_num, liver_gender, manager_id, manager_name) VALUES (15, '白雪楼', 10, 0, null, null);
INSERT INTO tb_building (id, building_name, floor_num, liver_gender, manager_id, manager_name) VALUES (16, '雅淑居', 7, 0, 10000002, null);
INSERT INTO tb_building (id, building_name, floor_num, liver_gender, manager_id, manager_name) VALUES (17, '听雨轩', 8, 0, 20200035, null);





INSERT INTO tb_exchange (id, stu_id, stu_name, gender, building_id, room_id, ex_reason, ex_intention, ex_date, ex_status) VALUES (1092834, 20200011, 'Linda', 0, 17, 171010, '离教学楼太远', '希望能换到14栋', '2021-02-19 10:06:09', 2);
INSERT INTO tb_exchange (id, stu_id, stu_name, gender, building_id, room_id, ex_reason, ex_intention, ex_date, ex_status) VALUES (1092835, 20192895, 'euria', 0, 12, 123009, '楼层太低，阳光被挡', '可否换到3楼以上', '2021-02-28 10:06:15', 1);
INSERT INTO tb_exchange (id, stu_id, stu_name, gender, building_id, room_id, ex_reason, ex_intention, ex_date, ex_status) VALUES (1092841, 20200011, 'Linda', 0, 17, 171010, '宿舍太吵', '换到1人间', '2021-04-07 10:08:40', 0);
INSERT INTO tb_exchange (id, stu_id, stu_name, gender, building_id, room_id, ex_reason, ex_intention, ex_date, ex_status) VALUES (1092844, 20200011, 'Linda', 0, 17, 171010, '楼层太高！', '希望换到1楼或2楼', '2021-05-08 20:32:50', 0);




INSERT INTO tb_menu (id, title, icon, href, target, parent_id, user_type) VALUES (1011, '个人信息', null, 'student/info.html', null, 0, null);
INSERT INTO tb_menu (id, title, icon, href, target, parent_id, user_type) VALUES (1021, '通知公告', null, 'notificationstu/list.html', null, 0, null);
INSERT INTO tb_menu (id, title, icon, href, target, parent_id, user_type) VALUES (1031, '调换申请', null, 'exchangestu/list.html', null, 0, null);
INSERT INTO tb_menu (id, title, icon, href, target, parent_id, user_type) VALUES (1032, '维修申请', null, 'repairstu/list.html', null, 0, null);
INSERT INTO tb_menu (id, title, icon, href, target, parent_id, user_type) VALUES (1041, '日程管理', null, 'schedule/list.html', null, 0, null);
INSERT INTO tb_menu (id, title, icon, href, target, parent_id, user_type) VALUES (1051, '记账管理', null, 'bookkeeping/list.html', null, 0, null);
INSERT INTO tb_menu (id, title, icon, href, target, parent_id, user_type) VALUES (1111, '通知发布', null, 'notification/list.html', null, 0, null);
INSERT INTO tb_menu (id, title, icon, href, target, parent_id, user_type) VALUES (1121, '水电账单', null, 'bill/upload.html', null, 0, null);
INSERT INTO tb_menu (id, title, icon, href, target, parent_id, user_type) VALUES (1131, '维修处理', null, 'repair/list.html', null, 0, null);
INSERT INTO tb_menu (id, title, icon, href, target, parent_id, user_type) VALUES (1211, '用户管理', null, 'user/list.html', null, 0, null);
INSERT INTO tb_menu (id, title, icon, href, target, parent_id, user_type) VALUES (1221, '调换审核', null, 'exchange/list.html', null, 0, null);
INSERT INTO tb_menu (id, title, icon, href, target, parent_id, user_type) VALUES (1231, '楼宇管理', null, 'building/list.html', null, 0, null);
INSERT INTO tb_menu (id, title, icon, href, target, parent_id, user_type) VALUES (1232, '房间管理', null, 'room/list.html', null, 0, null);
INSERT INTO tb_menu (id, title, icon, href, target, parent_id, user_type) VALUES (1241, '宿舍分配', null, 'intention/arrange.html', null, 0, null);





INSERT INTO tb_notification (id, user_id, noti_head, noti_content, noti_range, noti_type, noti_date) VALUES (180293401, 20200035, '后天下午停电', '后天（4月4日）下午3:00~5:00，17栋停电', 17, 1, '2021-04-02 11:49:17');
INSERT INTO tb_notification (id, user_id, noti_head, noti_content, noti_range, noti_type, noti_date) VALUES (180293402, 20200035, '大功率电器检查', '5月4日~5月8日随机抽查大功率电器使用情况', 17, 0, '2021-05-01 11:53:00');
INSERT INTO tb_notification (id, user_id, noti_head, noti_content, noti_range, noti_type, noti_date) VALUES (180293403, 20200035, '明日特大暴雨', '明天白天有特大暴雨，请尽量待在宿舍，避免外出!!!', 17, 1, '2021-05-22 12:34:09');
INSERT INTO tb_notification (id, user_id, noti_head, noti_content, noti_range, noti_type, noti_date) VALUES (180293407, 20200035, '失物招领', '遗失一张尾号为2093的校园卡的同学请到17栋1001取回丢失的卡片', 17, 0, '2021-05-29 12:54:31');
INSERT INTO tb_notification (id, user_id, noti_head, noti_content, noti_range, noti_type, noti_date) VALUES (180293410, 20200011, '下午开班会', '下午2:00~2:50在R5032开班会', 0, 0, '2021-04-27 08:19:54');
INSERT INTO tb_notification (id, user_id, noti_head, noti_content, noti_range, noti_type, noti_date) VALUES (180293411, 20192202, '帮忙带份午饭吧', '一份黄焖鸡米饭，不加辣椒。跑路费20块', 0, 0, '2021-05-06 08:21:09');
INSERT INTO tb_notification (id, user_id, noti_head, noti_content, noti_range, noti_type, noti_date) VALUES (180293412, 20192893, '下周二考试', '明早开始在图书馆集合', 0, 1, '2021-05-30 08:22:51');
INSERT INTO tb_notification (id, user_id, noti_head, noti_content, noti_range, noti_type, noti_date) VALUES (180293413, 20192895, '本周卫生安排', '周一：euria；周二：arya', 0, 0, '2021-04-26 08:25:01');
INSERT INTO tb_notification (id, user_id, noti_head, noti_content, noti_range, noti_type, noti_date) VALUES (180293414, 20229383, '水电缴费', '总计28.5元', 0, 0, '2021-06-02 08:32:51');
INSERT INTO tb_notification (id, user_id, noti_head, noti_content, noti_range, noti_type, noti_date) VALUES (180293427, 20200035, '宽带提速', '7月1日起，所有房间宽带免费升级至千兆。届时下载速度峰值将会提升至130Mb/s', 17, 0, '2021-06-01 10:10:20');
INSERT INTO tb_notification (id, user_id, noti_head, noti_content, noti_range, noti_type, noti_date) VALUES (180293428, 20200011, '不许剧透Loki！', '剧透者删除好友一个月', 0, 1, '2021-06-02 10:20:35');





INSERT INTO tb_repair (id, rep_item, description, rep_date, stu_id, building_id, room_id, rep_status, rep_man) VALUES (10200302, '椅子', '椅子被某人坐断了一条腿', '2021-02-11 10:07:05', 20229815, 12, 122001, 1, null);
INSERT INTO tb_repair (id, rep_item, description, rep_date, stu_id, building_id, room_id, rep_status, rep_man) VALUES (10200303, '插座', '宿舍门左侧的插座不通电', '2021-02-16 09:45:17', 20200394, 14, 142023, 1, '张师傅');
INSERT INTO tb_repair (id, rep_item, description, rep_date, stu_id, building_id, room_id, rep_status, rep_man) VALUES (10200305, '水龙头', '阳台水龙头不能完全拧紧', '2021-03-10 11:07:53', 20200011, 17, 171010, 1, null);
INSERT INTO tb_repair (id, rep_item, description, rep_date, stu_id, building_id, room_id, rep_status, rep_man) VALUES (10200306, '门', '刚搬进来就是坏的', '2021-03-13 10:06:57', 20192895, 12, 123009, 1, '黄诗扶');
INSERT INTO tb_repair (id, rep_item, description, rep_date, stu_id, building_id, room_id, rep_status, rep_man) VALUES (10200307, '门锁', '周围寝室的钥匙都能打开我们寝室的门', '2021-03-15 13:24:09', 20160811, 11, 115001, 0, null);
INSERT INTO tb_repair (id, rep_item, description, rep_date, stu_id, building_id, room_id, rep_status, rep_man) VALUES (10200308, '风扇', '风扇不能制热', '2021-03-22 11:01:03', 20192893, 17, 171010, 2, null);
INSERT INTO tb_repair (id, rep_item, description, rep_date, stu_id, building_id, room_id, rep_status, rep_man) VALUES (10200312, '厕所镜子', '因冷热交替而裂开', '2021-04-01 13:24:06', 20192202, 17, 171010, 1, null);
INSERT INTO tb_repair (id, rep_item, description, rep_date, stu_id, building_id, room_id, rep_status, rep_man) VALUES (10200316, '花花', '她枯萎了！', '2021-04-10 11:59:21', 20200011, 17, 171010, 2, null);
INSERT INTO tb_repair (id, rep_item, description, rep_date, stu_id, building_id, room_id, rep_status, rep_man) VALUES (10200317, '厕所水管', '水管爆裂', '2021-04-20 13:15:23', 20200011, 17, 171010, 1, null);
INSERT INTO tb_repair (id, rep_item, description, rep_date, stu_id, building_id, room_id, rep_status, rep_man) VALUES (10200318, '春天', 'SpringBoot出bug了...', '2021-05-15 18:04:57', 20200011, 17, 171010, 0, null);
INSERT INTO tb_repair (id, rep_item, description, rep_date, stu_id, building_id, room_id, rep_status, rep_man) VALUES (10200324, 'repair_item', 'repair_description', '2021-05-08 20:35:03', 20200011, 17, 171010, 0, null);




INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (11001, 1, 1001, 1, 4, null, 1, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (11002, 1, 1002, 1, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (11003, 1, 1003, 1, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (11004, 1, 1004, 1, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (11005, 1, 1005, 1, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (11006, 1, 1006, 1, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (11007, 1, 1007, 1, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (11008, 1, 1008, 1, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (11009, 1, 1009, 1, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (11010, 1, 1010, 1, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (12001, 1, 2001, 2, 4, null, 2, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (12002, 1, 2002, 2, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (12003, 1, 2003, 2, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (12004, 1, 2004, 2, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (12005, 1, 2005, 2, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (12006, 1, 2006, 2, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (12007, 1, 2007, 2, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (12008, 1, 2008, 2, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (12009, 1, 2009, 2, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (12010, 1, 2010, 2, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (13001, 1, 3001, 3, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (13002, 1, 3002, 3, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (13003, 1, 3003, 3, 8, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (21001, 2, 1001, 1, 4, null, 1, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (21002, 2, 1002, 1, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (21003, 2, 1003, 1, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (21004, 2, 1004, 1, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (21005, 2, 1005, 1, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (21006, 2, 1006, 1, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (21007, 2, 1007, 1, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (21008, 2, 1008, 1, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (21009, 2, 1009, 1, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (21010, 2, 1010, 1, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (22001, 2, 2001, 2, 4, null, 2, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (22002, 2, 2002, 2, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (22003, 2, 2003, 2, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (22004, 2, 2004, 2, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (22005, 2, 2005, 2, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (22006, 2, 2006, 2, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (22007, 2, 2007, 2, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (22008, 2, 2008, 2, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (22009, 2, 2009, 2, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (22010, 2, 2010, 2, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (23001, 2, 3001, 3, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (23002, 2, 3002, 3, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (23003, 2, 3003, 3, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (24001, 2, 4001, 4, 4, 2, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (25011, 2, 5011, 5, 6, 2, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (31001, 3, 1001, 1, 2, null, 1, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (32001, 3, 2001, 2, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (41001, 4, 1001, 1, 1, null, 2, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (42001, 4, 2001, 2, 6, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (51001, 5, 1001, 1, 2, null, 1, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (52001, 5, 2001, 2, 6, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (52002, 5, 2002, 2, 6, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (52004, 5, 2004, 2, 6, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (52006, 5, 2006, 2, 6, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (61001, 6, 1001, 1, 2, null, 2, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (62001, 6, 2001, 2, 6, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (71001, 7, 1001, 1, 1, null, 1, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (71002, 7, 1002, 1, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (72001, 7, 2001, 2, 6, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (81001, 8, 1001, 1, 1, null, 4, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (82001, 8, 2001, 2, 6, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (91001, 9, 1001, 1, 1, null, 3, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (92001, 9, 2001, 2, 6, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (92002, 9, 2002, 2, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (101001, 10, 1001, 1, 2, null, 1, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (102001, 10, 2001, 2, 6, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (111001, 11, 1001, 1, 1, null, 1, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (112001, 11, 2001, 2, 6, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (115001, 11, 5001, 5, 6, 1, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (121001, 12, 1001, 1, 1, null, 2, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (122001, 12, 2001, 2, 2, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (123009, 12, 3009, 3, 4, 2, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (131001, 13, 1001, 1, 2, null, 3, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (132001, 13, 2001, 2, 6, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (132002, 13, 2002, 2, 6, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (141001, 14, 1001, 1, 1, 1, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (141002, 14, 1002, 1, 2, 2, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (141003, 14, 1003, 1, 2, 0, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (141004, 14, 1004, 1, 6, 2, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (142023, 14, 2023, 2, 4, 1, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (151001, 15, 1001, 1, 1, null, 4, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (152001, 15, 2001, 2, 6, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (161001, 16, 1001, 1, 1, 2, 1, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (161002, 16, 1002, 1, 2, 2, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (171001, 17, 1001, 1, 7, 2, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (171002, 17, 1002, 1, 1, null, 4, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (171003, 17, 1003, 1, 1, null, 1, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (171009, 17, 1009, 1, 4, 1, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (171010, 17, 1010, 1, 5, 2, 0, 2905);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (172001, 17, 2001, 2, 6, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (173001, 17, 3001, 3, 6, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (173003, 17, 3003, 3, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (173009, 17, 3009, 3, 2, null, 4, null);







INSERT INTO tb_schedule (id, user_id, sch_name, sch_content, sch_time, sch_location, sch_priority) VALUES (1, 20200011, 'PPT', '完成中期检查相关PPT', '2021-04-06 17:16:25', '我的宿舍', 1);
INSERT INTO tb_schedule (id, user_id, sch_name, sch_content, sch_time, sch_location, sch_priority) VALUES (2, 20200011, '为老马分忧', '从刹车开始', '2021-06-23 17:45:55', '上海自贸试验区', 2);
INSERT INTO tb_schedule (id, user_id, sch_name, sch_content, sch_time, sch_location, sch_priority) VALUES (3, 20200011, '滑雪课', '无', '2021-07-03 17:22:28', '张家口', 0);
INSERT INTO tb_schedule (id, user_id, sch_name, sch_content, sch_time, sch_location, sch_priority) VALUES (4, 20200011, '给小米设计新Logo', '需要先与雷总谈好价钱', '2021-06-30 17:25:25', '北京小米科技', 1);
INSERT INTO tb_schedule (id, user_id, sch_name, sch_content, sch_time, sch_location, sch_priority) VALUES (8, 20200011, '与Snyder剧组共进晚餐', '可别忘了和Cavill、Gadot合影', '2021-07-12 00:00:00', 'Burbank, LA', 2);
INSERT INTO tb_schedule (id, user_id, sch_name, sch_content, sch_time, sch_location, sch_priority) VALUES (14, 20200010, 'PPT', '完成PPT制作', '2021-05-12 20:40:32', '四川，成都', 0);
INSERT INTO tb_schedule (id, user_id, sch_name, sch_content, sch_time, sch_location, sch_priority) VALUES (15, 20200010, '文档', '完成项目相关的文档', '2021-06-10 20:40:39', '四川，成都', 0);
INSERT INTO tb_schedule (id, user_id, sch_name, sch_content, sch_time, sch_location, sch_priority) VALUES (16, 20200010, '买文具', '包括活页本、签字笔', '2021-07-02 20:40:46', '四川，成都', 1);
INSERT INTO tb_schedule (id, user_id, sch_name, sch_content, sch_time, sch_location, sch_priority) VALUES (17, 20200010, '编程课', '学习Python人脸识别', '2021-07-15 00:00:00', '北京', 1);





INSERT INTO tb_user_menu (id, user_type, menu_id) VALUES (1, 0, 1011);
INSERT INTO tb_user_menu (id, user_type, menu_id) VALUES (3, 0, 1021);
INSERT INTO tb_user_menu (id, user_type, menu_id) VALUES (5, 0, 1031);
INSERT INTO tb_user_menu (id, user_type, menu_id) VALUES (6, 0, 1032);
INSERT INTO tb_user_menu (id, user_type, menu_id) VALUES (8, 0, 1041);
INSERT INTO tb_user_menu (id, user_type, menu_id) VALUES (9, 0, 1051);
INSERT INTO tb_user_menu (id, user_type, menu_id) VALUES (10, 1, 1111);
INSERT INTO tb_user_menu (id, user_type, menu_id) VALUES (11, 1, 1121);
INSERT INTO tb_user_menu (id, user_type, menu_id) VALUES (12, 1, 1131);
INSERT INTO tb_user_menu (id, user_type, menu_id) VALUES (14, 2, 1211);
INSERT INTO tb_user_menu (id, user_type, menu_id) VALUES (15, 2, 1221);
INSERT INTO tb_user_menu (id, user_type, menu_id) VALUES (17, 2, 1231);
INSERT INTO tb_user_menu (id, user_type, menu_id) VALUES (19, 2, 1232);
INSERT INTO tb_user_menu (id, user_type, menu_id) VALUES (20, 2, 1241);

