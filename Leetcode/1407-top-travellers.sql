SELECT u.name,IFNULL(SUM(r.distance),0) as travelled_distance from Rides r
RIGHT JOIN Users u
ON r.user_id=u.id
GROUP BY u.id
ORDER BY travelled_distance DESC,u.name ASC;