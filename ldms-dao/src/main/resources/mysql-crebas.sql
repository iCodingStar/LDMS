/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2016/5/18 10:38:35                           */
/*==============================================================*/

DROP TABLE IF EXISTS device;

DROP TABLE IF EXISTS device_type;

DROP TABLE IF EXISTS lab;

DROP TABLE IF EXISTS project;

DROP TABLE IF EXISTS project_order;

DROP TABLE IF EXISTS student;

DROP TABLE IF EXISTS subject;

DROP TABLE IF EXISTS teacher;

DROP TABLE IF EXISTS user;

/*==============================================================*/
/* Table: device                                                */
/*==============================================================*/
CREATE TABLE device
(
  id                  CHAR(10) NOT NULL,
  lab_id              CHAR(10),
  tea_id              CHAR(10),
  dev_id              CHAR(10),
  sub_id              CHAR(20),
  name                CHAR(50),
  english_name        CHAR(50),
  model_id            CHAR(30),
  brand               CHAR(50),
  subject_type        CHAR(20),
  purchase_time       DATETIME,
  amount              INT,
  amount_used         INT DEFAULT 0,
  per_price           FLOAT,
  sum_price           FLOAT,
  price_type          CHAR(20),
  bill                CHAR(30),
  unit_of_measurement CHAR(10),
  fund_from           CHAR(30),
  property_from       CHAR(30),
  account_type        CHAR(10),
  purchase_type       CHAR(30),
  ps                  TEXT,
  PRIMARY KEY (id)
);

/*==============================================================*/
/* Table: device_type                                           */
/*==============================================================*/
CREATE TABLE device_type
(
  id   CHAR(10) NOT NULL,
  name CHAR(20),
  PRIMARY KEY (id)
);

/*==============================================================*/
/* Table: lab                                                   */
/*==============================================================*/
CREATE TABLE lab
(
  id       CHAR(10) NOT NULL,
  name     VARCHAR(50),
  size     INT,
  open_way CHAR(50) DEFAULT '预约开放',
  manager  CHAR(20),
  use_way  TEXT,
  PRIMARY KEY (id)
);

/*==============================================================*/
/* Table: project                                               */
/*==============================================================*/
CREATE TABLE project
(
  id            VARCHAR(10) NOT NULL,
  lab_id        CHAR(10),
  tea_id        CHAR(10),
  name          VARCHAR(50) NOT NULL,
  start_time    DATETIME    NOT NULL,
  end_time      DATETIME    NOT NULL,
  capacity      INT         NOT NULL,
  left_capacity INT,
  state         SMALLINT    NOT NULL,
  credit        FLOAT       NOT NULL,
  submit_time   DATETIME    NOT NULL,
  pass_time     DATETIME    NOT NULL,
  devices       VARCHAR(200),
  files         VARCHAR(50),
  description   TEXT,
  PRIMARY KEY (id)
);

/*==============================================================*/
/* Table: project_order                                         */
/*==============================================================*/
CREATE TABLE project_order
(
  id     CHAR(10) NOT NULL,
  pro_id VARCHAR(10),
  stu_id VARCHAR(11),
  score  FLOAT(4) NOT NULL,
  PRIMARY KEY (id)
);

/*==============================================================*/
/* Table: student                                               */
/*==============================================================*/
CREATE TABLE student
(
  id    VARCHAR(11) NOT NULL,
  name  VARCHAR(20) NOT NULL,
  major VARCHAR(50) NOT NULL,
  class_id INT (6
) NOT NULL,
  academy VARCHAR (50
) NOT NULL,
  sex   CHAR(4)     NOT NULL,
  PRIMARY KEY (id)
);

/*==============================================================*/
/* Table: subject                                               */
/*==============================================================*/
CREATE TABLE subject
(
  id   CHAR(20) NOT NULL,
  name CHAR(40),
  PRIMARY KEY (id)
);

/*==============================================================*/
/* Table: wrapper                                               */
/*==============================================================*/
CREATE TABLE teacher
(
  id      CHAR(10) NOT NULL,
  name    CHAR(20),
  sex     CHAR(10),
  major   CHAR(30),
  academy CHAR(30),
  PRIMARY KEY (id)
);

/*==============================================================*/
/* Table: user                                                  */
/*==============================================================*/
CREATE TABLE user
(
  username CHAR(10) NOT NULL,
  password CHAR(10),
  auth     CHAR(10),
  PRIMARY KEY (username)
);

ALTER TABLE device
  ADD CONSTRAINT FK_D_D_T FOREIGN KEY (dev_id)
REFERENCES device_type (id)
  ON DELETE RESTRICT
  ON UPDATE RESTRICT;

ALTER TABLE device
  ADD CONSTRAINT FK_D_L FOREIGN KEY (lab_id)
REFERENCES lab (id)
  ON DELETE RESTRICT
  ON UPDATE RESTRICT;

ALTER TABLE device
  ADD CONSTRAINT FK_D_S FOREIGN KEY (sub_id)
REFERENCES subject (id)
  ON DELETE RESTRICT
  ON UPDATE RESTRICT;

ALTER TABLE device
  ADD CONSTRAINT FK_D_T FOREIGN KEY (tea_id)
REFERENCES teacher (id)
  ON DELETE RESTRICT
  ON UPDATE RESTRICT;

ALTER TABLE project
  ADD CONSTRAINT FK_L_P FOREIGN KEY (lab_id)
REFERENCES lab (id)
  ON DELETE RESTRICT
  ON UPDATE RESTRICT;

ALTER TABLE project
  ADD CONSTRAINT FK_P_T FOREIGN KEY (tea_id)
REFERENCES teacher (id)
  ON DELETE RESTRICT
  ON UPDATE RESTRICT;

ALTER TABLE project_order
  ADD CONSTRAINT FK_O_S FOREIGN KEY (stu_id)
REFERENCES student (id)
  ON DELETE RESTRICT
  ON UPDATE RESTRICT;

ALTER TABLE project_order
  ADD CONSTRAINT FK_P_O FOREIGN KEY (pro_id)
REFERENCES project (id)
  ON DELETE RESTRICT
  ON UPDATE RESTRICT;

