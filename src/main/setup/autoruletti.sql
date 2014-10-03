-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema autoreitti
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS autoreitti;

-- -----------------------------------------------------
-- Schema autoreitti
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `autoreitti` DEFAULT CHARACTER SET utf8 ;
USE `autoreitti` ;

-- -----------------------------------------------------
-- Table `autoreitti`.`travelldestination`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `autoreitti`.`travelldestination` (
  `traveldestination_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `travelling_from` VARCHAR(60) NULL DEFAULT NULL,
  `travelling_to` VARCHAR(60) NULL DEFAULT NULL,
  `traveltime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`traveldestination_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `autoreitti`.`drivers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `autoreitti`.`drivers` (
  `driver_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(60) NOT NULL,
  `lastName` VARCHAR(60) NOT NULL,
  `phonenumber` INT(11) NOT NULL,
  PRIMARY KEY (`driver_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `autoreitti`.`drivers_destination`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `autoreitti`.`drivers_destination` (
  `drivers_destination_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `driver_id` BIGINT(20) NOT NULL,
  `traveldestination_id` BIGINT(20) NOT NULL,
  PRIMARY KEY (`drivers_destination_id`),
  CONSTRAINT `fk_drivers_carmodel1`
    FOREIGN KEY (`driver_id`)
    REFERENCES `autoreitti`.`drivers` (`driver_id`)
    ON DELETE NO action
    ON UPDATE NO action,
     CONSTRAINT `fk_drivers_destination1`
    FOREIGN KEY (`traveldestination_id`)
    REFERENCES `autoreitti`.`travelldestination` (`traveldestination_id`)
    ON DELETE cascade
    ON UPDATE cascade
  )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;




-- -----------------------------------------------------
-- Table `autoreitti`.`travellers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `autoreitti`.`travellers` (
  `traveller_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(50) NULL DEFAULT NULL,
  `LastName` VARCHAR(60) NULL DEFAULT NULL,
  `Phonenumber` INT(11) NULL DEFAULT NULL,
  
  PRIMARY KEY (`traveller_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `autoreitti`.`drivers_destination`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `autoreitti`.`traveller_destination` (
  `traveller_destination_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `traveller_id` BIGINT(20) NOT NULL,
  `traveldestination_id` BIGINT(20) NOT NULL,
  PRIMARY KEY (`traveller_destination_id`),
  CONSTRAINT `fk_traveller_id1`
    FOREIGN KEY (`traveller_id`)
    REFERENCES `autoreitti`.`travellers` (`traveller_id`)
    ON DELETE NO action
    ON UPDATE NO action,
     CONSTRAINT `fk_traveller_destination1`
    FOREIGN KEY (`traveldestination_id`)
    REFERENCES `autoreitti`.`travelldestination` (`traveldestination_id`)
    ON DELETE cascade
    ON UPDATE cascade
  )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;




-- -----------------------------------------------------
-- Table `autoreitti`.`travellagreement`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `autoreitti`.`travellagreement` (
  `travellagreement_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `traveller_destination_id` BIGINT(20) NULL DEFAULT NULL,
  `drivers_destination_id` BIGINT(20) NULL DEFAULT NULL,
  UNIQUE INDEX `traveller_destination_id` (`traveller_destination_id` ASC),
  UNIQUE INDEX `drivers_destination_id` (`drivers_destination_id` ASC),
  PRIMARY KEY (`travellagreement_id`),
  CONSTRAINT `fk_travellagreement_1`
    FOREIGN KEY (`drivers_destination_id`)
    REFERENCES `autoreitti`.`drivers_destination` (`drivers_destination_id`)
    ON DELETE NO action
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_travellagreement_2`
    FOREIGN KEY (`traveller_destination_id`)
    REFERENCES `autoreitti`.`traveller_destination` (`traveller_destination_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
