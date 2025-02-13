-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2025. Feb 13. 11:26
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

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

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `aspnetroleclaims`
--

CREATE TABLE `aspnetroleclaims` (
  `Id` int(11) NOT NULL,
  `RoleId` varchar(255) NOT NULL,
  `ClaimType` longtext DEFAULT NULL,
  `ClaimValue` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `aspnetroles`
--

CREATE TABLE `aspnetroles` (
  `Id` varchar(255) NOT NULL,
  `Name` varchar(256) DEFAULT NULL,
  `NormalizedName` varchar(256) DEFAULT NULL,
  `ConcurrencyStamp` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `aspnetroles`
--

INSERT INTO `aspnetroles` (`Id`, `Name`, `NormalizedName`, `ConcurrencyStamp`) VALUES
('a53db9f4-ea9d-46f1-84ee-46e65274abe3', 'admin', 'ADMIN', NULL);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `aspnetuserclaims`
--

CREATE TABLE `aspnetuserclaims` (
  `Id` int(11) NOT NULL,
  `UserId` varchar(255) NOT NULL,
  `ClaimType` longtext DEFAULT NULL,
  `ClaimValue` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `aspnetuserlogins`
--

CREATE TABLE `aspnetuserlogins` (
  `LoginProvider` varchar(255) NOT NULL,
  `ProviderKey` varchar(255) NOT NULL,
  `ProviderDisplayName` longtext DEFAULT NULL,
  `UserId` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `aspnetuserroles`
--

CREATE TABLE `aspnetuserroles` (
  `UserId` varchar(255) NOT NULL,
  `RoleId` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `aspnetuserroles`
--

INSERT INTO `aspnetuserroles` (`UserId`, `RoleId`) VALUES
('655f553b-c055-4f93-8f2b-f21516847832', 'a53db9f4-ea9d-46f1-84ee-46e65274abe3');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `aspnetusers`
--

CREATE TABLE `aspnetusers` (
  `Id` varchar(255) NOT NULL,
  `FullName` longtext DEFAULT NULL,
  `Birthdate` datetime(6) NOT NULL,
  `UserName` varchar(256) DEFAULT NULL,
  `NormalizedUserName` varchar(256) DEFAULT NULL,
  `Email` varchar(256) DEFAULT NULL,
  `NormalizedEmail` varchar(256) DEFAULT NULL,
  `EmailConfirmed` tinyint(1) NOT NULL,
  `PasswordHash` longtext DEFAULT NULL,
  `SecurityStamp` longtext DEFAULT NULL,
  `ConcurrencyStamp` longtext DEFAULT NULL,
  `PhoneNumber` longtext DEFAULT NULL,
  `PhoneNumberConfirmed` tinyint(1) NOT NULL,
  `TwoFactorEnabled` tinyint(1) NOT NULL,
  `LockoutEnd` datetime DEFAULT NULL,
  `LockoutEnabled` tinyint(1) NOT NULL,
  `AccessFailedCount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `aspnetusers`
--

INSERT INTO `aspnetusers` (`Id`, `FullName`, `Birthdate`, `UserName`, `NormalizedUserName`, `Email`, `NormalizedEmail`, `EmailConfirmed`, `PasswordHash`, `SecurityStamp`, `ConcurrencyStamp`, `PhoneNumber`, `PhoneNumberConfirmed`, `TwoFactorEnabled`, `LockoutEnd`, `LockoutEnabled`, `AccessFailedCount`) VALUES
('589b359e-0ec7-48c7-95c0-acb29ade60fe', NULL, '2025-01-16 10:17:51.836000', 'sadsadsa', 'SADSADSA', 'alma@körte.hu', 'ALMA@KÖRTE.HU', 0, 'AQAAAAIAAYagAAAAENBYugeWbC3XbriR6jS0yUOg9uNpTo3ox2RWjKOUEDOkrKBbeubek6T+qiAvABWt+g==', '2KBQESY2QYGN3BAMQJIM5H2TFVS6GYKT', '0f32f912-2ba2-4e24-9f9b-66fe46ba5c79', NULL, 0, 0, NULL, 1, 0),
('655f553b-c055-4f93-8f2b-f21516847832', NULL, '2025-01-23 06:33:43.010000', 'ricsi', 'RICSI', 'string', 'STRING', 0, 'AQAAAAIAAYagAAAAEHmi6b/+tk32et3OTRL6cN99VQEVTYvO74/HRVoKmuP7WrGYHrDv7hMP83eBlJTZpA==', 'P6ADCPH5GQER23XLV6LCIGBTSXE5RDS6', '67702c7e-c2d6-4841-832f-c37e3e074717', NULL, 0, 0, NULL, 1, 0);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `aspnetusertokens`
--

CREATE TABLE `aspnetusertokens` (
  `UserId` varchar(255) NOT NULL,
  `LoginProvider` varchar(255) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Value` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `autok`
--

CREATE TABLE `autok` (
  `ID` char(36) NOT NULL,
  `ID_ev` int(11) NOT NULL,
  `Marka` varchar(30) DEFAULT NULL,
  `Gyartas_Ev` int(11) DEFAULT NULL,
  `Tortenet` varchar(300) DEFAULT NULL,
  `Kep` varchar(255) DEFAULT NULL,
  `Comentei_ID` char(36) DEFAULT NULL,
  `Muszaki_ID` char(36) DEFAULT NULL
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
  `ID` char(36) NOT NULL,
  `CommenteloID` varchar(255) NOT NULL,
  `Comment` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `__efmigrationshistory`
--

CREATE TABLE `__efmigrationshistory` (
  `MigrationId` varchar(150) NOT NULL,
  `ProductVersion` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `__efmigrationshistory`
--

INSERT INTO `__efmigrationshistory` (`MigrationId`, `ProductVersion`) VALUES
('20250116082936_CreateAuthDb', '8.0.12');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `aspnetroleclaims`
--
ALTER TABLE `aspnetroleclaims`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_AspNetRoleClaims_RoleId` (`RoleId`);

--
-- A tábla indexei `aspnetroles`
--
ALTER TABLE `aspnetroles`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `RoleNameIndex` (`NormalizedName`);

--
-- A tábla indexei `aspnetuserclaims`
--
ALTER TABLE `aspnetuserclaims`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_AspNetUserClaims_UserId` (`UserId`);

--
-- A tábla indexei `aspnetuserlogins`
--
ALTER TABLE `aspnetuserlogins`
  ADD PRIMARY KEY (`LoginProvider`,`ProviderKey`),
  ADD KEY `IX_AspNetUserLogins_UserId` (`UserId`);

--
-- A tábla indexei `aspnetuserroles`
--
ALTER TABLE `aspnetuserroles`
  ADD PRIMARY KEY (`UserId`,`RoleId`),
  ADD KEY `IX_AspNetUserRoles_RoleId` (`RoleId`);

--
-- A tábla indexei `aspnetusers`
--
ALTER TABLE `aspnetusers`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `UserNameIndex` (`NormalizedUserName`),
  ADD KEY `EmailIndex` (`NormalizedEmail`);

--
-- A tábla indexei `aspnetusertokens`
--
ALTER TABLE `aspnetusertokens`
  ADD PRIMARY KEY (`UserId`,`LoginProvider`,`Name`);

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
  ADD PRIMARY KEY (`ID`),
  ADD KEY `CommenteloID` (`CommenteloID`);

--
-- A tábla indexei `__efmigrationshistory`
--
ALTER TABLE `__efmigrationshistory`
  ADD PRIMARY KEY (`MigrationId`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `aspnetroleclaims`
--
ALTER TABLE `aspnetroleclaims`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `aspnetuserclaims`
--
ALTER TABLE `aspnetuserclaims`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `aspnetroleclaims`
--
ALTER TABLE `aspnetroleclaims`
  ADD CONSTRAINT `FK_AspNetRoleClaims_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `aspnetroles` (`Id`) ON DELETE CASCADE;

--
-- Megkötések a táblához `aspnetuserclaims`
--
ALTER TABLE `aspnetuserclaims`
  ADD CONSTRAINT `FK_AspNetUserClaims_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE;

--
-- Megkötések a táblához `aspnetuserlogins`
--
ALTER TABLE `aspnetuserlogins`
  ADD CONSTRAINT `FK_AspNetUserLogins_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE;

--
-- Megkötések a táblához `aspnetuserroles`
--
ALTER TABLE `aspnetuserroles`
  ADD CONSTRAINT `FK_AspNetUserRoles_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `aspnetroles` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_AspNetUserRoles_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE;

--
-- Megkötések a táblához `aspnetusertokens`
--
ALTER TABLE `aspnetusertokens`
  ADD CONSTRAINT `FK_AspNetUserTokens_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE;

--
-- Megkötések a táblához `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`CommenteloID`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
