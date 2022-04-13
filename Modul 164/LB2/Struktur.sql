-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema new_schema1
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema lb2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema lb2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lb2` DEFAULT CHARACTER SET utf8mb4 ;
-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `lb2` ;

-- -----------------------------------------------------
-- Table `lb2`.`importtabelle`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lb2`.`importtabelle` ;

CREATE TABLE IF NOT EXISTS `lb2`.`importtabelle` (
  `PLZ` VARCHAR(4) NOT NULL,
  `ORT` VARCHAR(45) NOT NULL,
  `Buchungsdatum` VARCHAR(45) NULL,
  `Hotel` VARCHAR(45) NULL,
  `Reiseort` VARCHAR(45) NULL,
  `AnzahlNaechte` INT NULL,
  `AnzahlPersonen` INT NULL,
  `Fluggesellschaft` VARCHAR(45) NULL,
  `Hinflug` VARCHAR(45) NULL,
  `Hinflugdatum` VARCHAR(45) NULL,
  `Hinflugzeit` VARCHAR(45) NULL,
  `Ruekflug` VARCHAR(45) NULL,
  `RuekflugDatum` VARCHAR(45) NULL,
  `RuekflugZeit` VARCHAR(45) NULL,
  `Name` VARCHAR(45) NULL,
  `Vorname` VARCHAR(45) NULL,
  `Adresse` VARCHAR(45) NULL)
ENGINE = InnoDB;

USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`ort`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`ort` ;

CREATE TABLE IF NOT EXISTS `mydb`.`ort` (
  `idOrt` INT(11) NOT NULL AUTO_INCREMENT,
  `PLZ` INT(11) NOT NULL,
  `Ort` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idOrt`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`personen`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`personen` ;

CREATE TABLE IF NOT EXISTS `mydb`.`personen` (
  `idPersonen` INT(11) NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL DEFAULT NULL,
  `Vorname` VARCHAR(45) NULL DEFAULT NULL,
  `Adresse` VARCHAR(45) NULL DEFAULT NULL,
  `Ort_idOrt` INT(11) NOT NULL,
  PRIMARY KEY (`idPersonen`),
  INDEX `fk_Personen_Ort_idx` (`Ort_idOrt` ASC),
  CONSTRAINT `fk_Personen_Ort`
    FOREIGN KEY (`Ort_idOrt`)
    REFERENCES `mydb`.`ort` (`idOrt`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`buchung`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`buchung` ;

CREATE TABLE IF NOT EXISTS `mydb`.`buchung` (
  `idBuchung` INT(11) NOT NULL AUTO_INCREMENT,
  `BuchungsDatum` VARCHAR(45) NULL DEFAULT NULL,
  `AnzahlNaechte` INT(11) NULL DEFAULT NULL,
  `AnzahlPersonen` INT(11) NULL DEFAULT NULL,
  `Personen_idPersonen` INT(11) NOT NULL,
  PRIMARY KEY (`idBuchung`),
  INDEX `fk_Buchung_Personen1_idx` (`Personen_idPersonen` ASC),
  CONSTRAINT `fk_Buchung_Personen1`
    FOREIGN KEY (`Personen_idPersonen`)
    REFERENCES `mydb`.`personen` (`idPersonen`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`fluggesellschaft`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`fluggesellschaft` ;

CREATE TABLE IF NOT EXISTS `mydb`.`fluggesellschaft` (
  `idFluggesellschaft` INT(11) NOT NULL AUTO_INCREMENT,
  `GesellschaftName` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idFluggesellschaft`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`flugnummer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`flugnummer` ;

CREATE TABLE IF NOT EXISTS `mydb`.`flugnummer` (
  `idFlugnummer` INT(11) NOT NULL AUTO_INCREMENT,
  `Nummer` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idFlugnummer`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`reiseziel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`reiseziel` ;

CREATE TABLE IF NOT EXISTS `mydb`.`reiseziel` (
  `idLaender` INT(11) NOT NULL AUTO_INCREMENT,
  `Land` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idLaender`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`flug`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`flug` ;

CREATE TABLE IF NOT EXISTS `mydb`.`flug` (
  `idFlug` INT(11) NOT NULL AUTO_INCREMENT,
  `HinflugDatum` VARCHAR(45) NULL DEFAULT NULL,
  `RueckflugDatum` VARCHAR(45) NULL DEFAULT NULL,
  `HinflugZeit` VARCHAR(45) NULL DEFAULT NULL,
  `RueckflugZeit` VARCHAR(45) NULL DEFAULT NULL,
  `Reiseziel_idLaender` INT(11) NOT NULL,
  `Fluggesellschaft_idFluggesellschaft` INT(11) NOT NULL,
  `Flugnummer_idFlugnummer` INT(11) NOT NULL,
  PRIMARY KEY (`idFlug`),
  INDEX `fk_Flug_Reiseziel1_idx` (`Reiseziel_idLaender` ASC),
  INDEX `fk_Flug_Fluggesellschaft1_idx` (`Fluggesellschaft_idFluggesellschaft` ASC),
  INDEX `fk_Flug_Flugnummer1_idx` (`Flugnummer_idFlugnummer` ASC),
  CONSTRAINT `fk_Flug_Fluggesellschaft1`
    FOREIGN KEY (`Fluggesellschaft_idFluggesellschaft`)
    REFERENCES `mydb`.`fluggesellschaft` (`idFluggesellschaft`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Flug_Flugnummer1`
    FOREIGN KEY (`Flugnummer_idFlugnummer`)
    REFERENCES `mydb`.`flugnummer` (`idFlugnummer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Flug_Reiseziel1`
    FOREIGN KEY (`Reiseziel_idLaender`)
    REFERENCES `mydb`.`reiseziel` (`idLaender`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`buchung_has_flug`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`buchung_has_flug` ;

CREATE TABLE IF NOT EXISTS `mydb`.`buchung_has_flug` (
  `Buchung_idBuchung` INT(11) NOT NULL,
  `Flug_idFlug` INT(11) NOT NULL,
  PRIMARY KEY (`Buchung_idBuchung`, `Flug_idFlug`),
  INDEX `fk_Buchung_has_Flug_Flug1_idx` (`Flug_idFlug` ASC),
  INDEX `fk_Buchung_has_Flug_Buchung1_idx` (`Buchung_idBuchung` ASC),
  CONSTRAINT `fk_Buchung_has_Flug_Buchung1`
    FOREIGN KEY (`Buchung_idBuchung`)
    REFERENCES `mydb`.`buchung` (`idBuchung`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Buchung_has_Flug_Flug1`
    FOREIGN KEY (`Flug_idFlug`)
    REFERENCES `mydb`.`flug` (`idFlug`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`hotel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`hotel` ;

CREATE TABLE IF NOT EXISTS `mydb`.`hotel` (
  `idHotel` INT(11) NOT NULL AUTO_INCREMENT,
  `HotelName` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idHotel`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`hotel_has_buchung`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`hotel_has_buchung` ;

CREATE TABLE IF NOT EXISTS `mydb`.`hotel_has_buchung` (
  `Hotel_idHotel` INT(11) NOT NULL,
  `Buchung_idBuchung` INT(11) NOT NULL,
  PRIMARY KEY (`Hotel_idHotel`, `Buchung_idBuchung`),
  INDEX `fk_Hotel_has_Buchung_Buchung1_idx` (`Buchung_idBuchung` ASC),
  INDEX `fk_Hotel_has_Buchung_Hotel1_idx` (`Hotel_idHotel` ASC),
  CONSTRAINT `fk_Hotel_has_Buchung_Buchung1`
    FOREIGN KEY (`Buchung_idBuchung`)
    REFERENCES `mydb`.`buchung` (`idBuchung`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Hotel_has_Buchung_Hotel1`
    FOREIGN KEY (`Hotel_idHotel`)
    REFERENCES `mydb`.`hotel` (`idHotel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
