-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 15. Mrz 2022 um 16:14
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
-- Datenbank: `aufgabe15.3.22`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `mitarbeiter`
--

CREATE TABLE `mitarbeiter` (
  `idMitarbeiter` int(11) NOT NULL,
  `firstname` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `vorgesetzer` int(11) DEFAULT NULL,
  `fk_titel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `mitarbeiter`
--

INSERT INTO `mitarbeiter` (`idMitarbeiter`, `firstname`, `lastname`, `vorgesetzer`, `fk_titel`) VALUES
(1, 'Ken', 'Sanchez', NULL, 1),
(2, 'Brian', 'Welcker', 1, 2),
(3, 'Syed', 'Abbas', 2, 4),
(4, 'David', 'Bradley', 2, 5),
(5, 'Stephan', 'Jiang', 2, 3),
(6, 'Mary', 'Gibson', 4, 6),
(7, 'Lynn', 'Tsoflias', 3, 7),
(8, 'Linda', 'Mitchell', 5, 7),
(9, 'Michael', 'Blythe', 5, 7);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `titel`
--

CREATE TABLE `titel` (
  `idTitel` int(11) NOT NULL,
  `titel` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `titel`
--

INSERT INTO `titel` (`idTitel`, `titel`) VALUES
(1, 'Executive Chief Officer'),
(5, 'Marketing Manager'),
(6, 'Marketing Specialist'),
(3, 'North America Sales'),
(4, 'Pacific Sales'),
(7, 'Sales Representive'),
(2, 'Vice President of Sales');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `mitarbeiter`
--
ALTER TABLE `mitarbeiter`
  ADD PRIMARY KEY (`idMitarbeiter`),
  ADD UNIQUE KEY `idMitarbeiter_UNIQUE` (`idMitarbeiter`),
  ADD KEY `fk_Mitarbeiter_Mitarbeiter_idx` (`vorgesetzer`),
  ADD KEY `fk_mitarbeiter_titel1_idx` (`fk_titel`);

--
-- Indizes für die Tabelle `titel`
--
ALTER TABLE `titel`
  ADD PRIMARY KEY (`idTitel`),
  ADD UNIQUE KEY `titel_UNIQUE` (`titel`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `mitarbeiter`
--
ALTER TABLE `mitarbeiter`
  MODIFY `idMitarbeiter` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `mitarbeiter`
--
ALTER TABLE `mitarbeiter`
  ADD CONSTRAINT `fk_Mitarbeiter_Mitarbeiter` FOREIGN KEY (`vorgesetzer`) REFERENCES `mitarbeiter` (`idMitarbeiter`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_mitarbeiter_titel1` FOREIGN KEY (`fk_titel`) REFERENCES `titel` (`idTitel`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
