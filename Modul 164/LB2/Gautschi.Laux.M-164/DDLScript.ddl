-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema TEstModul
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema lb2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema lb2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lb2` DEFAULT CHARACTER SET utf8mb4 ;
USE `lb2` ;

-- -----------------------------------------------------
-- Table `lb2`.`ort`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lb2`.`ort` ;

CREATE TABLE IF NOT EXISTS `lb2`.`ort` (
  `idOrt` INT(11) NOT NULL AUTO_INCREMENT,
  `PLZ` INT(11) NOT NULL,
  `Ort` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idOrt`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `lb2`.`personen`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lb2`.`personen` ;

CREATE TABLE IF NOT EXISTS `lb2`.`personen` (
  `idPersonen` INT(11) NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL DEFAULT NULL,
  `Vorname` VARCHAR(45) NULL DEFAULT NULL,
  `Adresse` VARCHAR(45) NULL DEFAULT NULL,
  `Ort_idOrt` INT(11) NOT NULL,
  PRIMARY KEY (`idPersonen`),
  INDEX `fk_Personen_Ort_idx` (`Ort_idOrt` ASC),
  CONSTRAINT `fk_Personen_Ort`
    FOREIGN KEY (`Ort_idOrt`)
    REFERENCES `lb2`.`ort` (`idOrt`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `lb2`.`fluggesellschaft`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lb2`.`fluggesellschaft` ;

CREATE TABLE IF NOT EXISTS `lb2`.`fluggesellschaft` (
  `idFluggesellschaft` INT(11) NOT NULL AUTO_INCREMENT,
  `GesellschaftName` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idFluggesellschaft`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `lb2`.`flugnummer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lb2`.`flugnummer` ;

CREATE TABLE IF NOT EXISTS `lb2`.`flugnummer` (
  `idFlugnummer` INT(11) NOT NULL AUTO_INCREMENT,
  `Nummer` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idFlugnummer`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `lb2`.`reiseziel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lb2`.`reiseziel` ;

CREATE TABLE IF NOT EXISTS `lb2`.`reiseziel` (
  `idLaender` INT(11) NOT NULL AUTO_INCREMENT,
  `Land` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idLaender`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `lb2`.`flug`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lb2`.`flug` ;

CREATE TABLE IF NOT EXISTS `lb2`.`flug` (
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
    REFERENCES `lb2`.`fluggesellschaft` (`idFluggesellschaft`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Flug_Flugnummer1`
    FOREIGN KEY (`Flugnummer_idFlugnummer`)
    REFERENCES `lb2`.`flugnummer` (`idFlugnummer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Flug_Reiseziel1`
    FOREIGN KEY (`Reiseziel_idLaender`)
    REFERENCES `lb2`.`reiseziel` (`idLaender`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `lb2`.`hotel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lb2`.`hotel` ;

CREATE TABLE IF NOT EXISTS `lb2`.`hotel` (
  `idHotel` INT(11) NOT NULL AUTO_INCREMENT,
  `HotelName` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idHotel`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `lb2`.`buchung`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lb2`.`buchung` ;

CREATE TABLE IF NOT EXISTS `lb2`.`buchung` (
  `idBuchung` INT(11) NOT NULL AUTO_INCREMENT,
  `BuchungsDatum` VARCHAR(45) NULL DEFAULT NULL,
  `AnzahlNaechte` INT(11) NULL DEFAULT NULL,
  `AnzahlPersonen` INT(11) NULL DEFAULT NULL,
  `Personen_idPersonen` INT(11) NOT NULL,
  `hotel_idHotel` INT(11) NOT NULL,
  `flug_idFlug` INT(11) NOT NULL,
  PRIMARY KEY (`idBuchung`),
  INDEX `fk_Buchung_Personen1_idx` (`Personen_idPersonen` ASC),
  INDEX `fk_buchung_hotel1_idx` (`hotel_idHotel` ASC),
  INDEX `fk_buchung_flug1_idx` (`flug_idFlug` ASC),
  CONSTRAINT `fk_Buchung_Personen1`
    FOREIGN KEY (`Personen_idPersonen`)
    REFERENCES `lb2`.`personen` (`idPersonen`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_buchung_flug1`
    FOREIGN KEY (`flug_idFlug`)
    REFERENCES `lb2`.`flug` (`idFlug`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_buchung_hotel1`
    FOREIGN KEY (`hotel_idHotel`)
    REFERENCES `lb2`.`hotel` (`idHotel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `lb2`.`importtabelle`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lb2`.`importtabelle` ;

CREATE TABLE IF NOT EXISTS `lb2`.`importtabelle` (
  `Name` VARCHAR(45) NOT NULL,
  `Vorname` VARCHAR(45) NOT NULL,
  `Adresse` VARCHAR(45) NOT NULL,
  `PLZ` VARCHAR(4) NOT NULL,
  `ORT` VARCHAR(45) NOT NULL,
  `Buchungsdatum` VARCHAR(45) NULL DEFAULT NULL,
  `Hotel` VARCHAR(45) NULL DEFAULT NULL,
  `Reiseort` VARCHAR(45) NULL DEFAULT NULL,
  `AnzahlNaechte` INT(11) NULL DEFAULT NULL,
  `AnzahlPersonen` INT(11) NULL DEFAULT NULL,
  `Fluggesellschaft` VARCHAR(45) NULL DEFAULT NULL,
  `Hinflug` VARCHAR(45) NULL DEFAULT NULL,
  `Hinflugdatum` VARCHAR(45) NULL DEFAULT NULL,
  `Hinflugzeit` VARCHAR(45) NULL DEFAULT NULL,
  `Ruekflug` VARCHAR(45) NULL DEFAULT NULL,
  `RuekflugDatum` VARCHAR(45) NULL DEFAULT NULL,
  `RuekflugZeit` VARCHAR(45) NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
