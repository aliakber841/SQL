-- SELECT COALESCE(
--     (SELECT salary FROM 
-- (SELECT DISTINCT salary,DENSE_RANK() 
--     OVER(ORDER BY salary DESC) as rn FROM Employee)rn_query
-- WHERE rn=2) ,null) as SecondHighestSalary 
SELECT MAX(salary) as SecondHighestSalary
FROM Employee
WHERE salary< (SELECT MAX(salary) FROM Employee )