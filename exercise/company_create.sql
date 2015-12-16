SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `company` ;
CREATE SCHEMA IF NOT EXISTS `company` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `company` ;


-- -----------------------------------------------------
-- Table `company`.`department`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `company`.`department` ;

CREATE TABLE IF NOT EXISTS `company`.`department` (
  `dnum` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `mgrssn` INT NULL,
  PRIMARY KEY (`dnum`)
)
ENGINE = InnoDB;

insert into department values ( 123, '기획부', 1001);
insert into department values ( 124, '인사부', 1002);
insert into department values ( 125, '정보기획부', 1003);

-- -----------------------------------------------------
-- Table `company`.`employee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `company`.`employee` ;

CREATE TABLE IF NOT EXISTS `company`.`employee` (
  `ssn` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `sex` CHAR(1) NULL,
  `dnum` INT NULL,
  `superssn` INT NULL,
  `bdate` DATE NULL,
  `addr` VARCHAR(200) NULL,
  `salary` INT NULL,
  PRIMARY KEY (`ssn`)
)
ENGINE = InnoDB;

insert into employee values ( 1001, 'I H Lee', 'M', 123, 1004, '2000-01-01', 'Seoul, Korea', 10000000);
insert into employee values ( 1002, 'H Y Jung', 'M', 124, 1004, '2001-03-03', 'Seongnam, Korea', 9000000);
insert into employee values ( 1003, 'D J Kim', 'M', 125, 1005, '1999-05-05', 'Seoul, Korea', 8000000);
insert into employee values ( 1004, 'M S Lee', 'M', NULL, NULL, '1980-09-09', 'Seoul, Korea', 15000000);
insert into employee values ( 1005, 'H C Joo', 'M', NULL, 1004, '1981-07-05', 'Seoul, Korea', 13000000);

-- -----------------------------------------------------
-- Table `company`.`project`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `company`.`project` ;

CREATE TABLE IF NOT EXISTS `company`.`project` (
  `pnum` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `location` VARCHAR(45) NULL,
  `ctrl_dnum` INT NULL,
  PRIMARY KEY (`pnum`)
)
ENGINE = InnoDB;


insert into Project values ( 30001, 'Product X', 'Seoul', 125);
insert into Project values ( 30002, 'Product Y', 'Seoul', 125);
insert into Project values ( 30003, 'New Year', 'Seoul', 123);

-- -----------------------------------------------------
-- Table `company`.`dependent`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `company`.`dependent` ;

CREATE TABLE IF NOT EXISTS `company`.`dependent` (
  `name` VARCHAR(30) NOT NULL,
  `sex` CHAR(1) NULL,
  `relationship` VARCHAR(10) NULL,
  `emp_ssn` INT NOT NULL,
  PRIMARY KEY (`name`, `emp_ssn`)
)
ENGINE = InnoDB;

insert into dependent values ( 'Yuna Lee', 'F', 'daughter', 1001);
insert into dependent values ( 'Sihyun Lee', 'F', 'daughter', 1001);
insert into dependent values ( 'Yeju Lee', 'F', 'daughter', 1001);

-- -----------------------------------------------------
-- Table `company`.`worksOn`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `company`.`worksOn` ;

CREATE TABLE IF NOT EXISTS `company`.`worksOn` (
  `ssn` INT NOT NULL,
  `pnum` INT NOT NULL,
  `hours` INT NOT NULL,
  PRIMARY KEY (`ssn`, `pnum`)
)
ENGINE = InnoDB;


insert into worksOn values ( 1001, 30001, 50);
insert into worksOn values ( 1001, 30002, 50);
insert into worksOn values ( 1001, 30003, 30);
insert into worksOn values ( 1002, 30001, 30);
insert into worksOn values ( 1002, 30002, 30);
insert into worksOn values ( 1003, 30003, 70);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
