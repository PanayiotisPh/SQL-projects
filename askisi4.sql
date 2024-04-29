SELECT originCity, CAST(COUNT(CASE WHEN duration < 180 THEN 1 END) AS FLOAT) / CAST(COUNT(*) AS FLOAT)*100 AS pct
FROM FLIGHTS
GROUP BY originCity
ORDER BY pct DESC;

SELECT DISTINCT(fl2.destCity)
FROM FLIGHTS fl
INNER JOIN FLIGHTS fl2
ON fl.destCity = fl2.originCity
WHERE fl2.destCity NOT LIKE 'Larnaka' AND fl.originCity LIKE 'LARNAKA'

