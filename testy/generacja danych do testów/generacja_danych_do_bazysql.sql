-- Wstawienie danych do tabeli klient
INSERT INTO klient (Imie, Nazwisko, Numer_telefonu, Email, Ulica, Numer_domu, Numer_mieszkania, Kod_pocztowy, Miejscowosc)
VALUES
    ('Jan', 'Kowalski', '123456789', 'jan.kowalski@example.com', 'Zielona', '12', 'A', '00-123', 'Warszawa'),
    ('Anna', 'Nowak', '987654321', 'anna.nowak@example.com', 'Błekitna', '34', 'B', '01-234', 'Kraków'),
    ('Piotr', 'Wiśniewski', '234567890', 'piotr.wisniewski@example.com', 'Słoneczna', '56', 'C', '02-345', 'Gdańsk'),
    ('Maria', 'Zielińska', '345678901', 'maria.zielinska@example.com', 'Morwowa', '78', NULL, '03-456', 'Poznań'),
    ('Katarzyna', 'Kozłowska', '456789012', 'katarzyna.kozlowska@example.com', 'Wiatrakowa', '90', '7', '04-567', 'Łódź'),
    ('Tomasz', 'Nowicki', '567890123', 'tomasz.nowicki@example.com', 'Polna', '11', '2', '05-678', 'Wrocław'),
    ('Monika', 'Grabowska', '678901234', 'monika.grabowska@example.com', 'Chmielna', '20', NULL, '06-789', 'Lublin'),
    ('Adam', 'Lewandowski', '789012345', 'adam.lewandowski@example.com', 'Wodna', '45', '5A', '07-890', 'Szczecin'),
    ('Ewa', 'Wiśniewska', '890123456', 'ewa.wisniewska@example.com', 'Teczowa', '65', NULL, '08-901', 'Katowice'),
    ('Paweł', 'Kamiński', '901234567', 'pawel.kaminski@example.com', 'Lipowa', '99', '1', '09-012', 'Rzeszów');

-- Wstawienie danych do tabeli pokoj
INSERT INTO pokoj (Numer_pokoju, Liczba_miejsc, Pietro, Widok_na_morze, Balkon, Aneks_kuchenny, Lazienka, Cena_za_dobe, Status_dostepnosci)
VALUES
    (101, 1, 0, FALSE, TRUE, FALSE, TRUE, 150.00, 'Dostepny'),
    (102, 2, 1, TRUE, TRUE, TRUE, TRUE, 250.00, 'Dostepny'),
    (103, 3, 1, FALSE, TRUE, TRUE, TRUE, 300.00, 'Zarezerwowany'),
    (104, 2, 2, TRUE, FALSE, TRUE, TRUE, 200.00, 'Dostepny'),
    (105, 4, 2, FALSE, TRUE, FALSE, TRUE, 350.00, 'Niedostepny'),
    (106, 2, 0, FALSE, FALSE, FALSE, TRUE, 120.00, 'Dostepny'),
    (107, 1, 1, TRUE, TRUE, FALSE, TRUE, 180.00, 'Zarezerwowany'),
    (108, 3, 2, TRUE, TRUE, TRUE, TRUE, 400.00, 'Niedostepny'),
    (109, 1, 0, FALSE, FALSE, FALSE, TRUE, 100.00, 'Dostepny'),
    (110, 4, 3, TRUE, TRUE, TRUE, TRUE, 500.00, 'Dostepny');

-- Wstawienie danych do tabeli rezerwacja
INSERT INTO rezerwacja (ID_Klienta, ID_Pokoju, Data_rezerwacji, Data_przyjazdu, Data_wyjazdu, Status_rezerwacji, Zaliczka, Caly_koszt, Metoda_platnosci, Uwagi)
VALUES
    (1, 1, '2024-01-01', '2024-01-10', '2024-01-15', 'Potwierdzona', 50.00, 150.00, 'Karta', 'Bez specjalnych życzeń'),
    (2, 2, '2024-01-02', '2024-01-20', '2024-01-25', 'Wstepna', 100.00, 250.00, 'Przelew', 'Prośba o widok na morze'),
    (3, 3, '2024-01-05', '2024-01-30', '2024-02-05', 'Potwierdzona', 75.00, 300.00, 'Gotówka', 'Łóżeczko dla dziecka'),
    (4, 4, '2024-01-07', '2024-02-01', '2024-02-10', 'Anulowana', NULL, 200.00, 'Karta', 'Rezerwacja anulowana przez klienta'),
    (5, 5, '2024-01-10', '2024-02-05', '2024-02-15', 'Potwierdzona', 120.00, 350.00, 'Gotówka', 'Specjalne wymagania dietetyczne'),
    (6, 6, '2024-01-12', '2024-02-10', '2024-02-20', 'Potwierdzona', 150.00, 200.00, 'Przelew', 'Blisko windy'),
    (7, 7, '2024-01-15', '2024-02-15', '2024-02-25', 'Wstepna', 80.00, 180.00, 'Gotówka', 'Prośba o widok na miasto'),
    (8, 8, '2024-01-18', '2024-02-18', '2024-02-28', 'Anulowana', NULL, 400.00, 'Karta', 'Zmiana planów podróży'),
    (9, 9, '2024-01-20', '2024-02-20', '2024-02-25', 'Potwierdzona', 100.00, 100.00, 'Karta', 'Wynajem jednoosobowy'),
    (10, 10, '2024-01-25', '2024-02-25', '2024-03-01', 'Potwierdzona', 200.00, 500.00, 'Gotówka', 'Dodatkowe łóżko dla dziecka');

-- Wstawienie danych do tabeli platnosc
INSERT INTO platnosc (ID_Rezerwacji, Kwota, Data_wplaty, Metoda_platnosci)
VALUES
    (1, 50.00, '2024-01-01', 'Karta'),
    (1, 100.00, '2024-01-10', 'Karta'),
    (2, 100.00, '2024-01-05', 'Przelew'),
    (3, 75.00, '2024-01-10', 'Gotówka'),
    (3, 225.00, '2024-02-01', 'Gotówka'),
    (5, 120.00, '2024-01-15', 'Gotówka'),
    (5, 230.00, '2024-02-05', 'Gotówka'),
    (6, 150.00, '2024-01-20', 'Przelew'),
    (9, 100.00, '2024-02-15', 'Karta'),
    (10, 200.00, '2024-02-20', 'Gotówka');

-- Wstawienie danych do tabeli historiapobytow
INSERT INTO historiapobytow (ID_Klienta, ID_Pokoju, Data_przyjazdu, Data_wyjazdu)
VALUES
    (1, 1, '2023-12-01', '2023-12-05'),
    (2, 2, '2023-12-10', '2023-12-15'),
    (3, 3, '2023-12-20', '2023-12-27'),
    (4, 4, '2023-12-25', '2023-12-30'),
    (5, 5, '2023-11-20', '2023-11-25'),
    (6, 6, '2023-11-01', '2023-11-10'),
    (7, 7, '2023-11-15', '2023-11-20'),
    (8, 8, '2023-10-01', '2023-10-10'),
    (9, 9, '2023-09-01', '2023-09-05'),
    (10, 10, '2023-08-20', '2023-08-25');

-- Wstawienie danych do tabeli raporty
INSERT INTO raporty (Typ_raportu, Data_raportu, Zawartosc)
VALUES
    ('Dostepność', '2024-01-10', 'Raport dostepności pokoi w okresie 2024-01-10 do 2024-01-20'),
    ('Rezerwacje', '2024-01-15', 'Raport rezerwacji na okres 2024-01-15 do 2024-01-31'),
    ('Finansowy', '2024-01-31', 'Raport finansowy za styczeń 2024'),
    ('Dostepność', '2024-02-10', 'Raport dostepności pokoi w okresie 2024-02-10 do 2024-02-20'),
    ('Rezerwacje', '2024-02-15', 'Raport rezerwacji na okres 2024-02-15 do 2024-02-28'),
    ('Finansowy', '2024-02-28', 'Raport finansowy za luty 2024'),
    ('Dostepność', '2024-03-10', 'Raport dostepności pokoi w okresie 2024-03-10 do 2024-03-20'),
    ('Rezerwacje', '2024-03-15', 'Raport rezerwacji na okres 2024-03-15 do 2024-03-31'),
    ('Finansowy', '2024-03-31', 'Raport finansowy za marzec 2024'),
    ('Dostepność', '2024-04-10', 'Raport dostepności pokoi w okresie 2024-04-10 do 2024-04-20');

-- Wstawienie danych do tabeli znizki
INSERT INTO znizki (ID_Klienta, Procent_znizki, Opis)
VALUES
    (1, 10.00, 'Rabat dla stałego klienta'),
    (2, 5.00, 'Promocja sezonowa'),
    (3, 15.00, 'Rabat lojalnościowy'),
    (4, 20.00, 'Specjalna oferta świąteczna'),
    (5, 7.50, 'Rabat za polecenie znajomych'),
    (6, 10.00, 'Rabat za rezerwacje na dłużej niż tydzień'),
    (7, 12.50, 'Rabat za rodzinny pobyt'),
    (8, 8.00, 'Promocja weekendowa'),
    (9, 6.00, 'Rabat za wcześniejszą rezerwacje'),
    (10, 5.00, 'Promocja lokalna');

-- Wstawienie danych do tabeli powiadomienia
INSERT INTO powiadomienia (ID_Klienta, Typ_powiadomienia, Data_wyslania, Tresc)
VALUES
    (1, 'Zaliczka', '2024-01-16', 'Przypomnienie o konieczności wpłaty zaliczki'),
    (2, 'Przypomnienie', '2024-01-28', 'Przypomnienie o zbliżającym sie terminie przyjazdu'),
    (3, 'Anulowanie', '2024-01-25', 'Powiadomienie o anulowaniu rezerwacji z powodu braku wpłaty zaliczki'),
    (4, 'Informacja', '2024-02-01', 'Informacja o zmianie w polityce pensjonatu'),
    (5, 'Dziekujemy', '2024-02-20', 'Dziekujemy za skorzystanie z naszych usług! Zapraszamy ponownie!'),
    (6, 'Zaliczka', '2024-02-15', 'Przypomnienie o wpłacie zaliczki na rezerwacje'),
    (7, 'Przypomnienie', '2024-02-25', 'Przypomnienie o przyjeździe na pobyt rodzinny'),
    (8, 'Anulowanie', '2024-03-01', 'Rezerwacja anulowana przez klienta'),
    (9, 'Informacja', '2024-03-05', 'Informacja o specjalnej promocji na kolejny pobyt'),
    (10, 'Dziekujemy', '2024-03-20', 'Dziekujemy za wizyte w naszym pensjonacie!');
