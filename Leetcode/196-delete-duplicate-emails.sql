DELETE FROM Person
WHERE id NOT IN (
  SELECT * from (
  SELECT MIN(p1.id)
  FROM Person p1
  GROUP BY p1.email
) AS temp 
);
