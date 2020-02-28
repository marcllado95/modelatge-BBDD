-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`provider`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`provider` (
  `id_Provider` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `mobile` VARCHAR(30) NOT NULL,
  `fax` VARCHAR(15) NULL DEFAULT NULL,
  `nif` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id_Provider`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`adress`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`adress` (
  `street` VARCHAR(45) NOT NULL,
  `number` INT NOT NULL,
  `flat` INT NULL DEFAULT NULL,
  `door` INT NULL DEFAULT NULL,
  `city` VARCHAR(45) NOT NULL,
  `postal_code` INT NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  `Provider_id_Provider` INT NOT NULL,
  INDEX `fk_Adress_Provider_idx` (`Provider_id_Provider` ASC) VISIBLE,
  CONSTRAINT `fk_Adress_Provider`
    FOREIGN KEY (`Provider_id_Provider`)
    REFERENCES `mydb`.`provider` (`id_Provider`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`customer` (
  `id_Customer` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `mobile` VARCHAR(20) NOT NULL,
  `e-mail` VARCHAR(45) NOT NULL,
  `postal_code` VARCHAR(45) NOT NULL,
  `register_date` DATE NOT NULL,
  `recommended_by` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_Customer`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`employer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`employer` (
  `id_Employer` INT NOT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_Employer`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`glasses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`glasses` (
  `id_Glasses` INT NOT NULL,
  `brand` VARCHAR(10) NOT NULL,
  `graduation_L` FLOAT NOT NULL,
  `graduation_R` FLOAT NOT NULL,
  `frame_type` VARCHAR(10) NOT NULL,
  `frame_color` VARCHAR(10) NOT NULL,
  `glass_color_L` VARCHAR(10) NOT NULL,
  `glass_color_R` VARCHAR(10) NOT NULL,
  `price` FLOAT NOT NULL,
  `Provider_id_Provider` INT NOT NULL,
  `Employer_id_Employer` INT NOT NULL,
  `Customer_id_Customer` INT NOT NULL,
  PRIMARY KEY (`id_Glasses`),
  INDEX `fk_Glasses_Provider1_idx` (`Provider_id_Provider` ASC) VISIBLE,
  INDEX `fk_Glasses_Employer1_idx` (`Employer_id_Employer` ASC) VISIBLE,
  INDEX `fk_Glasses_Customer1_idx` (`Customer_id_Customer` ASC) VISIBLE,
  CONSTRAINT `fk_Glasses_Customer1`
    FOREIGN KEY (`Customer_id_Customer`)
    REFERENCES `mydb`.`customer` (`id_Customer`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Glasses_Employer1`
    FOREIGN KEY (`Employer_id_Employer`)
    REFERENCES `mydb`.`employer` (`id_Employer`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Glasses_Provider1`
    FOREIGN KEY (`Provider_id_Provider`)
    REFERENCES `mydb`.`provider` (`id_Provider`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
