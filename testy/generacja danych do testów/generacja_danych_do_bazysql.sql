-- Przełącz się na bazę danych pensjonat
USE pensjonat;

-- Wstawienie przykładowych danych do tabeli Klient
INSERT INTO
    Klient (
        Imie,
        Nazwisko,
        Numer_telefonu,
        Email,
        Ulica,
        Numer_domu,
        Numer_mieszkania,
        Kod_pocztowy,
        Miejscowosc
    )
VALUES
    (
        'Jan',
        'Kowalski',
        '123456789',
        'jan.kowalski@example.com',
        'Ul. Zielona',
        '12',
        '2A',
        '00-123',
        'Warszawa'
    ),
    (
        'Anna',
        'Nowak',
        '987654321',
        'anna.nowak@example.com',
        'Ul. Błękitna',
        '34',
        '1B',
        '01-234',
        'Kraków'
    ),
    (
        'Piotr',
        'Wiśniewski',
        '234567890',
        'piotr.wisniewski@example.com',
        'Ul. Słoneczna',
        '56',
        '3C',
        '02-345',
        'Gdańsk'
    ),
    (
        'Maria',
        'Zielińska',
        '345678901',
        'maria.zielinska@example.com',
        'Ul. Morwowa',
        '78',
        '5',
        '03-456',
        'Poznań'
    );

-- Wstawienie przykładowych danych do tabeli Pokoj
INSERT INTO
    Pokoj (
        Numer_pokoju,
        Liczba_miejsc,
        Pietro,
        Widok_na_morze,
        Balkon,
        Aneks_kuchenny,
        Lazienka,
        Cena_za_dobe,
        Status_dostepnosci
    )
VALUES
    (
        101,
        1,
        0,
        FALSE,
        TRUE,
        FALSE,
        TRUE,
        150.00,
        'Dostępny'
    ),
    (
        102,
        2,
        1,
        TRUE,
        TRUE,
        TRUE,
        TRUE,
        250.00,
        'Dostępny'
    ),
    (
        103,
        3,
        1,
        FALSE,
        TRUE,
        TRUE,
        TRUE,
        300.00,
        'Zarezerwowany'
    ),
    (
        104,
        2,
        2,
        TRUE,
        FALSE,
        TRUE,
        TRUE,
        200.00,
        'Dostępny'
    ),
    (
        105,
        4,
        2,
        FALSE,
        TRUE,
        FALSE,
        TRUE,
        350.00,
        'Niedostępny'
    );

-- Wstawienie przykładowych danych do tabeli Rezerwacja
INSERT INTO
    Rezerwacja (
        ID_Klienta,
        ID_Pokoju,
        Data_rezerwacji,
        Data_przyjazdu,
        Data_wyjazdu,
        Status_rezerwacji,
        Zaliczka,
        Caly_koszt,
        Metoda_platnosci,
        Uwagi
    )
VALUES
    (
        1,
        101,
        '2024-01-15',
        '2024-02-01',
        '2024-02-05',
        'Potwierdzona',
        50.00,
        150.00,
        'Karta',
        'Bez specjalnych życzeń'
    ),
    (
        2,
        102,
        '2024-01-20',
        '2024-02-10',
        '2024-02-15',
        'Wstępna',
        100.00,
        250.00,
        'Przelew',
        'Prośba o widok na morze'
    ),
    (
        3,
        103,
        '2024-01-22',
        '2024-02-05',
        '2024-02-12',
        'Potwierdzona',
        75.00,
        300.00,
        'Gotówka',
        'Łóżeczko dla dziecka'
    ),
    (
        4,
        104,
        '2024-01-25',
        '2024-02-15',
        '2024-02-20',
        'Anulowana',
        NULL,
        200.00,
        'Karta',
        'Rezerwacja anulowana przez klienta'
    );

-- Wstawienie przykładowych danych do tabeli Platnosc
INSERT INTO
    Platnosc (
        ID_Rezerwacji,
        Kwota,
        Data_wplaty,
        Metoda_platnosci
    )
VALUES
    (1, 50.00, '2024-01-15', 'Karta'),
    (1, 100.00, '2024-01-30', 'Karta'),
    (2, 100.00, '2024-01-22', 'Przelew'),
    (3, 75.00, '2024-01-22', 'Gotówka'),
    (3, 225.00, '2024-02-01', 'Gotówka');

-- Wstawienie przykładowych danych do tabeli HistoriaPobytow
INSERT INTO
    HistoriaPobytow (
        ID_Klienta,
        ID_Pokoju,
        Data_przyjazdu,
        Data_wyjazdu
    )
VALUES
    (1, 101, '2023-12-01', '2023-12-05'),
    (2, 102, '2023-12-10', '2023-12-15'),
    (3, 103, '2023-12-20', '2023-12-27'),
    (4, 104, '2023-12-25', '2023-12-30');

-- Wstawienie przykładowych danych do tabeli Raporty
INSERT INTO
    Raporty (Typ_raportu, Data_raportu, Zawartosc)
VALUES
    (
        'Dostępność',
        '2024-01-10',
        'Raport dostępności pokoi w okresie 2024-01-10 do 2024-01-20'
    ),
    (
        'Rezerwacje',
        '2024-01-15',
        'Raport rezerwacji na okres 2024-01-15 do 2024-01-31'
    ),
    (
        'Finansowy',
        '2024-01-31',
        'Raport finansowy za styczeń 2024'
    );

-- Wstawienie przykładowych danych do tabeli Znizki
INSERT INTO
    Znizki (ID_Klienta, Procent_znizki, Opis)
VALUES
    (1, 10.00, 'Rabat dla stałego klienta'),
    (2, 5.00, 'Promocja sezonowa'),
    (3, 15.00, 'Rabat lojalnościowy');

-- Wstawienie przykładowych danych do tabeli Powiadomienia
INSERT INTO
    Powiadomienia (
        ID_Klienta,
        Typ_powiadomienia,
        Data_wyslania,
        Tresc
    )
VALUES
    (
        1,
        'Zaliczka',
        '2024-01-16',
        'Przypomnienie o konieczności wpłaty zaliczki'
    ),
    (
        2,
        'Przypomnienie',
        '2024-01-28',
        'Przypomnienie o zbliżającym się terminie przyjazdu'
    ),
    (
        3,
        'Anulowanie',
        '2024-01-25',
        'Powiadomienie o anulowaniu rezerwacji z powodu braku wpłaty zaliczki'
    );