-- Sprawdzenie, czy wszystkie ID_Klienta w Rezerwacja są w tabeli Klient
SELECT
    ID_Klienta
FROM
    Rezerwacja
WHERE
    ID_Klienta NOT IN (
        SELECT
            ID_Klienta
        FROM
            Klient
    );

-- Sprawdzenie, czy wszystkie ID_Pokoju w Rezerwacja są w tabeli Pokoj
SELECT
    ID_Pokoju
FROM
    Rezerwacja
WHERE
    ID_Pokoju NOT IN (
        SELECT
            ID_Pokoju
        FROM
            Pokoj
    );