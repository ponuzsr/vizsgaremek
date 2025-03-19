-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2025. Már 19. 09:06
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

--
-- A tábla adatainak kiíratása `aspnetroles`
--

INSERT INTO `aspnetroles` (`Id`, `Name`, `NormalizedName`, `ConcurrencyStamp`) VALUES
('73bd4a3f-3b88-4533-92f1-ed19471dd96d', 'admin', 'ADMIN', NULL),
('84dfe8b3-ddee-41b7-9b65-ceac67057f03', 'user', 'USER', NULL);

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

--
-- A tábla adatainak kiíratása `aspnetuserroles`
--

INSERT INTO `aspnetuserroles` (`UserId`, `RoleId`) VALUES
('25756ec9-e2a1-4eeb-95c0-031c87939bb2', '84dfe8b3-ddee-41b7-9b65-ceac67057f03'),
('7574cbd6-add1-44a3-b248-06aeeecb61b1', '73bd4a3f-3b88-4533-92f1-ed19471dd96d'),
('7574cbd6-add1-44a3-b248-06aeeecb61b1', '84dfe8b3-ddee-41b7-9b65-ceac67057f03'),
('c5c7bd6e-d8d5-4168-8660-39cbc9e4fbd7', '73bd4a3f-3b88-4533-92f1-ed19471dd96d'),
('c5c7bd6e-d8d5-4168-8660-39cbc9e4fbd7', '84dfe8b3-ddee-41b7-9b65-ceac67057f03');

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
('25756ec9-e2a1-4eeb-95c0-031c87939bb2', NULL, 'viki', 'VIKI', 'viki@gmail.com', 'VIKI@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEHQFPLZyAQXPXyEESop0fpwouCXWCQNql3/e0lzMpsUTRKv3mdZHGTnl6lk5lzdEeg==', 'O4QPH3MNH5NEQXHQANIKF6M3UHBDAIFR', '2d8395a7-a5ad-48b9-89b2-d916f39db8d4', NULL, 0, 0, NULL, 1, 0),
('7574cbd6-add1-44a3-b248-06aeeecb61b1', NULL, 'ponuzsr', 'PONUZSR', 'ponuzsr@kkszki.hu', 'PONUZSR@KKSZKI.HU', 0, 'AQAAAAIAAYagAAAAEOvvuh8kWSc5UBK3x5vzwOEbqq3K1X1zLojh/s+LCoCToDiNI1kuj2BjlNsuv4pJdQ==', 'T2NVJ7IOEO32LFD2KCWJSVRZ2PIZBHXU', 'f133e363-c4d8-40e9-b291-f3a7ede98f1d', NULL, 0, 0, NULL, 1, 0),
('c5c7bd6e-d8d5-4168-8660-39cbc9e4fbd7', NULL, 'ricsi', 'RICSI', 'ricsi@gmail.com', 'RICSI@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEAjbOAWar8nNsaAYHSe0lxnrdiw0cY8koe7iDV3U4LT++qre9mYeUibJjMAALsZ/mw==', 'VUCZPM55QDKTZQRAYDMNA5E55VZ5XYEQ', 'e63dd10b-3332-4f90-9d37-e6b104f3e7cc', NULL, 0, 0, NULL, 1, 0);

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

INSERT INTO `autoks` (`Id`, `IdEv`, `Marka`, `GyartasEv`, `ritkae`, `Kerekmeghajtas`, `maxteljesitmeny`, `Tortenet`, `Kep`, `Kobcenti`, `Tipus`) VALUES
('0ba4b91c-2a29-4104-9ad1-405d2665e468', 80, 'Opel Kadett', 1982, 0, 'Elsőkerék-meghajtás', '60', 'Az Opel Kadett az 1980-as években vált népszerűvé Magyarországon. A nyugati autók térnyerésével a Kadett is egyre inkább elterjedt.', 'https://upload.wikimedia.org/wikipedia/commons/b/be/Opel_Kadett_C_Coupe_1978.jpg', '1297', 'Sedan'),
('29cc4580-b1a6-4c4c-a665-6f7daba47c75', 50, 'Ford Thunderbird', 1955, 0, 'Hátsó kerék meghajtás', '193', 'A Ford Thunderbird első generációja egy kétüléses kabrió , amelyet a Ford 1955-től 1957-ig gyártott , az első kétüléses Ford 1938 óta. A New York-i Autószalonon 1953-ban megjelent Motorama-kijelzőre válaszul fejlesztették ki , amelyen a Chevrolet Corvette volt látható . A Corvette-et pedig az európai sportautók amerikaiak körében elterjedt népszerűségére válaszul fejlesztették ki .', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/28/1957_Ford_Thunderbird_%2820418643125%29_%28cropped%29.jpg/1920px-1957_Ford_Thunderbird_%2820418643125%29_%28cropped%29.jpg', '4800', 'Luxusautó'),
('29f67b79-6101-4f2e-9da4-7060ef008314', 80, 'Škoda Favorit', 1988, 0, 'Első kerék meghajtás', '58', ' Škoda Favorit egy kiskategóriás autó, melyet a Škoda Auto gyártott 1988 és 1995 között. Ez volt a Škoda első modellje, mely követte az európai trendet abban a tekintetben, hogy a motor előre került, keresztben helyezték el a motortérben. Szintén a Favorit volt a gyár első fronthajtásos autója. A kocsit 1987 júliusában mutatták be a brnói műszaki kiállításon. Csakúgy, mint a Škoda modernkori kínálatában megjelent modellek nagy része, a Favorit is a gyár egy korábbi autójáról kapta a nevét. Az eredeti Favorit egy luxusfelszereltségű felsőkategóriás autó volt, melyet 1936 és 1941 között gyártottak.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fb/Skoda_Favorit_Utrecht_1989.jpg/450px-Skoda_Favorit_Utrecht_1989.jpg', '1289', 'Ferdehátú autó'),
('396537a9-cb82-4491-a54e-5c42f4729c59', 70, 'Chevrolet Corvette', 1968, 0, 'Hátsó kerék meghajtás', '430', 'A Chevrolet Corvette (C3) a Corvette sportautó harmadik generációja , amelyet 1967 és 1982 között gyártott a Chevrolet az 1968 és 1982 közötti modellévekben . A motorok és az alvázalkatrészek többnyire az előző generációból származtak , de a karosszéria és a belső tér új volt. Az 1979-es modellévben 53 807 darabbal új eladási rekordokat döntött. A C3 volt a második Corvette, amely a Stingray nevet viselte , bár csak az 1969–76-os modellévekre. Ezúttal egyetlen szó volt, szemben az 1963–1967-es C2 generációnál használt Sting Ray- vel . A nevet aztán 2014-ig visszavonták, amikor is a C7 kiadásával visszatért. A történelem legdrágább Corvette C3-ja egy 1969-es L88 Lightweight volt, egyike a négy gyártott könnyű L88-nak. Barrett-Jackson eladta 2014 januárjában 2 860 000 dollárért (1 060 116 200 Forint).', 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Chevrolet_Corvette_C3_Stingray_IMG_3199.jpg/1280px-Chevrolet_Corvette_C3_Stingray_IMG_3199.jpg', '7400', 'Sportautó'),
('3ac3fa09-4a45-414b-8554-659416a00a3d', 70, 'Ford Pinto', 1970, 0, 'Első kerék meghajtás', '100', 'A Ford Pinto egy kiskategóriás autó, amelyet a Ford Motor Company gyártott 1970 és 1980 között. Először csak kétajtós kupé változatban készült, de gyártásának második évében megjelent a ferde hátú változat Ford Pinto Runabout néven és a kétfajta kombi is. A Ford az AMC Gremlin, a Chevrolet Vega és a Volkswagen, a Datsun, valamint a Toyota hasonló kategóriájú modelljei vetélytársául szánta a Pintót. A felsoroltak közül mindegyiknél több darab készült belőle. A legtöbbet 1974-ben gyártották, ekkor 544 029 autó hagyta el a gyártósort, amivel a Pinto szintén vetélytársai fölé nőtt az egy év alatt elkészült modellek számát tekintve. 1976-ra összesen már több mint 2,3 millió darab készült le. A kocsi gyártása 1980-ban fejeződött be, abban az évben mindössze 68 179 készült belőle. Népszerű volt a vásárlók közében, 1971 januárjára már 100 ezernél is több Pinto talált gazdára, az év végéig pedig összesen 352 402 darabot adtak el belőle. A gyártás befejezéséig több mint 3 millió Pinto kelt el.', 'https://upload.wikimedia.org/wikipedia/commons/f/f0/Ford_Pinto.jpg', '2000', 'Sportautó'),
('46fed5e2-bbb5-48b5-a4f3-46bb16aec0f2', 70, 'Polski Fiat 125p', 1973, 0, 'Hátsókerék-meghajtás', '90', 'A Polski Fiat 125p az 1970-es években érkezett Magyarországra. Ez a modell a Fiat 125-ös alapján készült, és a keleti blokkban népszerű volt.\"', 'https://upload.wikimedia.org/wikipedia/commons/1/1f/Polski_Fiat_125p.jpg', '1608', 'Sedan'),
('60991e79-f081-4ba1-96b0-d374a2e0d633', 60, 'Dodge Charger', 1966, 0, 'Hátsó kerék meghajtás', '370', 'Az 1960-as évek elején az autógyártók új ötleteket fedeztek fel a személyes luxus- és speciális autók szegmensében. A speciális autók piacára lassan belépő Chrysler a Dodge Division-t választotta, hogy egy közepes méretű B-karosszériás sportos autóval lépjen be a piacra, amely az „ izomautó ” Ford Mustang és a „ személyes luxus ” Ford Thunderbird közé illeszkedik. A szándék az volt, hogy a lehető legtöbb meglévő vállalati hardvert megosszák egy fastback megjelenéssel, a Chrysler 300 luxuskupéból levont tanulságok felhasználásával.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9d/1969_Dodge_Charger_R-T%2C_front_right_%282022_Ellwood_City_Fall_Fest_%26_Car_Cruise%29.jpg/1920px-1969_Dodge_Charger_R-T%2C_front_right_%282022_Ellwood_City_Fall_Fest_%26_Car_Cruise%29.jpg', '7200', 'Izomautó'),
('6a36723b-ebf0-4f87-9b4e-0d81085391f2', 60, 'Škoda 1000 MB', 1964, 0, 'Első kerék meghajtás', '44', 'A Škoda 1000 MB (az „MB” betűk Mladá Boleslav kezdőbetűi) 1964 áprilisában debütált a Škoda Octavia utódjaként . Ez csak a kezdete volt annak, ami végül a hátsó motoros Škodák hosszú sorává fejlődött. Az 1000 MB-os motor egy 988 köbcentis (1 literes), 4 hengeres, felső szelepes (OHV) egység volt, amely 44 LE (33 kW) teljesítményt adott. Vízhűtéses volt, alumínium hengertömbbel és öntöttvas hengerfejjel. Az 1000 MB négyfokozatú manuális, teljesen szinkron sebességváltóval, minden körben független felfüggesztéssel, lengőtengelyes hátsó felfüggesztéssel és minden kerékhez dobfékekkel rendelkezik.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1d/13-04-05-Skoda_Museum_Mlad%C3%A1_Boleslav_by_RalfR-121.jpg/1280px-13-04-05-Skoda_Museum_Mlad%C3%A1_Boleslav_by_RalfR-121.jpg', '988', 'Kis caládi autó'),
('6b06485a-bb47-45aa-b5ec-bb65d24ae0dd', 80, 'Suzuki Swift MK1', 1983, 0, 'Első kerék meghajtás', '68', 'Az MK1-es Swiftek karburátoros vagy befecskendezéses 1.0 (G10) illetve 1.3 literes (G13) motorral készültek. Az 1.0-sokból két változat volt elérhető: a GA és a GL (napfénytetővel, légkondicionálóval).Rövidesen a típus legkiemelkedőbb darabjává a GTi vált. Ezt a változatot G13B jelzésű, 4 hengeres, 16 szelepes, 1.3 literes DOHC (Twincam) motor hajtotta. (DOHC = Double Over Head Camshaft – Kettős tengelyű, felül vezérelt, felül szelepelt vezérmű) A GTi hajtómű 10:1 arányú sűrítés mellett 101 LE-t (76 kW) adott le. Az autó végsebessége ezzel a felszereltséggel 196 km/h volt (gyári adat). A modell és későbbi módosított változatai a Távol-Kelettől Európán át Dél-Amerikáig nagy népszerűségnek örvendtek (főként a fiatalok körében), sőt, Ausztráliában is komoly kultuszuk alakult ki. Észak-Amerikában ekkor az 1.0-sok futottak Chevrolet Sprint, Pontiac Firefly és Suzuki Forsa néven. A ritkaságnak számító, turbófeltöltővel felszerelt Chevrolet Sprint Turbot rövid ideig, 1987 – 1990 között gyártották.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/22/Suzuki_cultus_1st_gen.JPG/1280px-Suzuki_cultus_1st_gen.JPG', '1300', 'Ötajtós ferdehátú autó'),
('6b6ace85-3831-4dfb-8b98-08c263086943', 80, 'Fiat 127', 1981, 0, 'Első kerék meghajtás', '60', 'A Fiat 127 sorozat harmadik generációja, a Sorozat 3, bemutatása 1981 novemberben történt, és 1982 januárjában debütált Olaszországban, valamint más európai piacokon. Ez a modell különösen érdekes a rajongók és az autótörténet iránt érdeklődők számára, hiszen egy újabb lépést jelentett a Fiat történetében, amely egy évvel később, a teljesen új Unóval folytatódott. A Sorozat 3 számos újítással érkezett, amelyek megkülönböztették elődjétől.A Sorozat 3 legszembetűnőbb eleme az új hűtőrács volt, amely már első ránézésre is eltért a Sorozat 2-től. Az új belső tér és műszerfal tervezése a Ritmo stílusjegyeit követte. A karosszéria panelek zöme változatlan maradt, kivéve a hosszabb motorháztetőt, amely lehetővé tette a nagyobb fényszórók elhelyezését. Az új dizájn nemcsak esztétikai szempontból volt figyelemre méltó, hanem funkcionálisan is javította az autó aerodinamikáját. A Sorozat 3 legfontosabb technikai újítása a Fiat Fiasa motor bevezetése volt, amely a korábbi 1050 cm³-es motort váltotta fel. A Sport verzióban debütáló 1301 cm³-es motor több teljesítményt kínált, mint elődje, miközben a költségei alacsonyabbak voltak. Ezen kívül az ötsebességes kézi sebességváltó is újdonságnak számított a modell történetében – ez a fejlesztés különösen vonzóvá tette az autót azok számára, akik dinamikusabb vezetési élményre vágytak.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Fiat_127_green.jpg/1280px-Fiat_127_green.jpg', '1100', 'Kiskategóriás autó'),
('744e8c1d-eb4f-4404-a27d-4bf096f0ea4e', 80, 'Lada Samara', 1984, 0, 'Első kerék meghajtás', '65', 'A Lada Samara egy kiskategóriás autó, amelyet az orosz (korábban szovjet) AvtoVAZ autógyár gyártott 1984-től 2013-ig. A kocsit sokáig csak a külföldi piacokon árulták „Samara” néven, a hazai piacon kizárólag „Szputnyik” (útitárs) néven szerepelt egészen 1991-ig, amikor megjelent a szedán változat, ezután az örökölte a Szputnyik nevet, a ferde hátú pedig Samara lett. Az autó gyártása 2013-ban fejeződött be.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fd/Lada_2109_Samara_1300_S_Hanseat_Front.JPG/1280px-Lada_2109_Samara_1300_S_Hanseat_Front.JPG', '1300', 'Négy ajtós szedán'),
('79ed21e5-733f-4947-b87d-aa7f939f94d5', 60, 'Ford Mustang', 1964, 0, 'Hátsó kerék meghajtás', '271', 'Az első generációs Ford Mustangot a Ford 1964 márciusa és 1973 között gyártotta. A Mustang bemutatása az autók új osztályát hozta létre, pónikocsiként ismert. A Mustang stílusa, hosszú motorháztetőjével és rövid fedélzetével rendkívül népszerűnek bizonyult, és számos versenyt inspirált.1964. április 17-én mutatták be keménytetős és kabrió formájában, a gyorshátú változat pedig 1964 augusztusában következett. A bevezetéskor a Mustang, amely a Falconnal osztozik platformján , bekerült a kompakt autók szegmensébe.Az első generációs Mustangok mérete és motorteljesítménye minden egyes átdolgozással nőtt. Az 1971-es modell drasztikus újratervezést kapott. A kezdeti felfutás után az eladások folyamatosan csökkentek, és a Ford elkezdett dolgozni egy új generációs Mustangon. Az 1973-as olajválság kitörésére a Ford felkészült, már az 1974-es modellévre tervezte a kisebb Mustang II-t . Ez az új autó nem osztott alkatrészt a korábbi modellekkel.', 'https://upload.wikimedia.org/wikipedia/commons/7/7c/Ford_Mustang_%281964%29_-_28540253076.jpg', '4700', 'Izom autó'),
('874bc668-0ca2-40c1-b7e0-4eb3b1c00b5b', 70, 'Volga GAZ-24', 1970, 0, 'Hátsó kerék meghajtás', '70', 'A GAZ-24-et 1970-ben mutatták be a Londoni Autószalonon. A teljes körű gyártás 1970. július 15-én kezdődött. Az exportértékesítés 1971-ben kezdődött . 1970-től 1974-ig a Volga szinte változatlan maradt. Csak kisebb módosítások történtek 1972–1973-ban, amikor az autó új csomagtérfedél-zárat, lapos hamutartókat kapott a hátsó ajtókban a korai hamutartók helyett, amelyeket a hátsó ajtók könyöklába építettek, új hátsó lökhárítót és új, kellemesebb megjelenésű és módosított felépítésű rádiót. 1973-ban jelent meg egy szimulált fabetétes műszerfal (1974-ig szintén ezüst szemcsés felületet használtak). 1973 után a gyújtáskapcsolót a műszerfalról a kormánykerék alá helyezték át, hogy megelőzzék a közúti balesetekben bekövetkező térdsérüléseket, bár ez kevésbé volt kényelmes a vezető számára. Szintén 1974-ben a Volga további parkolólámpákat kapott a C-oszlopokon, hasonlóan az akkori amerikai autókon népszerű operalámpákhoz . A GAZ-24-01-hez 1977-ben csatlakozott a GAZ-24-07, amelyet cseppfolyósított propán használatára szereltek fel.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/61/Pfingsttreffen_Puetnitz_2018%2C_Ribnitz-Damgarten_%281X7A2425%29_%28cropped%29.jpg/1280px-Pfingsttreffen_Puetnitz_2018%2C_Ribnitz-Damgarten_%281X7A2425%29_%28cropped%29.jpg', '2445', 'Négy ajtós szedán'),
('9331c41d-e2f3-4da1-bbb8-6ffde486deac', 60, 'Skoda 120 S', 1961, 0, 'Hátsókerék-meghajtás', '45', 'A Skoda 120 S egyike volt azoknak a modelleknek, amelyek az 1960-as években Magyarországon is elterjedtek. A modell sportos dizájnjával és megbízhatóságával hódított.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/77/Skoda_105S_-_front.jpg/800px-Skoda_105S_-_front.jpg', '1089', 'Sedan'),
('940ba613-41f8-4825-b496-a2f60d751b9f', 60, 'Chevrolet Camaro', 1966, 0, 'Hátsó kerék meghajtás', '435', 'Az első generációs Chevrolet Camaro egy amerikai izomautó, amelyet a Chevrolet 1966 őszén mutatott be az 1967-es modellévhez . Vadonatúj hátsókerék-hajtású GM F-karosszéria-platformot használt, és 2 ajtós, 2+2 üléses, keménytetős és kabrió kivitelben is elérhető volt . Az F-testet minden generáció megosztotta a Pontiac Firebirddel . A Chevrolet straight-6- ban egy 230 cu-s volt az alapfelszereltség, és számos Chevy V8-as választható volt. Az első generációs Camaro az 1969-es modellévig készült.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a3/Chevrolet_Camaro_RS_327_1968_%28cropped%29.jpg/1920px-Chevrolet_Camaro_RS_327_1968_%28cropped%29.jpg', '4600', 'Izom autó'),
('975c78ec-5d1f-4ec1-860c-31174889017b', 50, 'Wartburg 311', 1956, 0, 'Hátsó kerék meghajtás', '45', 'A Wartburg név a legelső modellről ( Wartburgwagen ) származik, amelyet 1898-ban gyártottak az Automobilwerk Eisenach gyárában, három évtizeddel azelőtt, hogy a céget felvásárolta a BMW, és közel öt évtizeddel azelőtt, hogy az üzemet a Harmadik Birodalom legyőzése után a szovjet megszállási övezetben állami ellenőrzés alá helyezték. A „311” megjelölés az üzem korábbi tulajdonosának, a BMW-nek a hagyományait követte, amelynek Eisenachban gyártott személygépkocsijait egy „3-assal” kezdődő háromjegyű számmal azonosították.', 'https://upload.wikimedia.org/wikipedia/commons/b/bf/Wartburg_311_%281963%29_02.jpg', '992', '4 ajtós szedán'),
('a4ad0433-46c2-4c75-bf83-8ee2660ddd19', 70, 'Porsche 911', 1970, 0, 'Hátsó kerék meghajtás', '260', 'Az eredeti Porsche 911 ( ejtsd: kilenc tizenegy , németül : Neunelfer ) a németországi stuttgarti Porsche AG által gyártott luxussportkocsi . A híres, jellegzetes és tartós dizájn prototípusát 1963 őszén mutatták be a nagyközönségnek. A gyártás 1964 szeptemberében kezdődött és 1989-ig tartott. Ezt egy módosított változat követte, amelyet belsőleg Porsche 964 néven emlegetnek , de továbbra is Porsche 911 néven árulják , akárcsak a jelenlegi modelleket.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Porsche_911E_ca_1969.jpg/1280px-Porsche_911E_ca_1969.jpg', '3300', 'Sportautó'),
('abe7d858-203a-425e-bb97-2e8d508bffbf', 60, 'Trabant 601', 1963, 0, 'Első kerék meghajtás', '23', 'A Trabant 601 (vagy Trabant P601) egy kiskategóriás autó, melyet a VEB Sachsenring autógyár készített Zwickauban, a Német Demokratikus Köztársaságban. Ez volt a harmadik Trabant modell, gyártása 1963 és 1990 között folyt, így a 601 lett a gyár leghosszabb ideig gyártott és legismertebb autója. Utóbbi ténynek köszönhetően gyakran egyszerűen csak a Trabant vagy a Trabi néven emlegetik, típusmegjelölés nélkül. Összesen 2 818 547 darab készült belőle és ez volt a legnagyobb példányszámban eladott autó az NDK történetében.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8b/Trabbi_601-S_3828.jpg/1280px-Trabbi_601-S_3828.jpg', '594', 'Két ajtós szedán'),
('adbae813-6756-4764-b0a1-06769f982078', 60, 'Jaguar E-Type', 1961, 0, 'Hátsó kerék meghajtás', '265', 'A Jaguar E-Type vagy az észak-amerikai piacon a Jaguar XK-E egy brit első középmotoros sportautó , amelyet a Jaguar Cars Ltd gyártott 1961 és 1974 között. A kivételes esztétika, a fejlett technológiák, a nagy teljesítmény és a versenyképes ár kombinációja a modellt az autózás világának ikonjává tette. Az E-Type 150 mérföld/óra (240 km/h) végsebessége, 7 másodperc alatti 0-60 mph (97 km/h) gyorsulás, nagyrészt egységes karosszériafelépítés, független első és hátsó felfüggesztés tárcsafékekkel , beépített hátsó felfüggesztés , valamint megkülönböztetett hátsó fogasléc. iparági változások.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6d/Jaguar_E-Type_Series_1_3.8_Litre_1961.jpg/1920px-Jaguar_E-Type_Series_1_3.8_Litre_1961.jpg', '3800', 'Sportautó'),
('b2aa4f50-a696-4703-823a-fc847f1f45e6', 50, 'Plymouth Fury', 1955, 0, 'Hátsó kerék meghajtás', '290', 'A Plymouth Fury egy olyan autómodell, amelyet a Plymouth gyártott 1955-től 1989-ig. Az 1956-os modellévre a Plymouth Belvedere alsorozataként mutatták be, 1959-ben egy szinttel a korabeli Belvedere felett. 1962-től 1964-ig ismét egy teljes méretű autó 1965 és 1974 között, és ismét egy közepes méretű autó 1975 és 1978 között. 1975-től 1977-ig a Fury-t a teljes méretű Plymouth Gran Fury mellett árulták. 1978-ban a B-testű Fury volt a legnagyobb Plymouth, és 1979-ben már nem volt nagy Plymouth. Ezt a termékhiányt 1980-ban pótolták az R-body Gran Fury-val, majd 1982-ben az M-body Fury-val. Az utolsó V8-as, RWD Plymouth Fury gyártása 1988. december 23-án fejeződött be a Kenosha Main összeszerelő üzemben, Kenosha-ban, WI. V8/RWD szedán.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0e/1959_Plymouth_Sport_Fury_photo-13.JPG/1024px-1959_Plymouth_Sport_Fury_photo-13.JPG', '5200', 'Luxusautó'),
('b9533371-7589-498a-8214-3f2a45933e20', 50, 'Chevrolet Corvette (C1)', 1953, 0, 'Hátsó kerék meghajtás', '340', 'A Chevrolet Corvette (C1) a Chevrolet által gyártott Corvette sportautó első generációja . Az 1953-as modellév végén mutatták be, és 1962-ig gyártották. Ezt a generációt általában szilárd tengelyes generációnak nevezik, mivel a független hátsó felfüggesztés csak az 1963-as Sting Ray-nél jelent meg. A Corvette-et a debütáló modellévre sietve gyártották, hogy kihasználják a koncepciójármű iránti lelkes közönség reakcióját. Az új modellel kapcsolatos várakozások azonban nagyrészt nem teljesültek.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Chevrolet_Corvette_C1_front-right_2016_Shanghai_Auto_Museum.jpg/1280px-Chevrolet_Corvette_C1_front-right_2016_Shanghai_Auto_Museum.jpg', '5400', 'Sportautó'),
('c12249c8-0189-467f-9c55-23a22859c6ed', 60, 'Mini Morris', 1960, 0, 'Első kerék meghajtás', '34', 'Az eredeti Minit az 1960-as évek brit populáris kultúrájának ikonjának tartják. Helytakarékos keresztirányú motorja és elsőkerék-hajtású elrendezése – lehetővé téve, hogy az autó padlólemezének területének 80%-a utasok és poggyász elhelyezésére szolgáljon – az autógyártók generációjára hatott. 1999-ben a Minit a 20. század második legbefolyásosabb autójának választották, a Ford Model T mögött, és megelőzve a Citroën DS-t és a Volkswagen Beetle-t. Az elsőkerék-hajtású, keresztirányú motoros elrendezést számos más szupermini stílusú autótervezésben használták, mint például a Honda N360 (1967), a Nissan Cherry (1970) és a Fiat 127 (1971). Az elrendezést a nagyobb szubkompakt kialakításokhoz is igazították.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2f/Morris_Mini-Minor_1959_%28621_AOK%29.jpg/1280px-Morris_Mini-Minor_1959_%28621_AOK%29.jpg', '848', 'Városi autó'),
('c8b2831d-2261-4297-8bd6-7d56c32a62d6', 50, 'Cadillac Eldorado', 1953, 0, 'Hátsó kerék meghajtás', '', 'A Cadillac Eldorado egy luxusautó, amelyet a Cadillac gyártott és forgalmazott 1952 és 2002 között tizenkét generáción keresztül.Az Eldorado a Cadillac vonal tetején vagy annak közelében volt. Az eredeti, 1953-as Eldorado kabrió és az 1957–1960-as Eldorado Brougham modellek külön karosszériával rendelkeztek, és ezek voltak a Cadillac által azokban az években kínált legdrágább modellek. Az Eldorado árban 1966-ig soha nem volt kevesebb, mint a második a Cadillac Series 75 limuzin után. 1967-től az Eldorado megőrizte prémium pozícióját a Cadillac árstruktúrájában, de nagy mennyiségben gyártották egyedi, kétajtós személyi luxusautó platformon.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a8/1963_Cadillac_Eldorado_convertible%2C_front_5.19.19.jpg/1920px-1963_Cadillac_Eldorado_convertible%2C_front_5.19.19.jpg', '5400', 'Luxusautó'),
('dced99db-b4a9-49d9-9b59-e760ab3c27f3', 60, 'Skoda Octavia', 1964, 0, 'Hátsókerék-meghajtás', '40', 'A Skoda Octavia az 1960-as években volt népszerű Magyarországon. Ez a modell a korábbi Skoda 440-as sorozat továbbfejlesztett változata volt, amelyet a cseh gyártó széles körben exportált. Az Octavia megbízhatóságával és ár-érték arányával hódította meg a magyar piacot.', 'https://www.automotor.hu/wp-content/uploads/2019/12/extra2-5-600x399.jpg?x88250', '1089', 'Szedán'),
('e1a3aaa5-4b57-40dd-84b4-763017cd3db8', 70, 'Dacia 1300', 1972, 0, 'Elsőkerék-meghajtás', '54', 'A Dacia 1300 az 1970-es években érkezett Magyarországra. Ez a modell a Renault 12-es alapján készült, és a keleti blokkban népszerű volt.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/31/Dacia_1300.JPG/1200px-Dacia_1300.JPG', '1289', 'Sedan'),
('ed9b505d-1b0f-4ce8-95fe-078fea70ccc3', 70, 'Wartburg 353', 1975, 0, 'Elsőkerék-meghajtás', '50', 'A Wartburg 353 az NDK-ban gyártott autó, amely az 1970-es években volt népszerű Magyarországon. A kétütemű motorral felszerelt modell megbízhatóságával és alacsony árával tett szert nagy népszerűségre.', 'https://www.secret-classics.com/wp-content/uploads/2021/12/Wartburg353_01.jpg', '992', 'Sedan'),
('f6e73d90-8ef1-48eb-8da4-0eae192fe0bb', 60, 'Moszkvics 408', 1964, 0, 'Hátsókerék-meghajtás', '50', 'A Moszkvics 408 egyike volt azoknak a szovjet autóknak, amelyek az 1960-as években Magyarországon is népszerűek voltak. A modell megbízhatóságával és alacsony árával tett szert nagy népszerűségre.', 'https://veteran-auto.hu/sites/default/files/referenci%C3%A1k/veteran-auto.hu_.JPG', '1360', 'Sedan'),
('f6edf1b2-63d2-4aba-87ec-532da95992c9', 70, 'Lada-2101', 1970, 0, 'Hátsó kerék meghajtás', '67', 'A VAZ–2101 (ismertebb nevén Lada 1200 illetve Zsiguli 1200) a szovjet (később orosz) AvtoVAZ autógyár 1970 és 1988 között gyártott első modellje, illetve a Fiat 124 műszaki alapjain kifejlesztett és közel 42 éven át gyártott hátsókerék-meghajtású Lada „classic” gépkocsicsalád első tagja.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e5/1980_-_VAZ_2101.JPG/1280px-1980_-_VAZ_2101.JPG', '1198', 'Négy ajtós szedán');

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
