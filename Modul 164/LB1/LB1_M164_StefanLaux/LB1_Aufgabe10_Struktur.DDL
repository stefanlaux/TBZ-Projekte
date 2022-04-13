-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 22. Mrz 2022 um 14:54
-- Server-Version: 10.4.22-MariaDB
-- PHP-Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `aufgabe11`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `anrede`
--

CREATE TABLE `anrede` (
  `idtable1` int(11) NOT NULL,
  `anrede` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `anrede`
--

INSERT INTO `anrede` (`idtable1`, `anrede`) VALUES
(1, 'Herr'),
(2, 'Frau'),
(3, 'Andere');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `artikel`
--

CREATE TABLE `artikel` (
  `idtable1` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `art` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `artikel`
--

INSERT INTO `artikel` (`idtable1`, `name`, `art`) VALUES
(1, 'Headset', 'Gaming'),
(2, 'Notizblock', 'Büro'),
(3, 'Gamingtastatur', 'Gaming');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bestellposition`
--

CREATE TABLE `bestellposition` (
  `idBestellposition` int(11) NOT NULL,
  `Artikel_idtable1` int(11) NOT NULL,
  `ort` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `bestellposition`
--

INSERT INTO `bestellposition` (`idBestellposition`, `Artikel_idtable1`, `ort`) VALUES
(1, 3, 'Stadelhofen'),
(2, 1, 'Hardbrücke'),
(3, 2, 'Altstetten');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bestellung`
--

CREATE TABLE `bestellung` (
  `idBestellung` int(11) NOT NULL,
  `Kunde_idKunde` int(11) NOT NULL,
  `Grund` varchar(45) DEFAULT NULL,
  `Bestellposition_idBestellposition` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `bestellung`
--

INSERT INTO `bestellung` (`idBestellung`, `Kunde_idKunde`, `Grund`, `Bestellposition_idBestellposition`) VALUES
(1, 1, 'Neues Headset', 2),
(2, 2, 'Neuer Block', 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kunde`
--

CREATE TABLE `kunde` (
  `idKunde` int(11) NOT NULL,
  `Nachname` varchar(45) DEFAULT NULL,
  `Vorname` varchar(45) DEFAULT NULL,
  `Anrede_idtable1` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `kunde`
--

INSERT INTO `kunde` (`idKunde`, `Nachname`, `Vorname`, `Anrede_idtable1`) VALUES
(1, 'Laux', 'Stefan', 1),
(2, 'Laux', 'Catherine', 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kundengruppe`
--

CREATE TABLE `kundengruppe` (
  `idKundengruppe` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `kundengruppe`
--

INSERT INTO `kundengruppe` (`idKundengruppe`, `name`) VALUES
(1, 'Gamer'),
(2, 'Bänker');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kundengruppe_has_kunde`
--

CREATE TABLE `kundengruppe_has_kunde` (
  `Kundengruppe_idKundengruppe` int(11) NOT NULL,
  `Kunde_idKunde` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `kundengruppe_has_kunde`
--

INSERT INTO `kundengruppe_has_kunde` (`Kundengruppe_idKundengruppe`, `Kunde_idKunde`) VALUES
(1, 1),
(2, 2);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `anrede`
--
ALTER TABLE `anrede`
  ADD PRIMARY KEY (`idtable1`);

--
-- Indizes für die Tabelle `artikel`
--
ALTER TABLE `artikel`
  ADD PRIMARY KEY (`idtable1`);

--
-- Indizes für die Tabelle `bestellposition`
--
ALTER TABLE `bestellposition`
  ADD PRIMARY KEY (`idBestellposition`),
  ADD KEY `fk_Bestellposition_Artikel1_idx` (`Artikel_idtable1`);

--
-- Indizes für die Tabelle `bestellung`
--
ALTER TABLE `bestellung`
  ADD PRIMARY KEY (`idBestellung`),
  ADD KEY `fk_Bestellung_Kunde1_idx` (`Kunde_idKunde`),
  ADD KEY `fk_Bestellung_Bestellposition1_idx` (`Bestellposition_idBestellposition`);

--
-- Indizes für die Tabelle `kunde`
--
ALTER TABLE `kunde`
  ADD PRIMARY KEY (`idKunde`),
  ADD KEY `fk_Kunde_Anrede1_idx` (`Anrede_idtable1`);

--
-- Indizes für die Tabelle `kundengruppe`
--
ALTER TABLE `kundengruppe`
  ADD PRIMARY KEY (`idKundengruppe`);

--
-- Indizes für die Tabelle `kundengruppe_has_kunde`
--
ALTER TABLE `kundengruppe_has_kunde`
  ADD PRIMARY KEY (`Kundengruppe_idKundengruppe`,`Kunde_idKunde`),
  ADD KEY `fk_Kundengruppe_has_Kunde_Kunde1_idx` (`Kunde_idKunde`),
  ADD KEY `fk_Kundengruppe_has_Kunde_Kundengruppe_idx` (`Kundengruppe_idKundengruppe`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `bestellposition`
--
ALTER TABLE `bestellposition`
  ADD CONSTRAINT `fk_Bestellposition_Artikel1` FOREIGN KEY (`Artikel_idtable1`) REFERENCES `artikel` (`idtable1`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `bestellung`
--
ALTER TABLE `bestellung`
  ADD CONSTRAINT `fk_Bestellung_Bestellposition1` FOREIGN KEY (`Bestellposition_idBestellposition`) REFERENCES `bestellposition` (`idBestellposition`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Bestellung_Kunde1` FOREIGN KEY (`Kunde_idKunde`) REFERENCES `kunde` (`idKunde`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `kunde`
--
ALTER TABLE `kunde`
  ADD CONSTRAINT `fk_Kunde_Anrede1` FOREIGN KEY (`Anrede_idtable1`) REFERENCES `anrede` (`idtable1`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `kundengruppe_has_kunde`
--
ALTER TABLE `kundengruppe_has_kunde`
  ADD CONSTRAINT `fk_Kundengruppe_has_Kunde_Kunde1` FOREIGN KEY (`Kunde_idKunde`) REFERENCES `kunde` (`idKunde`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Kundengruppe_has_Kunde_Kundengruppe` FOREIGN KEY (`Kundengruppe_idKundengruppe`) REFERENCES `kundengruppe` (`idKundengruppe`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
