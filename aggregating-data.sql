use dbtheory;

create table emp3(
id int(4) Not Null Unique,
deptno int(4) Not Null,
sal int(4) Not Null
);
Insert into emp3 values(1,10,20000);
Insert into emp3 values(2,20,30000);
Insert into emp3 values(3,30,40000);
Insert into emp3 values(4,40,50000);
Insert into emp3 values(5,22,60000);

/* Group Functions */
select avg(sal) from emp3;
select count(sal) from emp3;
select max(sal) from emp3;
select min(sal) from emp3;
select sum(sal) from emp3;
/* Min and Max can be used with any datatype */
select min('2024-03-25'),max('2022-03-25');

create table emp4(
id int(4) Not Null Unique,
deptno int(4) Not Null,
sal int(4) Not Null,
comm int(4) Null
);
Insert into emp4(id,deptno,sal,comm) values(1,10,20000,23);
Insert into emp4(id,deptno,sal) values(2,20,30000);
Insert into emp4(id,deptno,sal) values(3,30,40000);
Insert into emp4(id,deptno,sal) values(4,40,50000);

/* nvl functions with group functions */
select avg(ifnull(comm,0)) from emp4;

/* Group By Clause => Divides rows in a table into smaller groups. used to arrange identical data into groups.
The GROUP BY statement groups rows that have the same values into summary rows, like "find the number of customers in each country".
The GROUP BY statement is often used with aggregate functions (COUNT(), MAX(), MIN(), SUM(), AVG()) to group the result-set by one or more columns. */

CREATE TABLE emp5 (
id INT(4) PRIMARY KEY Not Null Unique,
name VARCHAR(50) Not Null,
department VARCHAR(50) Not Null,
salary INT(4) Not Null
);
INSERT INTO emp5(id, name, department, salary) VALUES
(1, 'Alice', 'HR', 50000),
(2, 'Bob', 'Engineering', 75000),
(3, 'Charlie', 'HR', 60000),
(4, 'David', 'Engineering', 80000),
(5, 'Eve', 'Engineering', 70000);

SELECT department, SUM(salary) AS total_salary
FROM emp5
GROUP BY department;

select avg(salary)
from emp5
group by department;

SELECT department,name, SUM(salary) AS total_salary
FROM emp5
GROUP BY department,name;

/* We cannot use where clause in group by functions */

/* Having Clause => To specify which groups are to be displayed. It is recommended to use having clause after group by functions.*/
SELECT department, max(salary) 
FROM emp5
GROUP BY department
having max(salary)>60000;

SELECT department,avg(salary) 
FROM emp5
where department not like 'hr'
GROUP BY department
having max(salary)>60000
order by avg(salary);

/* Nesting Group Functions */
SELECT MAX(avg_salary) AS max_average_salary
FROM (
    SELECT department, AVG(salary) AS avg_salary
    FROM emp5
    GROUP BY department
) AS department_avg_salaries;

