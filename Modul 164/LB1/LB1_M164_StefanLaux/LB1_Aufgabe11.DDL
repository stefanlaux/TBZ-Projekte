-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema aufgabe11
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema aufgabe11
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `aufgabe11` DEFAULT CHARACTER SET utf8mb4 ;
USE `aufgabe11` ;

-- -----------------------------------------------------
-- Table `aufgabe11`.`Kundengruppe`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aufgabe11`.`Kundengruppe` ;

CREATE TABLE IF NOT EXISTS `aufgabe11`.`Kundengruppe` (
  `idKundengruppe` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`idKundengruppe`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aufgabe11`.`Anrede`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aufgabe11`.`Anrede` ;

CREATE TABLE IF NOT EXISTS `aufgabe11`.`Anrede` (
  `idtable1` INT NOT NULL,
  `anrede` VARCHAR(45) NULL,
  PRIMARY KEY (`idtable1`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aufgabe11`.`Kunde`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aufgabe11`.`Kunde` ;

CREATE TABLE IF NOT EXISTS `aufgabe11`.`Kunde` (
  `idKunde` INT NOT NULL,
  `Nachname` VARCHAR(45) NULL,
  `Vorname` VARCHAR(45) NULL,
  `Anrede_idtable1` INT NOT NULL,
  PRIMARY KEY (`idKunde`),
  INDEX `fk_Kunde_Anrede1_idx` (`Anrede_idtable1` ASC),
  CONSTRAINT `fk_Kunde_Anrede1`
    FOREIGN KEY (`Anrede_idtable1`)
    REFERENCES `aufgabe11`.`Anrede` (`idtable1`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aufgabe11`.`Artikel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aufgabe11`.`Artikel` ;

CREATE TABLE IF NOT EXISTS `aufgabe11`.`Artikel` (
  `idtable1` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `art` VARCHAR(45) NULL,
  PRIMARY KEY (`idtable1`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aufgabe11`.`Bestellposition`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aufgabe11`.`Bestellposition` ;

CREATE TABLE IF NOT EXISTS `aufgabe11`.`Bestellposition` (
  `idBestellposition` INT NOT NULL,
  `Artikel_idtable1` INT NOT NULL,
  `ort` VARCHAR(45) NULL,
  PRIMARY KEY (`idBestellposition`),
  INDEX `fk_Bestellposition_Artikel1_idx` (`Artikel_idtable1` ASC),
  CONSTRAINT `fk_Bestellposition_Artikel1`
    FOREIGN KEY (`Artikel_idtable1`)
    REFERENCES `aufgabe11`.`Artikel` (`idtable1`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aufgabe11`.`Bestellung`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aufgabe11`.`Bestellung` ;

CREATE TABLE IF NOT EXISTS `aufgabe11`.`Bestellung` (
  `idBestellung` INT NOT NULL,
  `Kunde_idKunde` INT NOT NULL,
  `Grund` VARCHAR(45) NULL,
  `Bestellposition_idBestellposition` INT NOT NULL,
  PRIMARY KEY (`idBestellung`),
  INDEX `fk_Bestellung_Kunde1_idx` (`Kunde_idKunde` ASC),
  INDEX `fk_Bestellung_Bestellposition1_idx` (`Bestellposition_idBestellposition` ASC),
  CONSTRAINT `fk_Bestellung_Kunde1`
    FOREIGN KEY (`Kunde_idKunde`)
    REFERENCES `aufgabe11`.`Kunde` (`idKunde`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Bestellung_Bestellposition1`
    FOREIGN KEY (`Bestellposition_idBestellposition`)
    REFERENCES `aufgabe11`.`Bestellposition` (`idBestellposition`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aufgabe11`.`Kundengruppe_has_Kunde`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aufgabe11`.`Kundengruppe_has_Kunde` ;

CREATE TABLE IF NOT EXISTS `aufgabe11`.`Kundengruppe_has_Kunde` (
  `Kundengruppe_idKundengruppe` INT NOT NULL,
  `Kunde_idKunde` INT NOT NULL,
  PRIMARY KEY (`Kundengruppe_idKundengruppe`, `Kunde_idKunde`),
  INDEX `fk_Kundengruppe_has_Kunde_Kunde1_idx` (`Kunde_idKunde` ASC),
  INDEX `fk_Kundengruppe_has_Kunde_Kundengruppe_idx` (`Kundengruppe_idKundengruppe` ASC),
  CONSTRAINT `fk_Kundengruppe_has_Kunde_Kundengruppe`
    FOREIGN KEY (`Kundengruppe_idKundengruppe`)
    REFERENCES `aufgabe11`.`Kundengruppe` (`idKundengruppe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Kundengruppe_has_Kunde_Kunde1`
    FOREIGN KEY (`Kunde_idKunde`)
    REFERENCES `aufgabe11`.`Kunde` (`idKunde`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
