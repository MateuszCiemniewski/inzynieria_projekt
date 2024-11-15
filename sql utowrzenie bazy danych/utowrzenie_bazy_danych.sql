-- Tworzenie bazy danych
CREATE DATABASE IF NOT EXISTS pensjonat;
USE pensjonat;

-- Tabela Klient
CREATE TABLE IF NOT EXISTS klient (
    ID_Klienta INT AUTO_INCREMENT PRIMARY KEY,
    Imie VARCHAR(50) NOT NULL,
    Nazwisko VARCHAR(50) NOT NULL,
    Numer_telefonu VARCHAR(15) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Ulica VARCHAR(100),
    Numer_domu VARCHAR(10),
    Numer_mieszkania VARCHAR(10),
    Kod_pocztowy CHAR(6),
    Miejscowosc VARCHAR(50)
);

-- Tabela Pokoj
CREATE TABLE IF NOT EXISTS pokoj (
    ID_Pokoju INT AUTO_INCREMENT PRIMARY KEY,
    Numer_pokoju INT NOT NULL UNIQUE,
    Liczba_miejsc TINYINT NOT NULL,
    Pietro TINYINT NOT NULL,
    Widok_na_morze BOOLEAN NOT NULL DEFAULT FALSE,
    Balkon BOOLEAN NOT NULL DEFAULT FALSE,
    Aneks_kuchenny BOOLEAN NOT NULL DEFAULT FALSE,
    Lazienka BOOLEAN NOT NULL DEFAULT TRUE,
    Cena_za_dobe DECIMAL(10, 2) NOT NULL,
    Status_dostepnosci ENUM('Dostępny', 'Niedostępny', 'Zarezerwowany') DEFAULT 'Dostępny'
);

-- Tabela Rezerwacja
CREATE TABLE IF NOT EXISTS rezerwacja (
    ID_Rezerwacji INT AUTO_INCREMENT PRIMARY KEY,
    ID_Klienta INT NOT NULL,
    ID_Pokoju INT NOT NULL,
    Data_rezerwacji DATE NOT NULL,
    Data_przyjazdu DATE NOT NULL,
    Data_wyjazdu DATE NOT NULL,
    Status_rezerwacji ENUM('Wstępna', 'Potwierdzona', 'Anulowana') DEFAULT 'Wstępna',
    Zaliczka DECIMAL(10, 2),
    Caly_koszt DECIMAL(10, 2) NOT NULL,
    Metoda_platnosci ENUM('Gotówka', 'Karta', 'Przelew'),
    Uwagi VARCHAR(255),
    FOREIGN KEY (ID_Klienta) REFERENCES klient(ID_Klienta),
    FOREIGN KEY (ID_Pokoju) REFERENCES pokoj(ID_Pokoju)
);

-- Tabela Platnosc
CREATE TABLE IF NOT EXISTS platnosc (
    ID_Platnosci INT AUTO_INCREMENT PRIMARY KEY,
    ID_Rezerwacji INT NOT NULL,
    Kwota DECIMAL(10, 2) NOT NULL,
    Data_wplaty DATE NOT NULL,
    Metoda_platnosci ENUM('Gotówka', 'Karta', 'Przelew') NOT NULL,
    FOREIGN KEY (ID_Rezerwacji) REFERENCES rezerwacja(ID_Rezerwacji)
);

-- Tabela HistoriaPobytow
CREATE TABLE IF NOT EXISTS historiapobytow (
    ID_Historii INT AUTO_INCREMENT PRIMARY KEY,
    ID_Klienta INT NOT NULL,
    ID_Pokoju INT NOT NULL,
    Data_przyjazdu DATE NOT NULL,
    Data_wyjazdu DATE NOT NULL,
    FOREIGN KEY (ID_Klienta) REFERENCES klient(ID_Klienta),
    FOREIGN KEY (ID_Pokoju) REFERENCES pokoj(ID_Pokoju)
);

-- Tabela Raporty
CREATE TABLE IF NOT EXISTS raporty (
    ID_Raportu INT AUTO_INCREMENT PRIMARY KEY,
    Typ_raportu ENUM('Dostępność', 'Rezerwacje', 'Finansowy') NOT NULL,
    Data_raportu DATE NOT NULL,
    Zawartosc TEXT
);

-- Tabela Znizki
CREATE TABLE IF NOT EXISTS znizki (
    ID_Znizki INT AUTO_INCREMENT PRIMARY KEY,
    ID_Klienta INT NOT NULL,
    Procent_znizki DECIMAL(5, 2) NOT NULL,
    Opis VARCHAR(255),
    FOREIGN KEY (ID_Klienta) REFERENCES klient(ID_Klienta)
);

-- Tabela Powiadomienia
CREATE TABLE IF NOT EXISTS powiadomienia (
    ID_Powiadomienia INT AUTO_INCREMENT PRIMARY KEY,
    ID_Klienta INT,
    Typ_powiadomienia ENUM('Zaliczka', 'Przypomnienie', 'Anulowanie','Informacja','Dziekujemy') NOT NULL,
    Data_wyslania DATE NOT NULL,
    Tresc TEXT NOT NULL,
    FOREIGN KEY (ID_Klienta) REFERENCES klient(ID_Klienta)
);
