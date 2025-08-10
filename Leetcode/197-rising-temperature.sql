-- CTE
WITH WeatherCTE AS (
    SELECT id,recordDate, temperature 
    FROM Weather 
)
SELECT w1.id from
WeatherCTE w1
JOIN WeatherCTE w2
ON w1.recordDate=DATE_ADD(w2.recordDate,INTERVAL 1 DAY)
WHERE w1.temperature>w2.temperature;

-- SELF JOIN
SELECT w1.id FROM Weather as w1
JOIN Weather as w2 
on DATEDIFF(w1.recordDate,w2.recordDate)=1
WHERE w1.temperature>w2.temperature;