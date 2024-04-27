-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 26.04.2024 klo 22:10
-- Palvelimen versio: 10.4.28-MariaDB
-- PHP Version: 8.2.4

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
-- Rakenne taululle `asukas`
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
-- Rakenne taululle `asunnot`
--

CREATE TABLE `asunnot` (
  `asuntoID` int(11) NOT NULL,
  `nimi` varchar(50) NOT NULL,
  `asukasID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Rakenne taululle `isannoitsija`
--

CREATE TABLE `isannoitsija` (
  `isannoitsijaID` int(11) NOT NULL,
  `etunimi` varchar(50) NOT NULL,
  `sukunimi` varchar(50) NOT NULL,
  `aktiivinen` tinyint(1) NOT NULL,
  `asuntoID` int(11) NOT NULL,
  `taloyhtioID` int(11) NOT NULL,
  `salasanaID` int(11) NOT NULL,
  `kayttajaID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Rakenne taululle `kasittely`
--

CREATE TABLE `kasittely` (
  `kasittelyID` int(11) NOT NULL,
  `pvm` timestamp NOT NULL DEFAULT current_timestamp(),
  `valmispvm` timestamp NULL DEFAULT NULL,
  `toimenpide` varchar(500) NOT NULL,
  `tyontekijaID` int(11) NOT NULL,
  `vikaID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Rakenne taululle `kayttajatunnus`
--

CREATE TABLE `kayttajatunnus` (
  `kayttajaID` int(11) NOT NULL,
  `tunnus` varchar(100) NOT NULL,
  `asukasID` int(11) NOT NULL,
  `isannoitsijaID` int(11) NOT NULL,
  `tyontekijaID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Rakenne taululle `rooli`
--

CREATE TABLE `rooli` (
  `rooliID` int(11) NOT NULL,
  `rooli` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vedos taulusta `rooli`
--

INSERT INTO `rooli` (`rooliID`, `rooli`) VALUES
(1, 'toimisto'),
(2, 'tyonjohtaja'),
(3, 'tyontekija');

-- --------------------------------------------------------

--
-- Rakenne taululle `salasana`
--

CREATE TABLE `salasana` (
  `salasanaID` int(11) NOT NULL,
  `salasana` varchar(100) NOT NULL,
  `asukasID` int(11) NOT NULL,
  `isannoitsijaID` int(11) NOT NULL,
  `tyontekijaID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Rakenne taululle `taloyhtio`
--

CREATE TABLE `taloyhtio` (
  `taloyhtioID` int(11) NOT NULL,
  `osoite` varchar(50) NOT NULL,
  `tilat` varchar(500) NOT NULL,
  `nimi` varchar(50) NOT NULL,
  `kaupunki` varchar(50) NOT NULL,
  `postinro` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Rakenne taululle `tyontekija`
--

CREATE TABLE `tyontekija` (
  `tyontekijaID` int(11) NOT NULL,
  `etunimi` varchar(50) NOT NULL,
  `sukunimi` varchar(50) NOT NULL,
  `sposti` varchar(50) NOT NULL,
  `puhelin` varchar(50) NOT NULL,
  `kuvapolku` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `salasanaID` int(11) NOT NULL,
  `kayttajaID` int(11) NOT NULL,
  `rooliID` int(11) NOT NULL,
  `kasittelyID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Rakenne taululle `vikailmoitus`
--

CREATE TABLE `vikailmoitus` (
  `vikaID` int(11) NOT NULL,
  `aihe` varchar(500) NOT NULL,
  `pvm` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(1) NOT NULL,
  `asukasID` int(11) NOT NULL,
  `tyontekijaID` int(11) NOT NULL,
  `isannoitsijaID` int(11) NOT NULL,
  `asuntoID` int(11) NOT NULL,
  `taloyhtioID` int(11) NOT NULL,
  `kasittelyID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Rakenne taululle `yhteydenotto`
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
-- Vedos taulusta `yhteydenotto`
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
  ADD KEY `asuntoID2` (`asuntoID`);

--
-- Indexes for table `asunnot`
--
ALTER TABLE `asunnot`
  ADD PRIMARY KEY (`asuntoID`);

--
-- Indexes for table `isannoitsija`
--
ALTER TABLE `isannoitsija`
  ADD PRIMARY KEY (`isannoitsijaID`),
  ADD KEY `kayttajaID2` (`kayttajaID`),
  ADD KEY `salasanaID2` (`salasanaID`),
  ADD KEY `taloyhtioID2` (`taloyhtioID`);

--
-- Indexes for table `kasittely`
--
ALTER TABLE `kasittely`
  ADD KEY `tyontekijaID2` (`tyontekijaID`),
  ADD KEY `vikaID2` (`vikaID`);

--
-- Indexes for table `kayttajatunnus`
--
ALTER TABLE `kayttajatunnus`
  ADD PRIMARY KEY (`kayttajaID`);

--
-- Indexes for table `rooli`
--
ALTER TABLE `rooli`
  ADD PRIMARY KEY (`rooliID`);

--
-- Indexes for table `salasana`
--
ALTER TABLE `salasana`
  ADD PRIMARY KEY (`salasanaID`);

--
-- Indexes for table `taloyhtio`
--
ALTER TABLE `taloyhtio`
  ADD PRIMARY KEY (`taloyhtioID`);

--
-- Indexes for table `tyontekija`
--
ALTER TABLE `tyontekija`
  ADD PRIMARY KEY (`tyontekijaID`),
  ADD KEY `kayttajaID3` (`kayttajaID`),
  ADD KEY `salasanaID3` (`salasanaID`),
  ADD KEY `rooliID` (`rooliID`);

--
-- Indexes for table `vikailmoitus`
--
ALTER TABLE `vikailmoitus`
  ADD PRIMARY KEY (`vikaID`),
  ADD KEY `tyontekijaID` (`tyontekijaID`),
  ADD KEY `asukasID` (`asukasID`),
  ADD KEY `isannoitsijaID` (`isannoitsijaID`),
  ADD KEY `asuntoID` (`asuntoID`),
  ADD KEY `taloyhtioID` (`taloyhtioID`);

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
  MODIFY `asukasID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `asunnot`
--
ALTER TABLE `asunnot`
  MODIFY `asuntoID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `isannoitsija`
--
ALTER TABLE `isannoitsija`
  MODIFY `isannoitsijaID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kayttajatunnus`
--
ALTER TABLE `kayttajatunnus`
  MODIFY `kayttajaID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rooli`
--
ALTER TABLE `rooli`
  MODIFY `rooliID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `salasana`
--
ALTER TABLE `salasana`
  MODIFY `salasanaID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `taloyhtio`
--
ALTER TABLE `taloyhtio`
  MODIFY `taloyhtioID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tyontekija`
--
ALTER TABLE `tyontekija`
  MODIFY `tyontekijaID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vikailmoitus`
--
ALTER TABLE `vikailmoitus`
  MODIFY `vikaID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `yhteydenotto`
--
ALTER TABLE `yhteydenotto`
  MODIFY `yhteydenottoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Rajoitteet vedostauluille
--

--
-- Rajoitteet taululle `asukas`
--
ALTER TABLE `asukas`
  ADD CONSTRAINT `asuntoID2` FOREIGN KEY (`asuntoID`) REFERENCES `asunnot` (`asuntoID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `kayttajaID` FOREIGN KEY (`kayttajaID`) REFERENCES `kayttajatunnus` (`kayttajaID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `salasanaID` FOREIGN KEY (`salasanaID`) REFERENCES `salasana` (`salasanaID`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Rajoitteet taululle `isannoitsija`
--
ALTER TABLE `isannoitsija`
  ADD CONSTRAINT `kayttajaID2` FOREIGN KEY (`kayttajaID`) REFERENCES `kayttajatunnus` (`kayttajaID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `salasanaID2` FOREIGN KEY (`salasanaID`) REFERENCES `salasana` (`salasanaID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `taloyhtioID2` FOREIGN KEY (`taloyhtioID`) REFERENCES `taloyhtio` (`taloyhtioID`);

--
-- Rajoitteet taululle `kasittely`
--
ALTER TABLE `kasittely`
  ADD CONSTRAINT `tyontekijaID2` FOREIGN KEY (`tyontekijaID`) REFERENCES `tyontekija` (`tyontekijaID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `vikaID2` FOREIGN KEY (`vikaID`) REFERENCES `vikailmoitus` (`vikaID`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Rajoitteet taululle `tyontekija`
--
ALTER TABLE `tyontekija`
  ADD CONSTRAINT `kayttajaID3` FOREIGN KEY (`kayttajaID`) REFERENCES `kayttajatunnus` (`kayttajaID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `rooliID` FOREIGN KEY (`rooliID`) REFERENCES `rooli` (`rooliID`),
  ADD CONSTRAINT `salasanaID3` FOREIGN KEY (`salasanaID`) REFERENCES `salasana` (`salasanaID`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Rajoitteet taululle `vikailmoitus`
--
ALTER TABLE `vikailmoitus`
  ADD CONSTRAINT `asukasID` FOREIGN KEY (`asukasID`) REFERENCES `asukas` (`asukasID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `asuntoID` FOREIGN KEY (`asuntoID`) REFERENCES `asunnot` (`asuntoID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `isannoitsijaID` FOREIGN KEY (`isannoitsijaID`) REFERENCES `isannoitsija` (`isannoitsijaID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `taloyhtioID` FOREIGN KEY (`taloyhtioID`) REFERENCES `taloyhtio` (`taloyhtioID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tyontekijaID` FOREIGN KEY (`tyontekijaID`) REFERENCES `tyontekija` (`tyontekijaID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
