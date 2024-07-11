/* Make a Database */

/*Make that Database in use state*/
use dbtheory;

/*create a table */
create table student
(
id int(4)Not Null Unique,
name VARCHAR(20)Not Null,
age int(4)NOt NULL,
Marks int(4) Not Null,
Primary Key(id)
);

/*Inserting data into table */
Insert into student values(1,'Ali',21,79);
Insert into student values(2,'Awais',20,80);
Insert into student values(3,'Usama',22,78);


/*Selecting all columns */
select * from student;

/*Selecting specified columns */

select age,marks 
from student;

/*Using Arithmetic operations */
select name,marks,marks+2
from student;

/* Operators Precedence is (*,/,+,-) */
select name,marks,2*marks-100
from student;

select name,marks,1*(marks+22)
from student;

/* Defining Null Values */
create table employee(
empid int(4) Not Null Unique,
empname VARCHAR(50) Null,
salary int(4) Not Null,
comm int(4) Null,
primary key(empid)
);
/*drop table employee; */
Insert into employee(empid,salary) values(1,2000);


/* Null Values in Arithmetic Operations */
select empid,12*salary+comm
from employee
where empid=1;

/* Defining a Column Alias */

select empid as id,salary sal
from employee;

select empid "ID"
from employee;

/* Concatenation Operator */
create table employees
(
id int(4) Not Null Unique,
ename VARCHAR(50) Not Null,
job VARCHAR(50) Null,
primary key(id)
);
drop table employees;
Insert into employees values(1,'KING','PRESIDENT');
Insert into employees values(2,'BLAKE','MANAGER');
Insert into employees values(3,'MARTIN','MANAGER');
Insert into employees values(4,'MARTIN','MANAGER');
Insert into employees(id,ename) values(5,'BOB');

select CONCAT(ename,job) AS "Employees"
from employees;

select CONCAT(ename," "," is a "," ",job)
as "Employee Details"
from employees;

/* Duplicate Rows (e.g martin and manager) */

/* Eliminating Duplicate Rows (e.g martin and manager) */

select distinct ename,job 
from employees;

/* Displays Table Structure such as column names,data types etc */
describe employees;

