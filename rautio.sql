-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 12, 2024 at 02:40 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rautio`
--

-- --------------------------------------------------------

--
-- Table structure for table `asukas`
--

CREATE TABLE `asukas` (
  `asukasID` int(11) NOT NULL,
  `etunimi` varchar(50) NOT NULL,
  `sukunimi` varchar(50) NOT NULL,
  `osoite` varchar(50) NOT NULL,
  `postinumero` varchar(50) NOT NULL,
  `kaupunki` varchar(50) NOT NULL,
  `puhelin` varchar(50) NOT NULL,
  `sposti` varchar(50) NOT NULL,
  `aktiivinen` tinyint(1) NOT NULL,
  `asuntoID` int(11) NOT NULL,
  `kayttajaID` int(11) NOT NULL,
  `salasanaID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `asunnot`
--

CREATE TABLE `asunnot` (
  `asuntoID` int(11) NOT NULL,
  `huoneisto` varchar(50) DEFAULT NULL,
  `taloyhtioID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `asunnot`
--

INSERT INTO `asunnot` (`asuntoID`, `huoneisto`, `taloyhtioID`) VALUES
(31, 'A 1', 2),
(32, 'A 2', 2),
(33, 'A 3', 2),
(34, 'B 4', 2),
(35, 'B 5', 2),
(36, 'B 6', 2),
(37, 'C 7', 2),
(38, 'C 8', 2),
(39, 'A 1', 3),
(40, 'A 2', 3),
(41, 'A 3', 3),
(42, 'A 4', 3),
(43, 'B 5', 3),
(44, 'B 6', 3),
(45, 'B 7', 3),
(46, 'B 8', 3),
(47, 'C 9', 3),
(48, 'C 10', 3),
(49, 'C 11', 3),
(50, 'C 12', 3),
(51, 'A 11', 4),
(52, 'A 12', 4),
(55, 'B 13', 4),
(56, 'B 14', 4),
(57, 'C 15', 4),
(58, 'C 16', 4),
(60, 'Yleinen tila', 2),
(64, 'Yleinen tila', 3),
(65, 'Yleinen tila', 4);

-- --------------------------------------------------------

--
-- Table structure for table `isannoitsija`
--

CREATE TABLE `isannoitsija` (
  `isannoitsijaID` int(11) NOT NULL,
  `etunimi` varchar(50) NOT NULL,
  `sukunimi` varchar(50) NOT NULL,
  `puhelin` varchar(50) NOT NULL,
  `sposti` varchar(50) NOT NULL,
  `aktiivinen` tinyint(1) NOT NULL,
  `salasanaID` int(11) NOT NULL,
  `kayttajaID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `isannoitsija`
--

INSERT INTO `isannoitsija` (`isannoitsijaID`, `etunimi`, `sukunimi`, `puhelin`, `sposti`, `aktiivinen`, `salasanaID`, `kayttajaID`) VALUES
(1, 'Kirsi', 'Pääkkö', '045 7122020', 'kirsi.paakko@gmail.com', 0, 0, 0),
(2, 'Laura', 'Väänänen', '040 8509933', 'laura.vaananen@gmail.com', 0, 0, 0),
(3, 'Markku', 'Häätylä', '050 7760850', 'markku.haatyla@outlook.fi', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `kasittely`
--

CREATE TABLE `kasittely` (
  `kasittelyID` int(11) NOT NULL,
  `pvm` timestamp NOT NULL DEFAULT current_timestamp(),
  `valmispvm` timestamp NULL DEFAULT NULL,
  `toimenpide` varchar(500) NOT NULL,
  `kohde` varchar(50) NOT NULL,
  `viesti` varchar(50) NOT NULL,
  `lemmikit` tinyint(20) NOT NULL,
  `yleisavain` tinyint(20) NOT NULL,
  `lahetetty` timestamp NOT NULL DEFAULT current_timestamp(),
  `etunimi` varchar(50) NOT NULL,
  `sukunimi` varchar(50) NOT NULL,
  `sposti` varchar(50) NOT NULL,
  `puhelin` varchar(50) NOT NULL,
  `tyontekijaID` int(11) NOT NULL,
  `vikaID` int(11) NOT NULL,
  `taloyhtioID` varchar(50) NOT NULL,
  `asuntoID` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kasittely`
--

INSERT INTO `kasittely` (`kasittelyID`, `pvm`, `valmispvm`, `toimenpide`, `kohde`, `viesti`, `lemmikit`, `yleisavain`, `lahetetty`, `etunimi`, `sukunimi`, `sposti`, `puhelin`, `tyontekijaID`, `vikaID`, `taloyhtioID`, `asuntoID`) VALUES
(31, '2024-05-12 08:29:29', '2024-05-12 12:35:40', 'Toinen testi', 'Viiminen testi', 'testiä', 1, 0, '2024-05-12 08:29:29', 'Viiminen', 'testi', 'testi@testi.fi', '123456789', 5, 95, '2', '31'),
(32, '2024-05-12 08:32:39', NULL, '', 'Keittiö', 'Hella meni kaboom taskete!!!', 0, 0, '2024-05-12 08:32:39', 'Teppo', 'Taapero', 't.t@hotmail.com', '0500001111', 5, 96, '2', '38');

-- --------------------------------------------------------

--
-- Table structure for table `kayttajat`
--

CREATE TABLE `kayttajat` (
  `kayttajaid` int(11) NOT NULL,
  `kayttajatunnus` varchar(50) NOT NULL,
  `salasana` varchar(255) NOT NULL,
  `rooliID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kayttajat`
--

INSERT INTO `kayttajat` (`kayttajaid`, `kayttajatunnus`, `salasana`, `rooliID`) VALUES
(1, 'isannoitsija', 'isannoitsija12', 1),
(2, 'asukas', 'asukas12', 2),
(3, 'tyontekija', 'tyontekija12', 3),
(4, 'juha1', 'juha12', 3);

-- --------------------------------------------------------

--
-- Table structure for table `oikeudet`
--

CREATE TABLE `oikeudet` (
  `oikeudetID` int(11) NOT NULL,
  `oikeus` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `oikeudet`
--

INSERT INTO `oikeudet` (`oikeudetID`, `oikeus`) VALUES
(3, 'delete_data'),
(1, 'read_data'),
(2, 'write_data');

-- --------------------------------------------------------

--
-- Table structure for table `rooli`
--

CREATE TABLE `rooli` (
  `rooliID` int(11) NOT NULL,
  `rooli` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rooli`
--

INSERT INTO `rooli` (`rooliID`, `rooli`) VALUES
(1, 'toimisto'),
(2, 'tyonjohtaja'),
(3, 'tyontekija'),
(4, 'isannoitsija'),
(5, 'asukas');

-- --------------------------------------------------------

--
-- Table structure for table `rooli_oikeudet`
--

CREATE TABLE `rooli_oikeudet` (
  `rooliID` int(11) NOT NULL,
  `oikeudetID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rooli_oikeudet`
--

INSERT INTO `rooli_oikeudet` (`rooliID`, `oikeudetID`) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(3, 1),
(3, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `taloyhtio`
--

CREATE TABLE `taloyhtio` (
  `taloyhtioID` int(11) NOT NULL,
  `osoite` varchar(50) NOT NULL,
  `tilat` varchar(500) NOT NULL,
  `nimi` varchar(50) NOT NULL,
  `kaupunki` varchar(50) NOT NULL,
  `postinro` varchar(10) NOT NULL,
  `isannoitsijaID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `taloyhtio`
--

INSERT INTO `taloyhtio` (`taloyhtioID`, `osoite`, `tilat`, `nimi`, `kaupunki`, `postinro`, `isannoitsijaID`) VALUES
(2, 'Kuukkelitie 3', '', 'Kuukkelitalo', 'Tornio', '95400', 1),
(3, 'Mansikkakatu 10', '', 'Mansikkamaa', 'Tornio', '95420', 3),
(4, 'Tähkätie 5', '', 'Tähkäpelto', 'Tornio', '95400', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tyontekija`
--

CREATE TABLE `tyontekija` (
  `tyontekijaID` int(11) NOT NULL,
  `etunimi` varchar(50) NOT NULL,
  `sukunimi` varchar(50) NOT NULL,
  `sposti` varchar(50) NOT NULL,
  `puhelin` varchar(50) NOT NULL,
  `kuvapolku` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `kayttajaID` int(11) NOT NULL,
  `rooliID` int(11) NOT NULL,
  `kasittelyID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tyontekija`
--

INSERT INTO `tyontekija` (`tyontekijaID`, `etunimi`, `sukunimi`, `sposti`, `puhelin`, `kuvapolku`, `status`, `kayttajaID`, `rooliID`, `kasittelyID`) VALUES
(2, 'Matti', 'Kallio', 'matti.kallio@kiinteistohuolto.com', '045 7122020', 'img/matti.jpeg', 0, 0, 2, 0),
(3, 'Heli', 'Virtanen', 'heli.virtanen@kiinteistohuolto.com', '040 8509933', 'img/heli.jpeg', 0, 0, 1, 0),
(4, 'Marja', 'Kuusela', 'marja.kuusela@kiinteistohuolto.com', '045 7122020', 'img/marja.jpeg', 0, 0, 1, 0),
(5, 'Aku', 'Hurjanen', 'aku.hurjanen@kiinteistohuolto.com', '040 8509933', 'img/aku.jpeg', 0, 0, 2, 0),
(6, 'Juha', 'Lehtonen', 'juha.lehtonen@kiinteistohuolto.com', '045 9007091', 'img/juha.jpeg', 0, 0, 3, 0),
(7, 'Pekka', 'Lahtela', 'pekka.lahtela@kiinteistohuolto.com', '040 8509933', 'img/pekka.jpeg', 0, 0, 3, 0),
(8, 'Jukka', 'Vasara', 'jukka.vasara@kiinteistohuolto.com', '050 7760850', 'img/jukka.jpeg', 0, 0, 3, 0),
(9, 'Maikki', 'Maijala', 'maikki.maijala@kiinteistohuolto.com', '045 9007091', 'img/maikki.jpeg', 0, 0, 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `vikailmoitus`
--

CREATE TABLE `vikailmoitus` (
  `vikaID` int(11) NOT NULL,
  `kohde` varchar(50) NOT NULL,
  `viesti` varchar(500) NOT NULL,
  `lemmikit` tinyint(20) NOT NULL,
  `yleisavain` tinyint(20) NOT NULL,
  `lahetetty` timestamp NOT NULL DEFAULT current_timestamp(),
  `etunimi` varchar(50) NOT NULL,
  `sukunimi` varchar(50) NOT NULL,
  `sposti` varchar(50) NOT NULL,
  `puhelin` varchar(50) NOT NULL,
  `varattu` tinyint(1) NOT NULL DEFAULT 0,
  `taloyhtioID` int(11) NOT NULL,
  `asuntoID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vikailmoitus`
--

INSERT INTO `vikailmoitus` (`vikaID`, `kohde`, `viesti`, `lemmikit`, `yleisavain`, `lahetetty`, `etunimi`, `sukunimi`, `sposti`, `puhelin`, `varattu`, `taloyhtioID`, `asuntoID`) VALUES
(95, 'Viiminen testi', 'testiä', 1, 0, '2024-05-03 19:03:27', 'Viiminen', 'testi', 'testi@testi.fi', '123456789', 1, 2, 31),
(96, 'Keittiö', 'Hella meni kaboom taskete!!!', 0, 0, '2024-05-08 07:29:53', 'Teppo', 'Taapero', 't.t@hotmail.com', '0500001111', 1, 2, 38),
(97, 'Argh', 'YASAAAAAAA', 1, 1, '2024-05-08 07:31:11', 'Urpo', 'Kekkonen', 'ei.ole@sahköpostia.com', '050111112323', 0, 2, 31),
(98, 'Toistoa', 'Pitää toistaa', 0, 0, '2024-05-09 12:31:44', 'Toisto', 'Toistonen', 'lisaa.toistoi@hotmail.fi', '0500000000', 0, 4, 52);

-- --------------------------------------------------------

--
-- Table structure for table `yhteydenotto`
--

CREATE TABLE `yhteydenotto` (
  `yhteydenottoID` int(11) NOT NULL,
  `etunimi` varchar(50) NOT NULL,
  `sukunimi` varchar(50) NOT NULL,
  `sposti` varchar(50) NOT NULL,
  `puhelin` varchar(25) NOT NULL,
  `viesti` varchar(500) NOT NULL,
  `yhteydenottotapa` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `yhteydenotto`
--

INSERT INTO `yhteydenotto` (`yhteydenottoID`, `etunimi`, `sukunimi`, `sposti`, `puhelin`, `viesti`, `yhteydenottotapa`) VALUES
(1, 'Roope', 'Kokkonen', 'testi@testi.com', '040-444-555', 'juuu', 'asd'),
(5, 'Miika', 'Kokkinen', 'juu@post.com', '444-4444-444', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop p', 'option1'),
(6, 'Miika', 'Kokkinen', 'juu@post.com', '444-4444-444', 'Testiä', 'sähköpostitse');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `asukas`
--
ALTER TABLE `asukas`
  ADD PRIMARY KEY (`asukasID`),
  ADD KEY `kayttajaID` (`kayttajaID`),
  ADD KEY `salasanaID` (`salasanaID`),
  ADD KEY `asuntoID` (`asuntoID`);

--
-- Indexes for table `asunnot`
--
ALTER TABLE `asunnot`
  ADD PRIMARY KEY (`asuntoID`),
  ADD KEY `taloyhtioID` (`taloyhtioID`);

--
-- Indexes for table `isannoitsija`
--
ALTER TABLE `isannoitsija`
  ADD PRIMARY KEY (`isannoitsijaID`),
  ADD KEY `kayttajaID2` (`kayttajaID`),
  ADD KEY `salasanaID2` (`salasanaID`);

--
-- Indexes for table `kasittely`
--
ALTER TABLE `kasittely`
  ADD PRIMARY KEY (`kasittelyID`),
  ADD KEY `tyontekijaID2` (`tyontekijaID`),
  ADD KEY `vikaID2` (`vikaID`),
  ADD KEY `taloyhtioID2` (`taloyhtioID`),
  ADD KEY `asuntoID2` (`asuntoID`);

--
-- Indexes for table `kayttajat`
--
ALTER TABLE `kayttajat`
  ADD PRIMARY KEY (`kayttajaid`),
  ADD UNIQUE KEY `kayttajatunnus` (`kayttajatunnus`),
  ADD KEY `rooliID` (`rooliID`);

--
-- Indexes for table `oikeudet`
--
ALTER TABLE `oikeudet`
  ADD PRIMARY KEY (`oikeudetID`),
  ADD UNIQUE KEY `oikeus` (`oikeus`);

--
-- Indexes for table `rooli`
--
ALTER TABLE `rooli`
  ADD PRIMARY KEY (`rooliID`);

--
-- Indexes for table `rooli_oikeudet`
--
ALTER TABLE `rooli_oikeudet`
  ADD PRIMARY KEY (`rooliID`,`oikeudetID`),
  ADD KEY `oikeudetID` (`oikeudetID`);

--
-- Indexes for table `taloyhtio`
--
ALTER TABLE `taloyhtio`
  ADD PRIMARY KEY (`taloyhtioID`),
  ADD KEY `isannoitsijaID` (`isannoitsijaID`);

--
-- Indexes for table `tyontekija`
--
ALTER TABLE `tyontekija`
  ADD PRIMARY KEY (`tyontekijaID`),
  ADD KEY `kayttajaID3` (`kayttajaID`),
  ADD KEY `rooliID` (`rooliID`);

--
-- Indexes for table `vikailmoitus`
--
ALTER TABLE `vikailmoitus`
  ADD PRIMARY KEY (`vikaID`),
  ADD KEY `asuntoID1` (`asuntoID`),
  ADD KEY `taloyhtioID1` (`taloyhtioID`);

--
-- Indexes for table `yhteydenotto`
--
ALTER TABLE `yhteydenotto`
  ADD PRIMARY KEY (`yhteydenottoID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `asukas`
--
ALTER TABLE `asukas`
  MODIFY `asukasID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `asunnot`
--
ALTER TABLE `asunnot`
  MODIFY `asuntoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `isannoitsija`
--
ALTER TABLE `isannoitsija`
  MODIFY `isannoitsijaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kasittely`
--
ALTER TABLE `kasittely`
  MODIFY `kasittelyID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `kayttajat`
--
ALTER TABLE `kayttajat`
  MODIFY `kayttajaid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `oikeudet`
--
ALTER TABLE `oikeudet`
  MODIFY `oikeudetID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `rooli`
--
ALTER TABLE `rooli`
  MODIFY `rooliID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `taloyhtio`
--
ALTER TABLE `taloyhtio`
  MODIFY `taloyhtioID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tyontekija`
--
ALTER TABLE `tyontekija`
  MODIFY `tyontekijaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `vikailmoitus`
--
ALTER TABLE `vikailmoitus`
  MODIFY `vikaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT for table `yhteydenotto`
--
ALTER TABLE `yhteydenotto`
  MODIFY `yhteydenottoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `asukas`
--
ALTER TABLE `asukas`
  ADD CONSTRAINT `asuntoID` FOREIGN KEY (`asuntoID`) REFERENCES `asunnot` (`asuntoID`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `asunnot`
--
ALTER TABLE `asunnot`
  ADD CONSTRAINT `taloyhtioID` FOREIGN KEY (`taloyhtioID`) REFERENCES `taloyhtio` (`taloyhtioID`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `kasittely`
--
ALTER TABLE `kasittely`
  ADD CONSTRAINT `tyontekijaID2` FOREIGN KEY (`tyontekijaID`) REFERENCES `tyontekija` (`tyontekijaID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `vikaID2` FOREIGN KEY (`vikaID`) REFERENCES `vikailmoitus` (`vikaID`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `kayttajat`
--
ALTER TABLE `kayttajat`
  ADD CONSTRAINT `kayttajat_ibfk_1` FOREIGN KEY (`rooliID`) REFERENCES `rooli` (`rooliID`);

--
-- Constraints for table `rooli_oikeudet`
--
ALTER TABLE `rooli_oikeudet`
  ADD CONSTRAINT `rooli_oikeudet_ibfk_1` FOREIGN KEY (`rooliID`) REFERENCES `rooli` (`rooliID`),
  ADD CONSTRAINT `rooli_oikeudet_ibfk_2` FOREIGN KEY (`oikeudetID`) REFERENCES `oikeudet` (`oikeudetID`);

--
-- Constraints for table `taloyhtio`
--
ALTER TABLE `taloyhtio`
  ADD CONSTRAINT `isannoitsijaID` FOREIGN KEY (`isannoitsijaID`) REFERENCES `isannoitsija` (`isannoitsijaID`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `tyontekija`
--
ALTER TABLE `tyontekija`
  ADD CONSTRAINT `rooliID` FOREIGN KEY (`rooliID`) REFERENCES `rooli` (`rooliID`);

--
-- Constraints for table `vikailmoitus`
--
ALTER TABLE `vikailmoitus`
  ADD CONSTRAINT `asuntoID1` FOREIGN KEY (`asuntoID`) REFERENCES `asunnot` (`asuntoID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `taloyhtioID1` FOREIGN KEY (`taloyhtioID`) REFERENCES `taloyhtio` (`taloyhtioID`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
