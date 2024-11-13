-- Sprawdzenie, czy wszystkie rezerwacje o statusie "Potwierdzona" mają przypisaną płatność w tabeli Platnosc
SELECT
    *
FROM
    Rezerwacja
WHERE
    Status_rezerwacji = 'Potwierdzona'
    AND ID_Rezerwacji NOT IN (
        SELECT
            ID_Rezerwacji
        FROM
            Platnosc
    );