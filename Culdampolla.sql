-- MySQL Script generated by MySQL Workbench
-- Mon Sep 26 19:57:30 2022
-- Model: New Model    Version: 1.0
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
-- Table `mydb`.`Proveïdor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Proveïdor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `adreça` VARCHAR(45) NOT NULL,
  `telefon` INT NOT NULL,
  `fax` INT NOT NULL,
  `nif` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Empleat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Empleat` (
  `idEmpleat` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEmpleat`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Marca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Marca` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `proveidor_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `proveidor_id_idx` (`proveidor_id` ASC) VISIBLE,
  CONSTRAINT `proveidor_id`
    FOREIGN KEY (`proveidor_id`)
    REFERENCES `mydb`.`Proveïdor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Client` (
  `id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(25) NOT NULL,
  `adreça` VARCHAR(45) NOT NULL,
  `telefon` INT NOT NULL,
  `correu electronic` VARCHAR(45) NOT NULL,
  `data registre` DATETIME NOT NULL,
  `Client_id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Client_Client1_idx` (`Client_id` ASC) VISIBLE,
  CONSTRAINT `fk_Client_Client1`
    FOREIGN KEY (`Client_id`)
    REFERENCES `mydb`.`Client` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Producte / Ulleres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Producte / Ulleres` (
  `id` INT NOT NULL,
  `graduació` FLOAT NOT NULL,
  `tipus montura` VARCHAR(45) NOT NULL,
  `color montura` VARCHAR(45) NOT NULL,
  `color vidres` VARCHAR(45) NOT NULL,
  `preu` FLOAT NOT NULL,
  `marca_id` INT NOT NULL,
  `vendido_por` INT NOT NULL,
  `Client_id` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `vendido_por_idx` (`vendido_por` ASC) VISIBLE,
  INDEX `marca_id_idx` (`marca_id` ASC) VISIBLE,
  INDEX `fk_Producte / Ulleres_Client1_idx` (`Client_id` ASC) VISIBLE,
  CONSTRAINT `vendido_por`
    FOREIGN KEY (`vendido_por`)
    REFERENCES `mydb`.`Empleat` (`idEmpleat`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `marca_id`
    FOREIGN KEY (`marca_id`)
    REFERENCES `mydb`.`Marca` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Producte / Ulleres_Client1`
    FOREIGN KEY (`Client_id`)
    REFERENCES `mydb`.`Client` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Ventas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Ventas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `empleat_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `empleat_id_idx` (`empleat_id` ASC) VISIBLE,
  CONSTRAINT `empleat_id`
    FOREIGN KEY (`empleat_id`)
    REFERENCES `mydb`.`Empleat` (`idEmpleat`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
