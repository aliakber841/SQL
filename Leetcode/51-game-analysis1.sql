-- Window Functions
SELECT player_id,event_date AS first_login 
FROM (
    SELECT player_id,event_date,
    ROW_NUMBER() OVER (PARTITION BY player_id ORDER BY event_date) AS rn
    FROM Activity
) AS sorted
WHERE rn=1;

-- INNER JOIN
SELECT a1.player_id,a1.event_date AS first_login 
FROM Activity a1
INNER JOIN (
    SELECT player_id,MIN(event_date) AS first_login 
    FROM Activity
    GROUP BY player_id
) a2
ON a1.player_id=a2.player_id AND a1.event_date=a2.first_login;