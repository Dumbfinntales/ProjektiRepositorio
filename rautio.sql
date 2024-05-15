-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 15.05.2024 klo 10:41
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
  `asuntoID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vedos taulusta `asukas`
--

INSERT INTO `asukas` (`asukasID`, `etunimi`, `sukunimi`, `osoite`, `postinumero`, `kaupunki`, `puhelin`, `sposti`, `aktiivinen`, `asuntoID`) VALUES
(2, 'Aleksi', 'Virtanen', 'Kuukkelitie 3', '95400', 'Tornio', '040 2235500', 'aleksi.v@gmail.com', 1, 31),
(3, 'Sofia ', 'Laaksonen', 'Kuukkelitie 3', '95400', 'Tornio', '040 7658890', 'sofia.laaksonen@outlook.fi', 1, 32),
(6, 'Anna', 'Mustonen', 'Kuukkelitie 3', '95400', 'Tornio', '040 0231501', ' anna.mustonen@outlook.com', 1, 33),
(7, 'Lauri', 'Mäkinen', 'Kuukkelitie 3', '95400', 'Tornio', '040 9334600', 'makinenlauri@outlook.com', 1, 34),
(8, 'Riikka', 'Järvinen', 'Kuukkelitie 3', '95400', 'Tornio', '040 7658890', 'riikka.jarvinen@icloud.com', 1, 35),
(9, 'Satu', 'Hakovirta', 'Kuukkelitie 3', '95400', 'Tornio', '050 6235571', 'satu.hako@gmail.com', 1, 36),
(10, 'Jukka', 'Lähteenoja', 'Kuukkelitie 3', '95400', 'Tornio', '045 7706650', 'jukka.lahteenoja@sok.com', 1, 37),
(11, 'Aki', 'Kangas', 'Kuukkelitie 3', '95400', 'Tornio', '045 7122020', 'aki.kangas@gmail.com', 1, 38),
(12, 'Anne-mari', 'Ranttila', 'Mansikkakatu 10', '95420', 'Tornio', '050 8761253', 'am.ranttila@outlook.fi', 1, 39),
(13, 'Henna', 'Hämäläinen', 'Mansikkakatu 3', '95400', 'Tornio', '040 8858880', 'hamalainen.henna@gmail.com', 1, 40),
(20, 'Keijo', 'Lampela', 'Mansikkakatu 10', '95420', 'Tornio', '040 0361223', 'keijo.lampela@outlook.fi', 1, 41),
(21, 'Joonas', 'Kulju', 'Mansikkakatu 10', '95420', 'Tornio', '040 7740250', 'joonas.kulju@gmail.fi', 1, 42),
(22, 'Jonna', 'Yläoja', 'Mansikkakatu 3', '95400', 'Tornio', '040 1837080', 'jonna.ylaoja@gmail.com', 1, 43),
(23, 'Rasmus', 'Tiitto', 'Tähkätie 5', '95400', 'Tornio', '050 9861866', 'rasmus.tiitto@outlook.fi', 1, 51),
(24, 'Iina', 'Kuustonen', 'Tähkätie 5', '95400', 'Tornio', '040 5540022', 'iina.kuustonen@luukku.com', 1, 52),
(25, 'Vesku', 'Jokinen', 'Tähkätie 5', '95400', 'Tornio', '040 0300222', 'jokinenvesku@gmail.com', 1, 57),
(26, 'Pekka', 'Haavisto', 'Tähkätie 5', '95400', 'Tornio', '050 5300972', 'pekka.haavisto@gmail.com', 1, 55),
(27, 'Sanna', 'Miettunen', 'Mansikkakatu 10', '95420', 'Tornio', '050 9760811', 'sanna.miettunen@outlook.fi', 1, 44),
(28, 'Tiia', 'Hietala', 'Tähkätie 5', '95400', 'Tornio', '040 3361523', 'tiia.hietala@edu.lapinamk.fi', 1, 56),
(29, 'Jussi', 'Kumpula', 'Tähkätie 5', '95400', 'Tornio', '045 8117011', 'jussi.kumpula@gmail.com', 1, 58),
(30, 'Pirkko', 'Lintula', 'Mansikkakatu 10', '95420', 'Tornio', '040 6277700', 'lintula.pirkko@gmail.com', 1, 46),
(31, 'Jonne', 'Vasara', 'Mansikkakatu 3', '95420', 'Tornio', '040 0657790', 'jonne.vasara@outlook.fi', 1, 47),
(32, 'Heli', 'Koivula', 'Mansikkakatu 10', '95420', 'Tornio', '040 5670702', 'heli.koivula@gmail.com', 1, 48),
(33, 'Santeri', 'Jaakola', 'Mansikkakatu 3', '95420', 'Tornio', '042 0117735', 'santeri.j@outlook.fi', 1, 49),
(36, 'Ulla', 'Taalasmaa', 'Mansikkakatu 10', '95420', 'Tornio', '040 7670101', 'taalasmaa@gmail.com', 1, 50);

-- --------------------------------------------------------

--
-- Rakenne taululle `asunnot`
--

CREATE TABLE `asunnot` (
  `asuntoID` int(11) NOT NULL,
  `huoneisto` varchar(50) DEFAULT NULL,
  `taloyhtioID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vedos taulusta `asunnot`
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
-- Rakenne taululle `isannoitsija`
--

CREATE TABLE `isannoitsija` (
  `isannoitsijaID` int(11) NOT NULL,
  `etunimi` varchar(50) NOT NULL,
  `sukunimi` varchar(50) NOT NULL,
  `puhelin` varchar(50) NOT NULL,
  `sposti` varchar(50) NOT NULL,
  `aktiivinen` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vedos taulusta `isannoitsija`
--

INSERT INTO `isannoitsija` (`isannoitsijaID`, `etunimi`, `sukunimi`, `puhelin`, `sposti`, `aktiivinen`) VALUES
(1, 'Kirsi', 'Pääkkö', '045 7122020', 'kirsi.paakko@gmail.com', 1),
(2, 'Laura', 'Väänänen', '040 8509933', 'laura.vaananen@gmail.com', 1),
(3, 'Markku', 'Häätylä', '050 7760850', 'markku.haatyla@outlook.fi', 1);

-- --------------------------------------------------------

--
-- Rakenne taululle `kasittely`
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
-- Vedos taulusta `kasittely`
--

INSERT INTO `kasittely` (`kasittelyID`, `pvm`, `valmispvm`, `toimenpide`, `kohde`, `viesti`, `lemmikit`, `yleisavain`, `lahetetty`, `etunimi`, `sukunimi`, `sposti`, `puhelin`, `tyontekijaID`, `vikaID`, `taloyhtioID`, `asuntoID`) VALUES
(61, '2024-05-15 08:24:53', NULL, '', 'Makuuhuoneen patteri', 'Patteri ei lämpene riittävästi, vaikka termostaatt', 0, 1, '2024-05-15 08:24:53', 'Anne-mari', 'Ranttila', 'am.ranttila@outlook.fi', '050 8761253', 7, 115, '3', '39'),
(62, '2024-05-15 08:25:20', '2024-05-15 08:31:53', 'Vaihdettu vanhan tiivisteen tilalle uusi.', 'Parvekkeen ovi', 'Parvekkeen ovesta on repeytynyt tiiviste.', 1, 0, '2024-05-15 08:25:20', 'Pirkko', 'Lintula', 'lintula.pirkko@gmail.com', '040 6277700', 2, 126, '3', '46'),
(63, '2024-05-15 08:25:32', '2024-05-15 08:29:52', 'Suihkupään liitoskohdasta vaihdettu osa.\r\nTestattu ja toimii asianmukaisesti.', 'Kylpyhuoneen suihku', 'Suihkupäästä tulee vain heikosti vettä ja vuotaa s', 1, 1, '2024-05-15 08:25:32', 'Jussi', 'Kumpula', 'jussi.kumpula@gmail.com', '045 8117011', 5, 125, '4', '58'),
(64, '2024-05-15 08:25:36', NULL, '', 'Kattolamppu yleisissä tiloissa', 'Kattolamppu ei syty, vaikka lamppu on vaihdettu uu', 0, 0, '2024-05-15 08:25:36', 'Kirsi', 'Pääkkö', 'kirsi.paakko@gmail.com', '045 7122020', 6, 113, '2', '60'),
(65, '2024-05-15 08:25:54', '2024-05-15 08:30:54', 'Vian syy ei selvinnyt, tilattu valmistajalta korjaaja.', 'Pyykkitupa', 'Ensimmäinen pesukone ei lähde käyntiin.', 0, 0, '2024-05-15 08:25:54', 'Kirsi', 'Pääkkö', 'kirsi.paakko@gmail.com', '045 7122020', 8, 128, '2', '60'),
(66, '2024-05-15 08:26:37', NULL, '', 'Talojen keskellä oleva piha', 'Pihalle on kaatunut koivu', 0, 0, '2024-05-15 08:26:37', 'Riikka', 'Järvinen', 'riikka.jarvinen@icloud.com', '040 7658890', 9, 121, '2', '60'),
(67, '2024-05-15 08:32:11', NULL, '', 'Keittiö, hana', 'Keittiönhana tiputtaa vettä koko ajan', 0, 1, '2024-05-15 08:32:11', 'Aleksi', 'Virtanen', 'aleksi.v@gmail.com', '040 2235500', 2, 112, '2', '31'),
(68, '2024-05-15 08:32:23', '2024-05-15 08:33:26', 'Varastoon asennettu hiirenloukkuja, käydään tarkistamassa loppuviikosta.', 'Varasto', 'Varastossa on näkynyt useasti hiiriä', 0, 0, '2024-05-15 08:32:23', 'Markku ', 'Häätylä', 'markku.haaatyla@outlook.fi', '050 7760850', 5, 122, '3', '64');

-- --------------------------------------------------------

--
-- Rakenne taululle `kayttajat`
--

CREATE TABLE `kayttajat` (
  `kayttajaid` int(11) NOT NULL,
  `kayttajatunnus` varchar(50) NOT NULL,
  `salasana` varchar(255) NOT NULL,
  `rooliID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vedos taulusta `kayttajat`
--

INSERT INTO `kayttajat` (`kayttajaid`, `kayttajatunnus`, `salasana`, `rooliID`) VALUES
(1, 'isannoitsija', 'isannoitsija12', 1),
(2, 'asukas', 'asukas12', 2),
(3, 'tyontekija', 'tyontekija12', 3);

-- --------------------------------------------------------

--
-- Rakenne taululle `oikeudet`
--

CREATE TABLE `oikeudet` (
  `oikeudetID` int(11) NOT NULL,
  `oikeus` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vedos taulusta `oikeudet`
--

INSERT INTO `oikeudet` (`oikeudetID`, `oikeus`) VALUES
(3, 'delete_data'),
(1, 'read_data'),
(2, 'write_data');

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
(3, 'tyontekija'),
(4, 'isannoitsija'),
(5, 'asukas');

-- --------------------------------------------------------

--
-- Rakenne taululle `rooli_oikeudet`
--

CREATE TABLE `rooli_oikeudet` (
  `rooliID` int(11) NOT NULL,
  `oikeudetID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vedos taulusta `rooli_oikeudet`
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
-- Rakenne taululle `taloyhtio`
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
-- Vedos taulusta `taloyhtio`
--

INSERT INTO `taloyhtio` (`taloyhtioID`, `osoite`, `tilat`, `nimi`, `kaupunki`, `postinro`, `isannoitsijaID`) VALUES
(2, 'Kuukkelitie 3', 'Sauna, ulkovarasto, häkkivarastot, pyykkitupa', 'Tornion Kuukkeli', 'Tornio', '95400', 1),
(3, 'Mansikkakatu 10', 'Autopaikat, leikkipuisto, varastot', 'Mansikkakoto', 'Tornio', '95420', 3),
(4, 'Tähkätie 5', 'Yhteinen varasto, grillikatos, autopaikat', 'Kultaranta', 'Tornio', '95400', 2);

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
  `kayttajaID` int(11) NOT NULL,
  `rooliID` int(11) NOT NULL,
  `kasittelyID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vedos taulusta `tyontekija`
--

INSERT INTO `tyontekija` (`tyontekijaID`, `etunimi`, `sukunimi`, `sposti`, `puhelin`, `kuvapolku`, `status`, `kayttajaID`, `rooliID`, `kasittelyID`) VALUES
(2, 'Matti', 'Kallio', 'matti.kallio@kiinteistohuolto.com', '045 7122020', 'img/matti.jpeg', 1, 0, 2, 0),
(3, 'Heli', 'Virtanen', 'heli.virtanen@kiinteistohuolto.com', '040 8509933', 'img/heli.jpeg', 0, 0, 1, 0),
(4, 'Marja', 'Kuusela', 'marja.kuusela@kiinteistohuolto.com', '045 7122020', 'img/marja.jpeg', 0, 0, 1, 0),
(5, 'Aku', 'Hurjanen', 'aku.hurjanen@kiinteistohuolto.com', '040 8509933', 'img/aku.jpeg', 0, 0, 2, 0),
(6, 'Juha', 'Lehtonen', 'juha.lehtonen@kiinteistohuolto.com', '045 9007091', 'img/juha.jpeg', 1, 0, 3, 0),
(7, 'Pekka', 'Lahtela', 'pekka.lahtela@kiinteistohuolto.com', '040 8509933', 'img/pekka.jpeg', 1, 0, 3, 0),
(8, 'Jukka', 'Vasara', 'jukka.vasara@kiinteistohuolto.com', '050 7760850', 'img/jukka.jpeg', 0, 0, 3, 0),
(9, 'Maikki', 'Maijala', 'maikki.maijala@kiinteistohuolto.com', '045 9007091', 'img/maikki.jpeg', 1, 0, 3, 0);

-- --------------------------------------------------------

--
-- Rakenne taululle `vikailmoitus`
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
-- Vedos taulusta `vikailmoitus`
--

INSERT INTO `vikailmoitus` (`vikaID`, `kohde`, `viesti`, `lemmikit`, `yleisavain`, `lahetetty`, `etunimi`, `sukunimi`, `sposti`, `puhelin`, `varattu`, `taloyhtioID`, `asuntoID`) VALUES
(112, 'Keittiö, hana', 'Keittiönhana tiputtaa vettä koko ajan', 0, 1, '2024-05-15 07:04:38', 'Aleksi', 'Virtanen', 'aleksi.v@gmail.com', '040 2235500', 1, 2, 31),
(113, 'Kattolamppu yleisissä tiloissa', 'Kattolamppu ei syty, vaikka lamppu on vaihdettu uuteen.', 0, 0, '2024-05-15 07:06:45', 'Kirsi', 'Pääkkö', 'kirsi.paakko@gmail.com', '045 7122020', 1, 2, 60),
(114, 'Olohuoneen ikkuna', 'Ikkunan avausmekanismi ei toimi kunnolla, ikkunaa ei saa avattua tai suljettua sujuvasti.', 1, 0, '2024-05-15 07:08:36', 'Satu', 'Hakovirta', 'satu.hako@gmail.com', '050 6235571', 0, 2, 36),
(115, 'Makuuhuoneen patteri', 'Patteri ei lämpene riittävästi, vaikka termostaatti on säädetty korkealle lämpötilalle.', 0, 1, '2024-05-15 07:17:02', 'Anne-mari', 'Ranttila', 'am.ranttila@outlook.fi', '050 8761253', 1, 3, 39),
(116, 'Makuuhuoneen sähköpistorasia', 'Sähköpistorasiasta ei tule virtaa tai se on löystynyt ja kontakti on epävarma, mikä voi aiheuttaa laitteiden toimintahäiriöitä tai turvallisuusriskejä.', 0, 0, '2024-05-15 07:25:50', 'Jonna', 'Ylaoja', 'jonna.ylaoja@gmail.com', '040 1837080', 0, 3, 43),
(117, 'Varaston ovi', 'Varaston ovi ei pysy kiinni', 0, 0, '2024-05-15 07:30:19', 'Rasmus', 'Tiitto', 'rasmus.tiitto@outlook.fi', '050 9861866', 0, 4, 65),
(118, 'Makuuhuoneen sähköpistorasia', 'Sähköpistorasia on löystynyt.', 1, 1, '2024-05-15 07:41:59', 'Vesku', 'Jokinen', 'jokinenvesku@gmail.com', '040 0300222', 0, 4, 57),
(119, 'Keittiön liesituuletin', 'Liesituuletin ei poista tehokkaasti keittiössä olevia hajuja ja rasvaa, vaikka sitä käytetään.', 0, 1, '2024-05-15 07:46:54', 'Pekka', 'Haavisto', 'pekka.haavisto@gmail.com', '050 5300972', 0, 4, 55),
(120, 'WC-pönttö', 'WC-pöntöstä vuotaa vettä', 1, 1, '2024-05-15 07:51:10', 'Sanna', 'Miettunen', 'sanna.miettunen@outlook.fi', '050 9760811', 0, 3, 44),
(121, 'Talojen keskellä oleva piha', 'Pihalle on kaatunut koivu', 0, 0, '2024-05-15 07:52:56', 'Riikka', 'Järvinen', 'riikka.jarvinen@icloud.com', '040 7658890', 1, 2, 60),
(122, 'Varasto', 'Varastossa on näkynyt useasti hiiriä', 0, 0, '2024-05-15 07:57:04', 'Markku ', 'Häätylä', 'markku.haaatyla@outlook.fi', '050 7760850', 1, 3, 64),
(123, 'Vaatehuoneen valaistus', 'Vaatehuoneen valo ei toimi tai se vilkkuu epäsäännöllisesti', 0, 1, '2024-05-15 07:59:00', 'Aki', 'Kangas', 'aki.kangas@gmail.com', '045 7122020', 0, 2, 38),
(124, 'Makuuhuoneen ilmanvaihto', 'Makuuhuoneen ilmanvaihto ei toimi asianmukaisesti, aiheuttaa huoneeseen tunkkaisuutta tai kosteusongelmia.', 0, 0, '2024-05-15 08:03:44', 'Tiia', 'Hietala', 'tiia.hietala@edu.lapinamk.fi', 'tiia.hietala@edu.lapinamk.fi', 0, 4, 56),
(125, 'Kylpyhuoneen suihku', 'Suihkupäästä tulee vain heikosti vettä ja vuotaa suihkupään ja letkun liitoksesta.', 1, 1, '2024-05-15 08:08:52', 'Jussi', 'Kumpula', 'jussi.kumpula@gmail.com', '045 8117011', 1, 4, 58),
(126, 'Parvekkeen ovi', 'Parvekkeen ovesta on repeytynyt tiiviste.', 1, 0, '2024-05-15 08:15:56', 'Pirkko', 'Lintula', 'lintula.pirkko@gmail.com', '040 6277700', 1, 3, 46),
(127, 'Leikkipuisto', 'Leikkipuiston liukumäen portaissa on terävä kulma alareunassa.', 0, 0, '2024-05-15 08:19:02', 'Jonne', 'Vasara', 'jonne.vasara@outlook.fi', '040 0657790', 0, 3, 64),
(128, 'Pyykkitupa', 'Ensimmäinen pesukone ei lähde käyntiin.', 0, 0, '2024-05-15 08:20:53', 'Kirsi', 'Pääkkö', 'kirsi.paakko@gmail.com', '045 7122020', 1, 2, 60);

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
-- Indexes for dumped tables
--

--
-- Indexes for table `asukas`
--
ALTER TABLE `asukas`
  ADD PRIMARY KEY (`asukasID`),
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
  ADD PRIMARY KEY (`isannoitsijaID`);

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
  MODIFY `asukasID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

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
  MODIFY `kasittelyID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

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
  MODIFY `vikaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT for table `yhteydenotto`
--
ALTER TABLE `yhteydenotto`
  MODIFY `yhteydenottoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Rajoitteet vedostauluille
--

--
-- Rajoitteet taululle `asukas`
--
ALTER TABLE `asukas`
  ADD CONSTRAINT `asuntoID` FOREIGN KEY (`asuntoID`) REFERENCES `asunnot` (`asuntoID`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Rajoitteet taululle `asunnot`
--
ALTER TABLE `asunnot`
  ADD CONSTRAINT `taloyhtioID` FOREIGN KEY (`taloyhtioID`) REFERENCES `taloyhtio` (`taloyhtioID`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Rajoitteet taululle `kasittely`
--
ALTER TABLE `kasittely`
  ADD CONSTRAINT `tyontekijaID2` FOREIGN KEY (`tyontekijaID`) REFERENCES `tyontekija` (`tyontekijaID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `vikaID2` FOREIGN KEY (`vikaID`) REFERENCES `vikailmoitus` (`vikaID`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Rajoitteet taululle `kayttajat`
--
ALTER TABLE `kayttajat`
  ADD CONSTRAINT `kayttajat_ibfk_1` FOREIGN KEY (`rooliID`) REFERENCES `rooli` (`rooliID`);

--
-- Rajoitteet taululle `rooli_oikeudet`
--
ALTER TABLE `rooli_oikeudet`
  ADD CONSTRAINT `rooli_oikeudet_ibfk_1` FOREIGN KEY (`rooliID`) REFERENCES `rooli` (`rooliID`),
  ADD CONSTRAINT `rooli_oikeudet_ibfk_2` FOREIGN KEY (`oikeudetID`) REFERENCES `oikeudet` (`oikeudetID`);

--
-- Rajoitteet taululle `taloyhtio`
--
ALTER TABLE `taloyhtio`
  ADD CONSTRAINT `isannoitsijaID` FOREIGN KEY (`isannoitsijaID`) REFERENCES `isannoitsija` (`isannoitsijaID`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Rajoitteet taululle `tyontekija`
--
ALTER TABLE `tyontekija`
  ADD CONSTRAINT `rooliID` FOREIGN KEY (`rooliID`) REFERENCES `rooli` (`rooliID`);

--
-- Rajoitteet taululle `vikailmoitus`
--
ALTER TABLE `vikailmoitus`
  ADD CONSTRAINT `asuntoID1` FOREIGN KEY (`asuntoID`) REFERENCES `asunnot` (`asuntoID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `taloyhtioID1` FOREIGN KEY (`taloyhtioID`) REFERENCES `taloyhtio` (`taloyhtioID`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
