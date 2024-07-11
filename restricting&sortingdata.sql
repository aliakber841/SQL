use dbtheory;

/* Limiting rows using selection */
create table employeedep(
empid int(4) Not Null Unique,
empname VARCHAR(50) Not Null,
job VARCHAR(20) Null,
deptno int(4) Not Null,
primary key(empid)
);
drop table employeedep;
Insert into employeedep values(36,'Ali','President',10);
Insert into employeedep values(27,'Awais','Manager',20);
Insert into employeedep values(126,'Rajab','Clerk',30);
Insert into employeedep(empid,empname,deptno) values(11,'Usama',30);

/* Using the where clause */
select empname,job,deptno
from employeedep
where empid=36;

/* Character strings(case sensitive) and dates(format sensitive) */ 
select empname,job,deptno
from employeedep
where empname='Awais';

/* Comparison Operators ( =,>,>=,<,<=,<>) last one means not equal to */
select empname,job,deptno
from employeedep
where empname<>'Ali';

/*Other Comparison Operators (Between and,In,Like,Is null)  */

/*Use the BETWEEN operator to display rows based on a range of values. */
select empname,job,deptno
from employeedep
where deptno between 10 and 15;

/* Use the IN operator to test for values in a list. */
select empname,job,deptno
from employeedep
where deptno in(10);

/* Use the LIKE operator to perform wildcard searches of valid search string values.
it searches row that matchesba character pattern.
Search conditions can contain either literal characters or numbers.
% denotes zero or many characters.
 _ denotes one character. */
 
/* To display the values where empname starts from A.we write the characters followed by % */
select empname,job,deptno
from employeedep
where empname like 'A%';

/* To display the values where empname ends with S.we write the % followed by characters */
select empname,job,deptno
from employeedep
where empname like '%S';

/* To display the values where empname has A as a second character.we write the _characters followed by % */
select empname,job,deptno
from employeedep
where empname like '_A%';


/* To display the values where empname starts with a and have two characters in length.we write the characters followed by % */
select empname,job,deptno
from employeedep
where empname like 'A_%';

/* To display the values where empname starts with a and have three characters in length.we write the characters followed by % */
select empname,job,deptno
from employeedep
where empname like 'A__%';

/* Using IS NULL.It Test for null values . */
select empname,job,deptno
from employeedep
where job IS NULL;

/* Logical Operators(And,Or,Not) */
select empname,job,deptno
from employeedep
where empname='Ali' AND deptno=10;

select empname,job,deptno
from employeedep
where empname='Awais' or deptno=7;

select empname,job,deptno
from employeedep
where job NOT IN ('CLERK','MANAGER','ANALYST');

/* Rules of prcedence .Ist are the comparison operators followed by not,and,or */
select empname,job,deptno
from employeedep
where job='Clerk' 
or job='President'
and empname='Awais';
/*select the empname whose job is president and name is awais . or whose job is clerk. */

select empname,job,deptno
from employeedep
where (job='Clerk' 
or job='President')
and empname='Ali';
/*select the empname whose job is president or whose job is clerk. and name is ali .  */

/* Order By Clause.
Sort rows with the ORDER BY clause
ASC: ascending order, default
DESC: descending order
The ORDER BY clause comes last in the SELECT statement.*/

select empid,empname,job,deptno
from employeedep
order by empid;  /*asc order by default */

select empid,empname,job,deptno
from employeedep
order by empid desc;  /*desc order*/

/* Sorting by Column Alias */
select empid,empname,job,deptno+20
from employeedep
order by deptno; 

/* Sorting by Multiple Columns */
select empid,empname,job,deptno
from employeedep
order by deptno,empid,empname; 

select empid,empname,job,deptno
from employeedep
order by empid,empname,deptno; 