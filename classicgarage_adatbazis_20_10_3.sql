-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2025. Feb 10. 13:19
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
-- Tábla szerkezet ehhez a táblához `autok`
--

CREATE TABLE `autok` (
  `ID` char(36) COLLATE utf8_hungarian_ci NOT NULL,
  `ID_ev` int(11) NOT NULL,
  `Marka` varchar(30) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `Gyartas_Ev` int(11) DEFAULT NULL,
  `Tortenet` varchar(300) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `Kep` varchar(255) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `Comentei_ID` char(36) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `Muszaki_ID` char(36) COLLATE utf8_hungarian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `autok`
--

INSERT INTO `autok` (`ID`, `ID_ev`, `Marka`, `Gyartas_Ev`, `Tortenet`, `Kep`, `Comentei_ID`, `Muszaki_ID`) VALUES
('50340637-45a6-4a86-ba59-df5063c9e888', 80, 'Buick', 1995, 'CVM', 'http://salon.com/morbi/non/quam/nec.png?adipiscing=nisl&elit=duis&proin=bibendum&risus=felis&praesent=sed&lectus=interdum&vestibulum=venenatis&quam=turpis&sapien=enim&varius=blandit&ut=mi&blandit=in&non=porttitor&interdum=pede&in=justo&ante=eu&vestibulum=', '1e52995a-4163-4f6c-a04b-aade55da71d6', '47f5a274-a3ea-4ada-ac9d-c52b377c3654'),
('9d713298-bf04-4f5e-a62f-289d82c9317b', 70, 'Mercury', 2001, 'BHU', 'https://edublogs.org/mi/in/porttitor/pede/justo/eu.xml?sed=vivamus&magna=tortor&at=duis&nunc=mattis&commodo=egestas&placerat=metus&praesent=aenean&blandit=fermentum&nam=donec&nulla=ut&integer=mauris&pede=eget&justo=massa&lacinia=tempor&eget=convallis&tinc', '599168cb-64b4-4a77-a5e5-173297166cba', '6896665c-497f-48f1-b79f-b98421e3e898'),
('b005cbf2-2f7e-4200-928c-c749f9d7dec4', 6, 'Nissan', 2013, 'WRI', 'http://disqus.com/at/turpis.xml?sit=est&amet=et&diam=tempus&in=semper&magna=est&bibendum=quam&imperdiet=pharetra&nullam=magna&orci=ac&pede=consequat&venenatis=metus&non=sapien&sodales=ut&sed=nunc&tincidunt=vestibulum&eu=ante&felis=ipsum&fusce=primis&posue', '70189bf0-89c3-4a65-bddb-913b012f351f', '472cd633-10c1-4cfd-baa9-b458df93fd0a'),
('b736d1d7-fabc-431f-b3ba-50d46ad3fda2', 60, 'Pontiac', 2002, 'RJH', 'https://dot.gov/augue/vestibulum/rutrum/rutrum/neque.jsp?molestie=consequat&sed=lectus&justo=in&pellentesque=est&viverra=risus&pede=auctor&ac=sed&diam=tristique&cras=in', '27373d37-7614-432d-802c-f6f77ec09aba', '8f017219-dc73-4fad-b5f8-ed4b18c3f181'),
('beba39dd-74d3-459a-ba3d-e4cc171cc449', 80, 'Jaguar', 2008, 'QYD', 'http://miibeian.gov.cn/parturient/montes/nascetur/ridiculus/mus.png?leo=ultrices&rhoncus=enim&sed=lorem&vestibulum=ipsum&sit=dolor&amet=sit&cursus=amet&id=consectetuer&turpis=adipiscing&integer=elit&aliquet=proin&massa=interdum&id=mauris&lobortis=non&conv', 'a293a6df-c9b1-4503-9982-ca623aeaff48', '11deec11-08a5-4975-b5f7-bb6df9dcda61'),
('cc554ba4-943b-44c7-8444-4d7f51f5b797', 70, 'Ford', 1997, 'KOP', 'http://narod.ru/ut/massa.json?quam=aliquet&sollicitudin=ultrices&vitae=erat&consectetuer=tortor&eget=sollicitudin&rutrum=mi&at=sit&lorem=amet&integer=lobortis&tincidunt=sapien&ante=sapien&vel=non&ipsum=mi&praesent=integer&blandit=ac&lacinia=neque&erat=dui', '5713ec45-926b-421c-acfc-168f7cc0bd1d', '87590f2f-8136-4f87-9f9e-21b87641c54f');

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
-- A tábla indexei `autok`
--
ALTER TABLE `autok`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Comentei_ID` (`Comentei_ID`,`Muszaki_ID`),
  ADD KEY `Muszaki_ID` (`Muszaki_ID`);

--
-- A tábla indexei `comment`
--
ALTER TABLE `comment`
  ADD KEY `Commentelo_ID` (`Commentelo_ID`),
  ADD KEY `ID` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
