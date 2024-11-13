-- Sprawdzenie poprawności wartości w kolumnie Status_dostepnosci
SELECT
    *
FROM
    Pokoj
WHERE
    Status_dostepnosci NOT IN ('Dostępny', 'Niedostępny', 'Zarezerwowany');