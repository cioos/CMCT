--<ScriptOptions statementTerminator=";"/>

ALTER TABLE `cioos`.`tbl_order` DROP PRIMARY KEY;

ALTER TABLE `cioos`.`tbl_projecttask` DROP PRIMARY KEY;

ALTER TABLE `cioos`.`tbl_food` DROP PRIMARY KEY;

ALTER TABLE `cioos`.`tbl_dept` DROP PRIMARY KEY;

ALTER TABLE `cioos`.`tbl_emp` DROP PRIMARY KEY;

ALTER TABLE `cioos`.`tbl_idcard` DROP PRIMARY KEY;

ALTER TABLE `cioos`.`tbl_project` DROP PRIMARY KEY;

DROP TABLE `cioos`.`tbl_projecttask`;

DROP TABLE `cioos`.`tbl_emp`;

DROP TABLE `cioos`.`tbl_project`;

DROP TABLE `cioos`.`tbl_idcard`;

DROP TABLE `cioos`.`tbl_order`;

DROP TABLE `cioos`.`tbl_dept`;

DROP TABLE `cioos`.`tbl_food`;

CREATE TABLE `cioos`.`tbl_projecttask` (
	`id` INT NOT NULL,
	`name` VARCHAR(50) NOT NULL,
	`status` INT NOT NULL,
	`mainempid` INT NOT NULL,
	`starttime` DATETIME NOT NULL,
	`sbucktime` DATETIME,
	`counttime` INT,
	`ver` INT NOT NULL,
	`projectver` INT NOT NULL,
	`description` VARCHAR(200),
	`pmid` INT,
	`timelimit` INT,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `cioos`.`tbl_emp` (
	`id` INTEGER UNSIGNED NOT NULL,
	`ename` VARCHAR(50) NOT NULL,
	`description` VARCHAR(200),
	`job` VARCHAR(50),
	`hiredate` DATETIME,
	`sal` DOUBLE,
	`comm` DOUBLE,
	`deptid` INT,
	`email` VARCHAR(50),
	`ver` INT DEFAULT 0,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `cioos`.`tbl_project` (
	`id` INT NOT NULL,
	`name` VARCHAR(50) NOT NULL,
	`mgrid` INT NOT NULL,
	`starttime` DATETIME NOT NULL,
	`ver` INT NOT NULL,
	`projectver` INT NOT NULL,
	`description` VARCHAR(200),
	`pmid` INT,
	`sbucktime` DATETIME,
	`counttime` INT,
	`status` INT,
	`timelimit` INT,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `cioos`.`tbl_idcard` (
	`id` VARCHAR(50) NOT NULL,
	`name` VARCHAR(50) NOT NULL,
	`add` VARCHAR(200),
	`country` VARCHAR(50),
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `cioos`.`tbl_order` (
	`id` VARCHAR(50) NOT NULL,
	`foodid` INT NOT NULL,
	`empid` INT NOT NULL,
	`score` INT,
	`states` INT NOT NULL,
	`mainid` VARCHAR(50),
	`foodamount` INT NOT NULL,
	`type` VARCHAR(50),
	`ordertime` DATETIME NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `cioos`.`tbl_dept` (
	`id` INT NOT NULL,
	`hdeptid` INT,
	`name` VARCHAR(50),
	`loc` VARCHAR(150),
	`mgrid` INT,
	`description` VARCHAR(200),
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `cioos`.`tbl_food` (
	`id` INT NOT NULL,
	`name` VARCHAR(50),
	`type` VARCHAR(30),
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

ALTER TABLE `cioos`.`tbl_dept` ADD PRIMARY KEY (`id`);

