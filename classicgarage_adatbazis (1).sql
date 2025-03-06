-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2025. Már 06. 11:42
-- Kiszolgáló verziója: 10.4.28-MariaDB
-- PHP verzió: 8.2.4

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
CREATE DATABASE IF NOT EXISTS `classicgarage_adatbazis` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `classicgarage_adatbazis`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `aspnetroleclaims`
--

CREATE TABLE `aspnetroleclaims` (
  `Id` int(11) NOT NULL,
  `RoleId` varchar(255) NOT NULL,
  `ClaimType` longtext DEFAULT NULL,
  `ClaimValue` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `aspnetroles`
--

CREATE TABLE `aspnetroles` (
  `Id` varchar(255) NOT NULL,
  `Name` varchar(256) DEFAULT NULL,
  `NormalizedName` varchar(256) DEFAULT NULL,
  `ConcurrencyStamp` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `aspnetuserclaims`
--

CREATE TABLE `aspnetuserclaims` (
  `Id` int(11) NOT NULL,
  `UserId` varchar(255) NOT NULL,
  `ClaimType` longtext DEFAULT NULL,
  `ClaimValue` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `aspnetuserlogins`
--

CREATE TABLE `aspnetuserlogins` (
  `LoginProvider` varchar(255) NOT NULL,
  `ProviderKey` varchar(255) NOT NULL,
  `ProviderDisplayName` longtext DEFAULT NULL,
  `UserId` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `aspnetuserroles`
--

CREATE TABLE `aspnetuserroles` (
  `UserId` varchar(255) NOT NULL,
  `RoleId` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `aspnetusers`
--

CREATE TABLE `aspnetusers` (
  `Id` varchar(255) NOT NULL,
  `FullName` longtext DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `aspnetusers`
--

INSERT INTO `aspnetusers` (`Id`, `FullName`, `UserName`, `NormalizedUserName`, `Email`, `NormalizedEmail`, `EmailConfirmed`, `PasswordHash`, `SecurityStamp`, `ConcurrencyStamp`, `PhoneNumber`, `PhoneNumberConfirmed`, `TwoFactorEnabled`, `LockoutEnd`, `LockoutEnabled`, `AccessFailedCount`) VALUES
('17b5043f-4951-46e2-bbc4-c1723314e1db', NULL, 'peter01', 'PETER01', 'peter@gmail.com', 'PETER@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEDewBUYDNnX3e2c3UwZfCQwI+Az66NLufbIujrQ2cr4fHuXxXpFWwu369ng2zDEYnA==', '7YLXEQFMV3MLHFE5GXVDFLF56VEUTZV5', 'a743ef4b-5581-48f3-ba3d-89be0e8c0784', NULL, 0, 0, NULL, 1, 0),
('5f9c1b9d-bfda-47c2-ab16-cc903b2c10d2', NULL, 'ricsi12', 'RICSI12', 'ricsi@gmail.com', 'RICSI@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEDPydVe1YMzi9TsApGD6SV6UDzV/x0MuIis/qga4j31lpC7KMUQuePpcV20h7rxjtA==', 'QZF4AKIQ6DH5JJQ5SADIBYGU4WC33H4L', '3f9ac7ca-0ca7-401b-ad97-847968af74a6', NULL, 0, 0, NULL, 1, 0),
('9e76eb5d-2249-42c3-9ddd-23c56386f4b8', NULL, 'ilona01', 'ILONA01', 'ilona@gmail.com', 'ILONA@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAENQRTPGK52FKMb9VivyTerngFyvahg6QIjfX4/IUneNSjZu//7PJP8fXgdvFn6ZnfA==', 'A5O4ISY5Q7YYHKKFG6I4QI3BUT4N5L7B', '78ea157d-3e8a-4905-9a93-0e0b5fca503d', NULL, 0, 0, NULL, 1, 0);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `aspnetusertokens`
--

CREATE TABLE `aspnetusertokens` (
  `UserId` varchar(255) NOT NULL,
  `LoginProvider` varchar(255) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Value` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `autoks`
--

CREATE TABLE `autoks` (
  `Id` char(36) NOT NULL,
  `IdEv` int(11) NOT NULL,
  `Marka` longtext DEFAULT NULL,
  `Nev` longtext DEFAULT NULL,
  `GyartasEv` int(11) DEFAULT NULL,
  `ritkae` tinyint(1) NOT NULL,
  `Kerekmeghajtas` longtext DEFAULT NULL,
  `maxteljesitmeny` longtext DEFAULT NULL,
  `Tortenet` longtext DEFAULT NULL,
  `Kep` longtext DEFAULT NULL,
  `Kobcenti` longtext NOT NULL,
  `Tipus` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `autoks`
--

INSERT INTO `autoks` (`Id`, `IdEv`, `Marka`, `Nev`, `GyartasEv`, `ritkae`, `Kerekmeghajtas`, `maxteljesitmeny`, `Tortenet`, `Kep`, `Kobcenti`, `Tipus`) VALUES
('29cc4580-b1a6-4c4c-a665-6f7daba47c75', 50, 'Ford Thunderbird', NULL, 1955, 0, 'Hátsó kerék meghajtás', '193', 'A Ford Thunderbird első generációja egy kétüléses kabrió , amelyet a Ford 1955-től 1957-ig gyártott , az első kétüléses Ford 1938 óta. A New York-i Autószalonon 1953-ban megjelent Motorama-kijelzőre válaszul fejlesztették ki , amelyen a Chevrolet Corvette volt látható . A Corvette-et pedig az európai sportautók amerikaiak körében elterjedt népszerűségére válaszul fejlesztették ki .', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/28/1957_Ford_Thunderbird_%2820418643125%29_%28cropped%29.jpg/1920px-1957_Ford_Thunderbird_%2820418643125%29_%28cropped%29.jpg', '4800', 'Luxusautó'),
('396537a9-cb82-4491-a54e-5c42f4729c59', 70, 'Chevrolet Corvette', NULL, 1968, 0, 'Hátsó kerék meghajtás', '430', 'A Chevrolet Corvette (C3) a Corvette sportautó harmadik generációja , amelyet 1967 és 1982 között gyártott a Chevrolet az 1968 és 1982 közötti modellévekben . A motorok és az alvázalkatrészek többnyire az előző generációból származtak , de a karosszéria és a belső tér új volt. Az 1979-es modellévben 53 807 darabbal új eladási rekordokat döntött. A C3 volt a második Corvette, amely a Stingray nevet viselte , bár csak az 1969–76-os modellévekre. Ezúttal egyetlen szó volt, szemben az 1963–1967-es C2 generációnál használt Sting Ray- vel . A nevet aztán 2014-ig visszavonták, amikor is a C7 kiadásával visszatért. A történelem legdrágább Corvette C3-ja egy 1969-es L88 Lightweight volt, egyike a négy gyártott könnyű L88-nak. Barrett-Jackson eladta 2014 januárjában 2 860 000 dollárért (1 060 116 200 Forint).', 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Chevrolet_Corvette_C3_Stingray_IMG_3199.jpg/1280px-Chevrolet_Corvette_C3_Stingray_IMG_3199.jpg', '7400', 'Sportautó'),
('3ac3fa09-4a45-414b-8554-659416a00a3d', 70, 'Ford Pinto', NULL, 1970, 0, 'Első kerék meghajtás', '100', 'A Ford Pinto egy kiskategóriás autó, amelyet a Ford Motor Company gyártott 1970 és 1980 között. Először csak kétajtós kupé változatban készült, de gyártásának második évében megjelent a ferde hátú változat Ford Pinto Runabout néven és a kétfajta kombi is. A Ford az AMC Gremlin, a Chevrolet Vega és a Volkswagen, a Datsun, valamint a Toyota hasonló kategóriájú modelljei vetélytársául szánta a Pintót. A felsoroltak közül mindegyiknél több darab készült belőle. A legtöbbet 1974-ben gyártották, ekkor 544 029 autó hagyta el a gyártósort, amivel a Pinto szintén vetélytársai fölé nőtt az egy év alatt elkészült modellek számát tekintve. 1976-ra összesen már több mint 2,3 millió darab készült le. A kocsi gyártása 1980-ban fejeződött be, abban az évben mindössze 68 179 készült belőle. Népszerű volt a vásárlók közében, 1971 januárjára már 100 ezernél is több Pinto talált gazdára, az év végéig pedig összesen 352 402 darabot adtak el belőle. A gyártás befejezéséig több mint 3 millió Pinto kelt el.', 'https://upload.wikimedia.org/wikipedia/commons/f/f0/Ford_Pinto.jpg', '2000', 'Sportautó'),
('60991e79-f081-4ba1-96b0-d374a2e0d633', 60, 'Dodge Charger', NULL, 1966, 0, 'Hátsó kerék meghajtás', '370', 'Az 1960-as évek elején az autógyártók új ötleteket fedeztek fel a személyes luxus- és speciális autók szegmensében. A speciális autók piacára lassan belépő Chrysler a Dodge Division-t választotta, hogy egy közepes méretű B-karosszériás sportos autóval lépjen be a piacra, amely az „ izomautó ” Ford Mustang és a „ személyes luxus ” Ford Thunderbird közé illeszkedik. A szándék az volt, hogy a lehető legtöbb meglévő vállalati hardvert megosszák egy fastback megjelenéssel, a Chrysler 300 luxuskupéból levont tanulságok felhasználásával.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9d/1969_Dodge_Charger_R-T%2C_front_right_%282022_Ellwood_City_Fall_Fest_%26_Car_Cruise%29.jpg/1920px-1969_Dodge_Charger_R-T%2C_front_right_%282022_Ellwood_City_Fall_Fest_%26_Car_Cruise%29.jpg', '7200', 'Izomautó'),
('79ed21e5-733f-4947-b87d-aa7f939f94d5', 60, 'Ford Mustang', NULL, 1964, 0, 'Hátsó kerék meghajtás', '271', 'Az első generációs Ford Mustangot a Ford 1964 márciusa és 1973 között gyártotta. A Mustang bemutatása az autók új osztályát hozta létre, pónikocsiként ismert. A Mustang stílusa, hosszú motorháztetőjével és rövid fedélzetével rendkívül népszerűnek bizonyult, és számos versenyt inspirált.1964. április 17-én mutatták be keménytetős és kabrió formájában, a gyorshátú változat pedig 1964 augusztusában következett. A bevezetéskor a Mustang, amely a Falconnal osztozik platformján , bekerült a kompakt autók szegmensébe.Az első generációs Mustangok mérete és motorteljesítménye minden egyes átdolgozással nőtt. Az 1971-es modell drasztikus újratervezést kapott. A kezdeti felfutás után az eladások folyamatosan csökkentek, és a Ford elkezdett dolgozni egy új generációs Mustangon. Az 1973-as olajválság kitörésére a Ford felkészült, már az 1974-es modellévre tervezte a kisebb Mustang II-t . Ez az új autó nem osztott alkatrészt a korábbi modellekkel.', 'https://upload.wikimedia.org/wikipedia/commons/7/7c/Ford_Mustang_%281964%29_-_28540253076.jpg', '4700', 'Izom autó'),
('940ba613-41f8-4825-b496-a2f60d751b9f', 60, 'Chevrolet Camaro', NULL, 1966, 0, 'Hátsó kerék meghajtás', '435', 'Az első generációs Chevrolet Camaro egy amerikai izomautó, amelyet a Chevrolet 1966 őszén mutatott be az 1967-es modellévhez . Vadonatúj hátsókerék-hajtású GM F-karosszéria-platformot használt, és 2 ajtós, 2+2 üléses, keménytetős és kabrió kivitelben is elérhető volt . Az F-testet minden generáció megosztotta a Pontiac Firebirddel . A Chevrolet straight-6- ban egy 230 cu-s volt az alapfelszereltség, és számos Chevy V8-as választható volt. Az első generációs Camaro az 1969-es modellévig készült.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a3/Chevrolet_Camaro_RS_327_1968_%28cropped%29.jpg/1920px-Chevrolet_Camaro_RS_327_1968_%28cropped%29.jpg', '4600', 'Izom autó'),
('a4ad0433-46c2-4c75-bf83-8ee2660ddd19', 70, 'Porsche 911', NULL, 1970, 0, 'Hátsó kerék meghajtás', '260', 'Az eredeti Porsche 911 ( ejtsd: kilenc tizenegy , németül : Neunelfer ) a németországi stuttgarti Porsche AG által gyártott luxussportkocsi . A híres, jellegzetes és tartós dizájn prototípusát 1963 őszén mutatták be a nagyközönségnek. A gyártás 1964 szeptemberében kezdődött és 1989-ig tartott. Ezt egy módosított változat követte, amelyet belsőleg Porsche 964 néven emlegetnek , de továbbra is Porsche 911 néven árulják , akárcsak a jelenlegi modelleket.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Porsche_911E_ca_1969.jpg/1280px-Porsche_911E_ca_1969.jpg', '3300', 'Sportautó'),
('adbae813-6756-4764-b0a1-06769f982078', 60, 'Jaguar E-Type', NULL, 1961, 0, 'Hátsó kerék meghajtás', '265', 'A Jaguar E-Type vagy az észak-amerikai piacon a Jaguar XK-E egy brit első középmotoros sportautó , amelyet a Jaguar Cars Ltd gyártott 1961 és 1974 között. A kivételes esztétika, a fejlett technológiák, a nagy teljesítmény és a versenyképes ár kombinációja a modellt az autózás világának ikonjává tette. Az E-Type 150 mérföld/óra (240 km/h) végsebessége, 7 másodperc alatti 0-60 mph (97 km/h) gyorsulás, nagyrészt egységes karosszériafelépítés, független első és hátsó felfüggesztés tárcsafékekkel , beépített hátsó felfüggesztés , valamint megkülönböztetett hátsó fogasléc. iparági változások.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6d/Jaguar_E-Type_Series_1_3.8_Litre_1961.jpg/1920px-Jaguar_E-Type_Series_1_3.8_Litre_1961.jpg', '3800', 'Sportautó'),
('b2aa4f50-a696-4703-823a-fc847f1f45e6', 50, 'Plymouth Fury', NULL, 1955, 0, 'Hátsó kerék meghajtás', '290', 'A Plymouth Fury egy olyan autómodell, amelyet a Plymouth gyártott 1955-től 1989-ig. Az 1956-os modellévre a Plymouth Belvedere alsorozataként mutatták be, 1959-ben egy szinttel a korabeli Belvedere felett. 1962-től 1964-ig ismét egy teljes méretű autó 1965 és 1974 között, és ismét egy közepes méretű autó 1975 és 1978 között. 1975-től 1977-ig a Fury-t a teljes méretű Plymouth Gran Fury mellett árulták. 1978-ban a B-testű Fury volt a legnagyobb Plymouth, és 1979-ben már nem volt nagy Plymouth. Ezt a termékhiányt 1980-ban pótolták az R-body Gran Fury-val, majd 1982-ben az M-body Fury-val. Az utolsó V8-as, RWD Plymouth Fury gyártása 1988. december 23-án fejeződött be a Kenosha Main összeszerelő üzemben, Kenosha-ban, WI. V8/RWD szedán.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0e/1959_Plymouth_Sport_Fury_photo-13.JPG/1024px-1959_Plymouth_Sport_Fury_photo-13.JPG', '5200', 'Luxusautó'),
('b9533371-7589-498a-8214-3f2a45933e20', 50, 'Chevrolet Corvette (C1)', NULL, 1953, 0, 'Hátsó kerék meghajtás', '340', 'A Chevrolet Corvette (C1) a Chevrolet által gyártott Corvette sportautó első generációja . Az 1953-as modellév végén mutatták be, és 1962-ig gyártották. Ezt a generációt általában szilárd tengelyes generációnak nevezik, mivel a független hátsó felfüggesztés csak az 1963-as Sting Ray-nél jelent meg. A Corvette-et a debütáló modellévre sietve gyártották, hogy kihasználják a koncepciójármű iránti lelkes közönség reakcióját. Az új modellel kapcsolatos várakozások azonban nagyrészt nem teljesültek.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Chevrolet_Corvette_C1_front-right_2016_Shanghai_Auto_Museum.jpg/1280px-Chevrolet_Corvette_C1_front-right_2016_Shanghai_Auto_Museum.jpg', '5400', 'Sportautó'),
('c12249c8-0189-467f-9c55-23a22859c6ed', 60, 'Mini Morris', NULL, 1960, 0, 'Első kerék meghajtás', '34', 'Az eredeti Minit az 1960-as évek brit populáris kultúrájának ikonjának tartják. Helytakarékos keresztirányú motorja és elsőkerék-hajtású elrendezése – lehetővé téve, hogy az autó padlólemezének területének 80%-a utasok és poggyász elhelyezésére szolgáljon – az autógyártók generációjára hatott. 1999-ben a Minit a 20. század második legbefolyásosabb autójának választották, a Ford Model T mögött, és megelőzve a Citroën DS-t és a Volkswagen Beetle-t. Az elsőkerék-hajtású, keresztirányú motoros elrendezést számos más szupermini stílusú autótervezésben használták, mint például a Honda N360 (1967), a Nissan Cherry (1970) és a Fiat 127 (1971). Az elrendezést a nagyobb szubkompakt kialakításokhoz is igazították.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2f/Morris_Mini-Minor_1959_%28621_AOK%29.jpg/1280px-Morris_Mini-Minor_1959_%28621_AOK%29.jpg', '848', 'Városi autó'),
('c8b2831d-2261-4297-8bd6-7d56c32a62d6', 50, 'Cadillac Eldorado', NULL, 1953, 0, 'Hátsó kerék meghajtás', '', 'A Cadillac Eldorado egy luxusautó, amelyet a Cadillac gyártott és forgalmazott 1952 és 2002 között tizenkét generáción keresztül.Az Eldorado a Cadillac vonal tetején vagy annak közelében volt. Az eredeti, 1953-as Eldorado kabrió és az 1957–1960-as Eldorado Brougham modellek külön karosszériával rendelkeztek, és ezek voltak a Cadillac által azokban az években kínált legdrágább modellek. Az Eldorado árban 1966-ig soha nem volt kevesebb, mint a második a Cadillac Series 75 limuzin után. 1967-től az Eldorado megőrizte prémium pozícióját a Cadillac árstruktúrájában, de nagy mennyiségben gyártották egyedi, kétajtós személyi luxusautó platformon.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a8/1963_Cadillac_Eldorado_convertible%2C_front_5.19.19.jpg/1920px-1963_Cadillac_Eldorado_convertible%2C_front_5.19.19.jpg', '5400', 'Luxusautó');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `comments`
--

CREATE TABLE `comments` (
  `Id` char(36) NOT NULL,
  `PostComment` longtext NOT NULL,
  `CommenteloId` varchar(255) NOT NULL,
  `AutoId` char(36) NOT NULL,
  `CreatedTime` datetime(6) NOT NULL DEFAULT '0001-01-01 00:00:00.000000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `__efmigrationshistory`
--

CREATE TABLE `__efmigrationshistory` (
  `MigrationId` varchar(150) NOT NULL,
  `ProductVersion` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `__efmigrationshistory`
--

INSERT INTO `__efmigrationshistory` (`MigrationId`, `ProductVersion`) VALUES
('20250224103707_CreateDb', '8.0.12'),
('20250227091428_AddColumns', '8.0.12'),
('20250228072410_Columns', '8.0.12'),
('20250228073252_MigrDb', '8.0.12');

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
-- A tábla indexei `autoks`
--
ALTER TABLE `autoks`
  ADD PRIMARY KEY (`Id`);

--
-- A tábla indexei `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_Comments_AutoId` (`AutoId`),
  ADD KEY `IX_Comments_CommenteloId` (`CommenteloId`);

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
-- Megkötések a táblához `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `FK_Comments_AspNetUsers_CommenteloId` FOREIGN KEY (`CommenteloId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Comments_Autoks_AutoId` FOREIGN KEY (`AutoId`) REFERENCES `autoks` (`Id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
