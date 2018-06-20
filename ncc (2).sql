-- MySQL Script generated by MySQL Workbench
-- Tue Jun 19 16:41:59 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema ncc
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ncc
-- -----------------------------------------------------
CREATE DATABASE `ncc` ;
USE `ncc` ;

-- -----------------------------------------------------
-- Table `ncc`.`project`
-- -----------------------------------------------------
CREATE TABLE `ncc`.`project` (
  `project_id` INT NOT NULL AUTO_INCREMENT,
  `projectName` VARCHAR(45) NOT NULL,
  `customer` VARCHAR(45) NOT NULL,
  `PM` VARCHAR(45) NOT NULL,
  `technology` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`project_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ncc`.`user`
-- -----------------------------------------------------
CREATE TABLE `ncc`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `role` TINYINT NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ncc`.`log time sheet`
-- -----------------------------------------------------
CREATE TABLE `ncc`.`log time sheet` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `project_id` INT NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  `hours` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`, `user_id`, `project_id`),
  INDEX `uer_key_idx` (`user_id` ASC),
  INDEX `fk_log time sheet_project1_idx` (`project_id` ASC),
  CONSTRAINT `uer_key`
    FOREIGN KEY (`user_id`)
    REFERENCES `ncc`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_log time sheet_project1`
    FOREIGN KEY (`project_id`)
    REFERENCES `ncc`.`project` (`project_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ncc`.`relation`
-- -----------------------------------------------------
CREATE TABLE `ncc`.`relation` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `project_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `proj_key_idx` (`project_id` ASC),
  CONSTRAINT `user_key`
    FOREIGN KEY (`user_id`)
    REFERENCES `ncc`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `proj_key`
    FOREIGN KEY (`project_id`)
    REFERENCES `ncc`.`project` (`project_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


INSERT INTO `ncc`.`user` (`id`, `role`, `email`, `password`) VALUES ('1', '1', 'admin@gmail.com', '12345678');
INSERT INTO `ncc`.`user` (`id`, `role`, `email`, `password`) VALUES ('2', '0', 'user1@gmail.com', '12345678');
INSERT INTO `ncc`.`user` (`id`, `role`, `email`, `password`) VALUES ('3', '0', 'user2@gmail.com', '12345678');
INSERT INTO `ncc`.`user` (`id`, `role`, `email`, `password`) VALUES ('4', '0', 'user3@gmail.com', '12345678');

INSERT INTO `ncc`.`project` (`project_id`,`projectName` ,`customer`, `PM`, `technology`, `description`) VALUES ('1','Change the world', 'Mr.Bean', 'Mr.IoC', 'java', 'awesome project');
INSERT INTO `ncc`.`project` (`project_id`, `projectName`,`customer`, `PM`, `technology`, `description`) VALUES ('2','XXX mission', 'Mr.Incredible', 'Mrs.Elastic', 'C++', 'awesome project');

INSERT INTO `ncc`.`relation` (`id`,`user_id`, `project_id`) VALUES ('1','2', '1');
INSERT INTO `ncc`.`relation` (`id`,`user_id`, `project_id`) VALUES ('2','3', '1');
INSERT INTO `ncc`.`relation` (`id`,`user_id`, `project_id`) VALUES ('3','4', '1');
INSERT INTO `ncc`.`relation` (`id`,`user_id`, `project_id`) VALUES ('4','3', '2');
INSERT INTO `ncc`.`relation` (`id`,`user_id`, `project_id`) VALUES ('5','4', '2');

INSERT INTO `ncc`.`log time sheet` (`id`, `project_id`, `type`, `hours`, `user_id`) VALUES ('1', '1', 'task', '8', '2');
INSERT INTO `ncc`.`log time sheet` (`id`, `project_id`, `type`, `hours`, `user_id`) VALUES ('2', '1', 'fix bug', '8', '3');

