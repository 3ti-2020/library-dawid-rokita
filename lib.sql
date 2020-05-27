-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 28 Maj 2020, 00:31
-- Wersja serwera: 10.4.11-MariaDB
-- Wersja PHP: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `library`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `autorzy`
--

CREATE TABLE `autorzy` (
  `id_autor` int(11) NOT NULL,
  `imie` varchar(30) DEFAULT NULL,
  `nazwisko` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `autorzy`
--

INSERT INTO `autorzy` (`id_autor`, `imie`, `nazwisko`) VALUES
(1, 'Andrzej', 'Sapkowski'),
(3, 'Adam', 'Mickiewicz'),
(6, 'Stefan', 'Żeromski'),
(7, 'Henryk', 'Sienkiewicz');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `bibl`
--

CREATE TABLE `bibl` (
  `id_bibl` int(11) NOT NULL,
  `id_autor` int(11) DEFAULT NULL,
  `id_tytul` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `bibl`
--

INSERT INTO `bibl` (`id_bibl`, `id_autor`, `id_tytul`) VALUES
(1, 1, 1),
(8, 3, 5),
(15, 7, 10),
(16, 7, 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `tytuly`
--

CREATE TABLE `tytuly` (
  `id_tytul` int(11) NOT NULL,
  `tytul` varchar(30) DEFAULT NULL,
  `ISBN` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `tytuly`
--

INSERT INTO `tytuly` (`id_tytul`, `tytul`, `ISBN`) VALUES
(1, 'Wiedźmin', '978-83-01-00000-1'),
(2, 'Quo vadis', '846-83-11-87235-2'),
(5, 'Pan Tadeusz', '124-32-54-36754-4'),
(8, 'Ludzie bezdomni', '867-56-34-26534-4'),
(10, 'Potop', '867-56-34-26534-4');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `autorzy`
--
ALTER TABLE `autorzy`
  ADD PRIMARY KEY (`id_autor`);

--
-- Indeksy dla tabeli `bibl`
--
ALTER TABLE `bibl`
  ADD PRIMARY KEY (`id_bibl`),
  ADD KEY `autor` (`id_autor`),
  ADD KEY `tytul` (`id_tytul`);

--
-- Indeksy dla tabeli `tytuly`
--
ALTER TABLE `tytuly`
  ADD PRIMARY KEY (`id_tytul`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `autorzy`
--
ALTER TABLE `autorzy`
  MODIFY `id_autor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT dla tabeli `bibl`
--
ALTER TABLE `bibl`
  MODIFY `id_bibl` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT dla tabeli `tytuly`
--
ALTER TABLE `tytuly`
  MODIFY `id_tytul` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `bibl`
--
ALTER TABLE `bibl`
  ADD CONSTRAINT `bibl_ibfk_1` FOREIGN KEY (`id_autor`) REFERENCES `autorzy` (`id_autor`),
  ADD CONSTRAINT `bibl_ibfk_2` FOREIGN KEY (`id_tytul`) REFERENCES `tytuly` (`id_tytul`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
