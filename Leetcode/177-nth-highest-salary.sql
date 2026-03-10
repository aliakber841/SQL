CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
     SELECT COALESCE(
        (SELECT DISTINCT salary FROM (
            SELECT salary,DENSE_RANK()
            OVER(ORDER BY salary DESC) as rn
            FROM Employee
        ) rn_query
        WHERE rn=N 
        )
     ,null)
  );
END