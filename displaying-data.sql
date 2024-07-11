use dbtheory;

create table student1(
student_id int(4) Not Null Unique,
name varchar(50) Not Null
);
Insert into student1 values(101,'Ali');
Insert into student1 values(102,'Awais');
Insert into student1 values(103,'Adam');

create table course(
student_id int(4) Not Null Unique,
course varchar(50) Not Null
);
Insert into course values(102,'English');
Insert into course values(105,'Math');
Insert into course values(107,'Science');

/* Cross Join => CROSS JOIN in SQL Server combines all of the possibilities of two or more tables and returns a result that 
includes every row from all contributing tables. It's also known as CARTESIAN JOIN because it produces the Cartesian product of all linked tables. 
The Cartesian product represents all rows present in the first table multiplied by all rows present in the second table.*/

select * from student1 as s 
cross join course as c;

/* Equi Joins/ Inner Joins */

select * from student1 
inner join course
where student1.student_id=course.student_id;

/* using alias */
select * from student1 as s 
inner join course as c
on s.student_id=c.student_id;

/* Non Equi Joins (Comparison Operators) */
create table emp(
id INT(4) PRIMARY KEY Not Null Unique,
name VARCHAR(50) Not Null,
salary INT(4) Not Null
);
INSERT INTO emp (id, name, salary) VALUES
(1, 'Alice', 50000),
(2, 'Bob', 75000),
(3, 'Charlie', 120000);

create table salary_ranges(
range_id INT(4) PRIMARY KEY Not Null,
min_salary INT(4) Not Null,
max_salary INT(4) Not Null,
category VARCHAR(50) Not Null
);
INSERT INTO salary_ranges (range_id, min_salary, max_salary, category) VALUES
(1, 0, 60000, 'Low'),
(2, 60001, 100000, 'Medium'),
(3, 100001, 200000, 'High');

SELECT e.name, e.salary, s.category
FROM emp e
JOIN salary_ranges s
ON e.salary BETWEEN s.min_salary AND s.max_salary;

/* Outer Joins */

/* Left Outer Join =>Returns all records from the left table and matched records from the right table.
The table from which we wants the data should be written first*/
select * from student1 as s 
left join course as c
on s.student_id=c.student_id;

/* Right Outer Join =>Returns all records from the right table and matched records from the left table
The table from which we wants the data should be written second*/
select * from student1 as s 
right join course as c
on s.student_id=c.student_id;

/* Full Outer Join => Returns all the records when there is a match in either left or right table*/
select * from student1 as s 
left join course as c
on s.student_id=c.student_id
Union
select * from student1 as s 
right join course as c
on s.student_id=c.student_id;

/*Self Joins =>join where a table is joined with itself.*/

CREATE TABLE emp2 (
id INT(4) PRIMARY KEY Not Null Unique,
name VARCHAR(50) Not Null,
manager_id INT(4) Null,
salary INT(4) Not Null
);
INSERT INTO emp2 (id, name, manager_id, salary) VALUES
(1, 'Alice', NULL, 100000),
(2, 'Bob', 1, 80000),
(3, 'Charlie', 1, 75000),
(4, 'David', 2, 60000),
(5, 'Eve', 2, 55000);

SELECT e1.name AS employee_name, e2.name AS manager_name
FROM emp2 e1
LEFT JOIN emp2 e2 ON e1.manager_id = e2.id;