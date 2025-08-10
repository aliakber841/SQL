-- USING NOT EXISTS
SELECT e.name,b.bonus FROM Employee e
LEFT JOIN Bonus b
ON e.empId=b.empId AND b.bonus<1000
WHERE NOT EXISTS (
    SELECT 1 FROM Bonus b2
WHERE e.empId=b2.empID AND b2.bonus>=1000
);
-- USING IS NULL
SELECT e.name,b.bonus FROM Employee e
LEFT JOIN Bonus b
ON e.empId=b.empId AND b.bonus<1000
WHERE e.empId NOT IN (SELECT empId from Bonus
WHERE bonus>=1000 and empID IS NOT NULL);