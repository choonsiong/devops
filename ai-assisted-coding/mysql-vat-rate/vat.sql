SELECT rate
FROM vat
WHERE country = 'de'
  AND validFrom <= '2024-04-15'
ORDER BY validFrom DESC
LIMIT 1;

SELECT TOP 1 rate
FROM vat
WHERE country = 'de'
  AND validFrom <= '2024-04-15'
ORDER BY validFrom DESC;