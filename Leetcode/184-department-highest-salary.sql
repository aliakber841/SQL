SELECT Department,Employee,Salary FROM (
SELECT d.name AS Department,
e.name AS Employee,
e.salary AS Salary,
RANK() OVER (PARTITION BY d.id ORDER BY e.salary DESC) AS rnk
FROM Department d
JOIN Employee e
ON d.id=e.departmentId 
) q
WHERE rnk=1;
-- 2nd Solution
SELECT d.name AS Department,
e.name AS Employee,
e.salary AS Salary
FROM Department d
LEFT JOIN Employee e
ON d.id=e.departmentId 
WHERE salary=(
    SELECT MAX(salary) FROM Employee, Department
    WHERE departmentId=d.id
)