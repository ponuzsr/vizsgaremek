-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Dec 04. 13:38
-- Kiszolgáló verziója: 10.4.20-MariaDB
-- PHP verzió: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `classicgarage_adatbazis`
--
CREATE DATABASE IF NOT EXISTS `classicgarage_adatbazis` DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;
USE `classicgarage_adatbazis`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `adatok`
--

CREATE TABLE `adatok` (
  `ID` char(36) COLLATE utf8_hungarian_ci NOT NULL,
  `Marka` varchar(30) COLLATE utf8_hungarian_ci NOT NULL,
  `Gyartas_Ev` int(11) NOT NULL,
  `Nepszeruseg_Csucs` int(11) NOT NULL,
  `Tortenet` varchar(300) COLLATE utf8_hungarian_ci NOT NULL,
  `Kep` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `Ritkasag` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `auto`
--

CREATE TABLE `auto` (
  `ID` char(36) COLLATE utf8_hungarian_ci NOT NULL,
  `Comment_Sec_ID` char(36) COLLATE utf8_hungarian_ci NOT NULL,
  `Adat_ID` char(36) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `comment`
--

CREATE TABLE `comment` (
  `ID` char(36) COLLATE utf8_hungarian_ci NOT NULL,
  `Commentelo_ID` char(36) COLLATE utf8_hungarian_ci NOT NULL,
  `Comment` varchar(255) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `adatok`
--
ALTER TABLE `adatok`
  ADD PRIMARY KEY (`ID`);

--
-- A tábla indexei `auto`
--
ALTER TABLE `auto`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Comment_Sec_ID` (`Comment_Sec_ID`,`Adat_ID`),
  ADD KEY `Adat_ID` (`Adat_ID`);

--
-- A tábla indexei `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`ID`);

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `adatok`
--
ALTER TABLE `adatok`
  ADD CONSTRAINT `adatok_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `auto` (`Adat_ID`);

--
-- Megkötések a táblához `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `auto` (`Comment_Sec_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
