-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2025. Feb 16. 12:08
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
CREATE DATABASE IF NOT EXISTS `classicgarage_adatbazis` DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;
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
  `Tortenet` mediumtext DEFAULT NULL,
  `Kep` varchar(255) DEFAULT NULL,
  `Comentei_ID` char(36) DEFAULT NULL,
  `Muszaki_ID` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `autok`
--

INSERT INTO `autok` (`ID`, `ID_ev`, `Marka`, `Gyartas_Ev`, `Tortenet`, `Kep`, `Comentei_ID`, `Muszaki_ID`) VALUES
('50340637-45a6-4a86-ba59-df5063c9e888', 80, 'DeLorean Motor Company', 1981, 'John DeLorean szülei révén erdélyi román–magyar származású amerikai mérnök, aki kezdetben a Chryslernél, majd az amerikai luxusautókat gyártó Packardnál dolgozott, aztán a General Motorsnál a Pontiac igazgatója lett, majd 1969-től már a Chevroletet bízták rá. A fizetése ekkor már évi 200 000 amerikai dollár volt, amihez 400 000 dolláros éves bónusz prémium is járt.[10] Csodálatos karriert épített, ennek ellenére 1973-ban felmondott és saját álmai megvalósításába kezdett. 1975-ben megalapította a Delorean Motor Companyt, mert elege lett abból, hogy öt-hat év után használhatatlanná váltak az akkoriban forgalmazott autók, és ő olyat akart készíteni, ami hosszú életű sportkocsi és sokáig kiszolgálja a tulajdonosát. 1976 októberében William T. Collins, a cég vezető mérnöke és tervezője (korábban vezető mérnök a Pontiacnél) befejezte a DeLorean DMC–12 első prototípusát. Eredetileg az autó erőforrása egy Citroën/NSU (Comotor) gyártmányú Wankel forgótárcsás motor lett volna, de miután a Comotor beszüntette a gyártást, a következő jelölt a Ford Motor Company „Cologne V6” nevű motorja volt. Végül a svéd–francia PRV (Peugeot–Renault–Volvo) befecskendezéses V6-os motort választották. A motor helyzetét is megváltoztatták: áthelyezték hátulra. A tervek szerint egy új és nem tesztelt technológiát használtak volna a karosszéria gyártására, az ERM-et (Elastic Reservoir Molding, két üvegszálas műanyag lap közé beinjektált, műgyantával impregnált poliuretánhabból összeállított szerkezet préselése a megfelelő formára). Ezáltal az autó könnyebb lehetett volna, és a gyártási költségek is csökkenhettek volna. Ez az új technológia, aminek a használati jogát DeLorean megvásárolta, végül nem bizonyult megfelelőnek. Ez és az eredeti tervhez képest történt egyéb változtatások komoly csúszáshoz vezettek a gyártási ütemezésben. Úgy volt, hogy az egész autót majdnem teljesen újra kellett tervezni, amit Colin Chapman angol versenyautó-konstruktőrre, a Lotus alapítójára és tulajdonosára bíztak.[14] Chapman a legtöbb kipróbálatlan anyagot és gyártástechnológiát lecserélte a Lotus által akkoriban használtakra. Az alváz nagyon hasonló a Lotus Espritéhez. Az eredeti, Giorgetto Giugiaro által tervezett karosszériát nagyjából változatlanul hagyták, ugyanúgy, mint a feltűnő rozsdamentesacél-lemezeket és a sirályszárnyajtókat. Az autó karosszériája nagyon hasonlít az 1969-ben szintén Giugaro által tervezett Alfa Romeo 33 Iguanára. A texasi DeLorean Motor Company alelnökével, James Espey-vel készült egyik interjú során előkerült rajzon az látszott, hogy az autót eredetileg Z Taviónak akarták hívni. John DeLorean második keresztneve Zachary, és a fiát is így hívták, a Tavio pedig az apja keresztneve és a fia második keresztneve. A meglehetősen szegényes dokumentáció ennél alig tartalmaz többet a Z Tavio névről és arról, hogy miért választották a DMC–12 nevet. DeLoreannek 175 millió dollárra volt szüksége az autógyár megépítéséhez.[17] Olyan hollywoodi hírességeket győzött meg arról, hogy a vállalkozásba fektessenek, mint Johnny Carson és Sammy Davis Jr. Így végül pár kilométerre Belfast központjától, az észak-írországi Dunmurryben megépülhetett a DMC–12-gyár. A DeLorean Motor Company a gyárat eredeti szándék szerint Puerto Ricóban építette volna meg,[20][21] de megváltoztatták a döntésüket, amikor az Észak-Írországi Fejlesztési Ügynökség (Northern Ireland Development Agency, NIDA) 100 millió fontot ajánlott fel,[10] annak ellenére, hogy a NIDA által felbérelt szakértői csoport az üzleti siker esélyét egy tízes skálán egyre értékelte. A gyár építése 1978 októberében kezdődött el, és bár a DMC–12 gyártását 1979-re tervezték, végül tervezési problémák és túlköltekezések miatt csak 1981 elején indulhatott meg az összeszerelés. Ebben az időben Észak-Írországban a munkanélküliségi ráta nagyon magas volt, és a helyi lakosok sorban álltak a gyárnál munkáért. A munkások nagy részének nem volt autóipari munkatapasztalata, viszont mégis prémium szintű fizetést és a lehető legjobb felszereléseket kapták. A legtöbb minőséggel kapcsolatos problémát 1982-re megoldották, és a kereskedők az autókat 12 hónapos, illetve 12 000 mérföldes (19 300 km) garanciával árulták, valamint lehetett hozzá ötéves, illetve 50 000 mérföldes (80 000 km) kiterjesztett garanciát vásárolni. A DeLorean Motor Company 1982 végén ment csődbe, miután John DeLoreant ugyanezen év októberében letartóztatták drogkereskedelem vádjával Később úgy találták, hogy nem bűnös, de már túl késő volt ahhoz, hogy a DMC–12-gyártásban tudjon maradni. Körülbelül száz, a gyártósoron levő, részlegesen összeszerelt DMC-t befejezett a Consolidated International (most Big Lotsnak hívják). A gyári készletből származó maradék alkatrészeket, az amerikai garanciális alkatrészközpont alkatrészeit és az eredeti beszállítóktól a gyárba még nem leszállított alkatrészeket is az ohiói Colombusba szállították 1983–1984-ben. Egy KAPAC nevű cég ezeket az alkatrészeket kis- és nagykereskedőknek árulta postai szállítással. 1997-ben a texasi DeLorean Motor Company megvette ezt a készletet. Hosszú időn keresztül keringtek pletykák arról, hogy a karosszéria sajtolóelemeit az óceán mélyére süllyesztették, hogy meggátolják a későbbi gyártást. A hír részben igaz volt, hiszen ezeket az elemeket a connemarai Ards Bayben halhálók rögzítésére használták egy halfarmon. 1981 januárja és 1982 decembere között nagyjából 9200 db DMC–12-t gyártottak, ennek majdnem ötödét 1981 októberében. Körülbelül 1000 darab 1982-es modellt gyártottak 1982 februárja és májusa között; ezeknek az alvázszámát megváltoztatták, miután a Consolidated International megvette őket, hogy 1983-as autóknak tűnjenek. Ezek a 15xxx-es, 16xxx-es és 17xxx-es alvázszámok, melyek eredetileg 10xxx, 11xxx és 12xxx kezdetűek voltak. Mára összesen 12 darab 12xxx alvázszámú autó maradt fenn. Ezek a Wooler-Hodec jobbkormányos autók (lásd lentebb).\r\nA rövid életű vállalkozás szerencsétlensége, hogy pont akkor működött, amikor az 1980-as évek elején az amerikai autópiac az 1930-as évektől számított egyik legnagyobb pangásán ment keresztül. A bukást még az is segítette, hogy a korát jóval megelőző modellbe épített rozsdamentes anyagok sokba kerültek, és DeLoreannek nem volt elég forrása a vállalat további finanszírozásához.Az autó igazi népszerűsége pedig éppen akkor kezdett el nőni, amikor a gyár már nem létezett. A DeLorean DMC–12-nek komoly filmes támogatást jelentett, amikor 1985-ben bemutatták a Vissza a jövőbe sci-fi-vígjátékot. Ez a film és az ottani szereplésből fakadó márkajog elég szép jövedelmet biztosított John DeLoreannak és óriási hírverést jelentett az autónak. Ő közben tisztázta magát a drogkereskedés vádja alól, és aktív tagja lett az \"Újjászületett keresztények\" egyháznak. Viszont a pereskedés mindenét felemésztette, és 1999-ben a személyes csőd is elérte. Az autógyártásba soha többet nem tudott visszakerülni.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/Delorean_DMC-12_side.jpg/640px-Delorean_DMC-12_side.jpg', '1e52995a-4163-4f6c-a04b-aade55da71d6', '47f5a274-a3ea-4ada-ac9d-c52b377c3654'),
('9d713298-bf04-4f5e-a62f-289d82c9317b', 70, 'Mercury', 2001, 'BHU', 'https://edublogs.org/mi/in/porttitor/pede/justo/eu.xml?sed=vivamus&magna=tortor&at=duis&nunc=mattis&commodo=egestas&placerat=metus&praesent=aenean&blandit=fermentum&nam=donec&nulla=ut&integer=mauris&pede=eget&justo=massa&lacinia=tempor&eget=convallis&tinc', '599168cb-64b4-4a77-a5e5-173297166cba', '6896665c-497f-48f1-b79f-b98421e3e898'),
('a1330a1e-ec4c-11ef-923a-d85ed39d7f00', 70, 'Trab', 1978, 'A század elejétől fogva az amerikai ipar egyet jelent a Ford névvel. A Ford gyár az alapítás idején egy átalakított kis detroiti vagongyárat jelentett 10 fő alkalmazottal.\r\n\r\nHenry Ford irányításával az első 15 hónapban 1700 autó hagyta el a gyárat. A gépkocsik 1903 és 1908 között az ábécé első 19 b', 'https://fordhovany.hu/images/microsite/ford/8kUA0XH6kZ1626851036.jpeg', NULL, NULL),
('a1331731-ec4c-11ef-923a-d85ed39d7f00', 70, 'Hun', 1975, 'A század elejétől fogva az amerikai ipar egyet jelent a Ford névvel. A Ford gyár az alapítás idején egy átalakított kis detroiti vagongyárat jelentett 10 fő alkalmazottal.\r\n\r\nHenry Ford irányításával az első 15 hónapban 1700 autó hagyta el a gyárat. A gépkocsik 1903 és 1908 között az ábécé első 19 b', 'https://fordhovany.hu/images/microsite/ford/8kUA0XH6kZ1626851036.jpeg', NULL, NULL),
('b005cbf2-2f7e-4200-928c-c749f9d7dec4', 6, 'Nissan', 2013, 'WRI', 'http://disqus.com/at/turpis.xml?sit=est&amet=et&diam=tempus&in=semper&magna=est&bibendum=quam&imperdiet=pharetra&nullam=magna&orci=ac&pede=consequat&venenatis=metus&non=sapien&sodales=ut&sed=nunc&tincidunt=vestibulum&eu=ante&felis=ipsum&fusce=primis&posue', '70189bf0-89c3-4a65-bddb-913b012f351f', '472cd633-10c1-4cfd-baa9-b458df93fd0a'),
('b736d1d7-fabc-431f-b3ba-50d46ad3fda2', 60, 'Pontiac', 2002, 'RJH', 'https://dot.gov/augue/vestibulum/rutrum/rutrum/neque.jsp?molestie=consequat&sed=lectus&justo=in&pellentesque=est&viverra=risus&pede=auctor&ac=sed&diam=tristique&cras=in', '27373d37-7614-432d-802c-f6f77ec09aba', '8f017219-dc73-4fad-b5f8-ed4b18c3f181'),
('beba39dd-74d3-459a-ba3d-e4cc171cc449', 80, 'Jaguar', 2008, 'QYD', 'http://miibeian.gov.cn/parturient/montes/nascetur/ridiculus/mus.png?leo=ultrices&rhoncus=enim&sed=lorem&vestibulum=ipsum&sit=dolor&amet=sit&cursus=amet&id=consectetuer&turpis=adipiscing&integer=elit&aliquet=proin&massa=interdum&id=mauris&lobortis=non&conv', 'a293a6df-c9b1-4503-9982-ca623aeaff48', '11deec11-08a5-4975-b5f7-bb6df9dcda61'),
('cc554ba4-943b-44c7-8444-4d7f51f5b797', 70, 'Ford', 1997, 'A század elejétől fogva az amerikai ipar egyet jelent a Ford névvel. A Ford gyár az alapítás idején egy átalakított kis detroiti vagongyárat jelentett 10 fő alkalmazottal.\r\n\r\nHenry Ford irányításával az első 15 hónapban 1700 autó hagyta el a gyárat. A gépkocsik 1903 és 1908 között az ábécé első 19 b', 'https://fordhovany.hu/images/microsite/ford/8kUA0XH6kZ1626851036.jpeg', '5713ec45-926b-421c-acfc-168f7cc0bd1d', '87590f2f-8136-4f87-9f9e-21b87641c54f');

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
