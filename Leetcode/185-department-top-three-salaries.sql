SELECT Department,Employee,Salary FROM (
SELECT d.name AS Department,
e.name AS Employee,
e.salary AS Salary,
DENSE_RANK() OVER (PARTITION BY d.id ORDER BY e.salary DESC) AS rnk
FROM Department d
JOIN Employee e
ON d.id=e.departmentId
) q
WHERE rnk<=3;
-- Solution 2 . Between shows inclusive values
SELECT Department,Employee,Salary FROM (
SELECT d.name AS Department,
e.name AS Employee,
e.salary AS Salary,
DENSE_RANK() OVER (PARTITION BY d.id ORDER BY e.salary DESC) AS rnk
FROM Department d
JOIN Employee e
ON d.id=e.departmentId
) q
WHERE rnk BETWEEN  1 AND 3; 
