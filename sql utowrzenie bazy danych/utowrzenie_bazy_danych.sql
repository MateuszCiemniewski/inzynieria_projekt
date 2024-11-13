--
-- Database: `pensjonat`
--
-- --------------------------------------------------------
--
-- Struktura tabeli dla tabeli `historiapobytow`
--
CREATE TABLE
    `historiapobytow` (
        `ID_Historii` int (11) NOT NULL,
        `ID_Klienta` int (11) NOT NULL,
        `ID_Pokoju` int (11) NOT NULL,
        `Data_przyjazdu` date NOT NULL,
        `Data_wyjazdu` date NOT NULL
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- --------------------------------------------------------
--
-- Struktura tabeli dla tabeli `klient`
--
CREATE TABLE
    `klient` (
        `ID_Klienta` int (11) NOT NULL,
        `Imie` varchar(50) NOT NULL,
        `Nazwisko` varchar(50) NOT NULL,
        `Numer_telefonu` varchar(15) NOT NULL,
        `Email` varchar(100) NOT NULL,
        `Ulica` varchar(100) NOT NULL,
        `Numer_domu` varchar(10) NOT NULL,
        `Numer_mieszkania` varchar(10) DEFAULT NULL,
        `Kod_pocztowy` char(6) NOT NULL,
        `Miejscowosc` varchar(50) NOT NULL
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- --------------------------------------------------------
--
-- Struktura tabeli dla tabeli `platnosc`
--
CREATE TABLE
    `platnosc` (
        `ID_Platnosci` int (11) NOT NULL,
        `ID_Rezerwacji` int (11) NOT NULL,
        `Kwota` decimal(10, 2) NOT NULL,
        `Data_wplaty` date NOT NULL,
        `Metoda_platnosci` enum ('Gotówka', 'Karta', 'Przelew') NOT NULL
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- --------------------------------------------------------
--
-- Struktura tabeli dla tabeli `pokoj`
--
CREATE TABLE
    `pokoj` (
        `ID_Pokoju` int (11) NOT NULL,
        `Numer_pokoju` int (11) NOT NULL,
        `Liczba_miejsc` tinyint (4) NOT NULL,
        `Pietro` tinyint (4) NOT NULL,
        `Widok_na_morze` tinyint (1) NOT NULL,
        `Balkon` tinyint (1) NOT NULL,
        `Aneks_kuchenny` tinyint (1) NOT NULL,
        `Lazienka` tinyint (1) NOT NULL,
        `Cena_za_dobe` decimal(10, 2) NOT NULL,
        `Status_dostepnosci` enum ('Dostępny', 'Niedostępny', 'Zarezerwowany') DEFAULT 'Dostępny'
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- --------------------------------------------------------
--
-- Struktura tabeli dla tabeli `powiadomienia`
--
CREATE TABLE
    `powiadomienia` (
        `ID_Powiadomienia` int (11) NOT NULL,
        `ID_Klienta` int (11) DEFAULT NULL,
        `Typ_powiadomienia` enum ('Zaliczka', 'Przypomnienie', 'Anulowanie') NOT NULL,
        `Data_wyslania` date NOT NULL,
        `Tresc` text NOT NULL
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- --------------------------------------------------------
--
-- Struktura tabeli dla tabeli `raporty`
--
CREATE TABLE
    `raporty` (
        `ID_Raportu` int (11) NOT NULL,
        `Typ_raportu` enum ('Dostępność', 'Rezerwacje', 'Finansowy') NOT NULL,
        `Data_raportu` date NOT NULL,
        `Zawartosc` text DEFAULT NULL
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- --------------------------------------------------------
--
-- Struktura tabeli dla tabeli `rezerwacja`
--
CREATE TABLE
    `rezerwacja` (
        `ID_Rezerwacji` int (11) NOT NULL,
        `ID_Klienta` int (11) NOT NULL,
        `ID_Pokoju` int (11) NOT NULL,
        `Data_rezerwacji` date NOT NULL,
        `Data_przyjazdu` date NOT NULL,
        `Data_wyjazdu` date NOT NULL,
        `Status_rezerwacji` enum ('Wstępna', 'Potwierdzona', 'Anulowana') DEFAULT 'Wstępna',
        `Zaliczka` decimal(10, 2) DEFAULT NULL,
        `Caly_koszt` decimal(10, 2) NOT NULL,
        `Metoda_platnosci` enum ('Gotówka', 'Karta', 'Przelew') DEFAULT NULL,
        `Uwagi` varchar(255) DEFAULT NULL
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- --------------------------------------------------------
--
-- Struktura tabeli dla tabeli `znizki`
--
CREATE TABLE
    `znizki` (
        `ID_Znizki` int (11) NOT NULL,
        `ID_Klienta` int (11) NOT NULL,
        `Procent_znizki` decimal(5, 2) NOT NULL,
        `Opis` varchar(255) DEFAULT NULL
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

--
-- Indeksy dla zrzutów tabel
--
--
-- Indeksy dla tabeli `historiapobytow`
--
ALTER TABLE `historiapobytow` ADD PRIMARY KEY (`ID_Historii`),
ADD KEY `ID_Klienta` (`ID_Klienta`),
ADD KEY `ID_Pokoju` (`ID_Pokoju`);

--
-- Indeksy dla tabeli `klient`
--
ALTER TABLE `klient` ADD PRIMARY KEY (`ID_Klienta`),
ADD UNIQUE KEY `Email` (`Email`);

--
-- Indeksy dla tabeli `platnosc`
--
ALTER TABLE `platnosc` ADD PRIMARY KEY (`ID_Platnosci`),
ADD KEY `ID_Rezerwacji` (`ID_Rezerwacji`);

--
-- Indeksy dla tabeli `pokoj`
--
ALTER TABLE `pokoj` ADD PRIMARY KEY (`ID_Pokoju`),
ADD UNIQUE KEY `Numer_pokoju` (`Numer_pokoju`);

--
-- Indeksy dla tabeli `powiadomienia`
--
ALTER TABLE `powiadomienia` ADD PRIMARY KEY (`ID_Powiadomienia`),
ADD KEY `ID_Klienta` (`ID_Klienta`);

--
-- Indeksy dla tabeli `raporty`
--
ALTER TABLE `raporty` ADD PRIMARY KEY (`ID_Raportu`);

--
-- Indeksy dla tabeli `rezerwacja`
--
ALTER TABLE `rezerwacja` ADD PRIMARY KEY (`ID_Rezerwacji`),
ADD KEY `ID_Klienta` (`ID_Klienta`),
ADD KEY `ID_Pokoju` (`ID_Pokoju`);

--
-- Indeksy dla tabeli `znizki`
--
ALTER TABLE `znizki` ADD PRIMARY KEY (`ID_Znizki`),
ADD KEY `ID_Klienta` (`ID_Klienta`);

--
-- AUTO_INCREMENT for dumped tables
--
--
-- AUTO_INCREMENT for table `historiapobytow`
--
ALTER TABLE `historiapobytow` MODIFY `ID_Historii` int (11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `klient`
--
ALTER TABLE `klient` MODIFY `ID_Klienta` int (11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `platnosc`
--
ALTER TABLE `platnosc` MODIFY `ID_Platnosci` int (11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pokoj`
--
ALTER TABLE `pokoj` MODIFY `ID_Pokoju` int (11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `powiadomienia`
--
ALTER TABLE `powiadomienia` MODIFY `ID_Powiadomienia` int (11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `raporty`
--
ALTER TABLE `raporty` MODIFY `ID_Raportu` int (11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rezerwacja`
--
ALTER TABLE `rezerwacja` MODIFY `ID_Rezerwacji` int (11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `znizki`
--
ALTER TABLE `znizki` MODIFY `ID_Znizki` int (11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--
--
-- Constraints for table `historiapobytow`
--
ALTER TABLE `historiapobytow` ADD CONSTRAINT `historiapobytow_ibfk_1` FOREIGN KEY (`ID_Klienta`) REFERENCES `klient` (`ID_Klienta`),
ADD CONSTRAINT `historiapobytow_ibfk_2` FOREIGN KEY (`ID_Pokoju`) REFERENCES `pokoj` (`ID_Pokoju`);

--
-- Constraints for table `platnosc`
--
ALTER TABLE `platnosc` ADD CONSTRAINT `platnosc_ibfk_1` FOREIGN KEY (`ID_Rezerwacji`) REFERENCES `rezerwacja` (`ID_Rezerwacji`);

--
-- Constraints for table `powiadomienia`
--
ALTER TABLE `powiadomienia` ADD CONSTRAINT `powiadomienia_ibfk_1` FOREIGN KEY (`ID_Klienta`) REFERENCES `klient` (`ID_Klienta`);

--
-- Constraints for table `rezerwacja`
--
ALTER TABLE `rezerwacja` ADD CONSTRAINT `rezerwacja_ibfk_1` FOREIGN KEY (`ID_Klienta`) REFERENCES `klient` (`ID_Klienta`),
ADD CONSTRAINT `rezerwacja_ibfk_2` FOREIGN KEY (`ID_Pokoju`) REFERENCES `pokoj` (`ID_Pokoju`);

--
-- Constraints for table `znizki`
--
ALTER TABLE `znizki` ADD CONSTRAINT `znizki_ibfk_1` FOREIGN KEY (`ID_Klienta`) REFERENCES `klient` (`ID_Klienta`);

COMMIT;

