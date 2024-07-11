use dbtheory;

/* Single Row Functions */
/* (1) Character Functions */
create table chartable(
id int(4) Not Null Unique,
string varchar(30) Not Null,
salary int(6) Not Null,
comm int(4) Null,
primary key(id)
);
drop table chartable;
Insert into chartable(id,string,salary) values(1,'Sql Course',20000); 
Insert into chartable(id,string,salary) values(2,'Oracle Course',30000); 
Insert into chartable(id,string,salary) values(3,'Mysql Course',40000); 
Insert into chartable(id,string,salary) values(4,'Mongodb',50000); 

/* (1) Character Functions => (i) Case conversion functions. */
select lower(string)
from chartable;
select upper(string)
from chartable;
select lower(string)
from chartable
where id=2;

select string,id,salary
from chartable
where lower(string)='sql course';
/* The WHERE clause of the second SQL statement specifies that the employee name in the EMP table be converted to lowercase 
and then be compared to 'blake.' Since both the names are in lowercase now, a match is found and one row is selected. 
The WHERE clause can be rewritten in the following manner to produce the same result: */

/* select INITCAP(string)
from chartable; */

/* (1) Character Functions => (ii) Character manupulation functions. */
select concat(string,' Download Now ')  /* adds two strings */
from chartable;
select substr(string,1,3)  /* extracts string of determined length */
from chartable;
select length(string)     /* gives length of string */
from chartable;
select INSTR(string,'l')  /* find numeric position of each character */
from chartable;
select LPAD(string,20,'abc')  /* pads the character value right justified */
from chartable;
select RPAD(string,30,'abc')  /* pads the character value left justified */
from chartable;

/*string =>The original string. If the length of the original string is larger than the length parameter,
 this function removes the overfloating characters from string
length. The length of the string after it has been left-padded
lpad_string	Required. The string to left-pad to string */

select string,concat(string,' Watch Now '),length(string),instr(string,'c')
from chartable
where substr(string,1,3)='sql';

/* Number Functions */
create table numtable(
id int(4) Not Null Unique,
name varchar(20) Not Null,
decimalno float(8) Not Null,
primary key(id)
);
Insert into numtable values(1,'Ali',45.69267);

select round(decimalno,3) /* ROUND:Rounds value to specified decimal */
from numtable;
SELECT ROUND(45.923,2), ROUND(45.923,0),ROUND(45.923,-1);

select truncate(decimalno,3) /* Truncates value to specified decimal */
from numtable;

select mod(1600,300); /* Returns remainder of division */

/* Working With Dates */
select current_date();
select sysdate();
select now();
select day("2024-05-14 4:15:30");
select day(now());
select last_day(now());

create table datetable(
id int(4) Not Null unique,
ename varchar(20) Not Null,
deptno int(4) Not Null,
weeks int(4) Not Null,
hiredate varchar(20) Not Null,
primary key(id)
);
drop table datetable;
Insert into datetable values(1,'Ali',10,200,'2022-02-23 15:43:12');
Insert into datetable values(2,'Awais',20,100,'2022-04-23 15:43:12');
select id,ename,deptno,(sysdate()-hiredate)
from datetable
where deptno=10;

/* Dates Functions */
select last_day('2023-05-25');
SELECT TIMESTAMPDIFF(month, '2021-04-28', '2021-08-01'); /* months_between function */
SELECT TIMESTAMPADD(MONTH, 2, SYSDATE()); /* add_months function */
SELECT TIMESTAMPADD(DAY, 2, SYSDATE());  /* add_days function */
SELECT date_format(now(),'%Y-%m'); /* rounding year and month */
SELECT date_format('2022-3-23','%Y-%m');
SELECT YEAR(now());  -- or DATE();
SELECT date_format(now(),'%Y-%m-%d');  /*truncate date */
SELECT date_format(now(),'%Y-%m-%d %H:%i'); -- round to the minute

/* To char function with dates (convert) CONVERT(value, type) */ 
SELECT CONVERT(now(), date);
SELECT CONVERT(now(), time);
SELECT CONVERT(now(), datetime);
SELECT CONVERT(150, CHAR);
SELECT CONCAT('$', FORMAT(1000, 2)); /* to_char with numbers */
SELECT CONVERT('42', SIGNED); /* to_number functions */
SELECT CONVERT('2024-3-25', date);
SELECT STR_TO_DATE("August 10 2017", "%M %d %Y"); /* char to date */
SELECT CONVERT('2024-3-25', char);  /* date to char */
/* nvl functions */

/* Converts null to an actual value
Datatypes that can be used are date, character, and number.
Datatypes must match 
NVL(comm,0)
NVL(hiredate,'01-JAN-97')
NVL(job,'No Job Yet') */

SELECT ifnull(comm,23) from chartable
where id=1;

select coalesce(comm, 'NULL VALUE') from chartable;

/* Decode function Facilitates conditional inquires (if-else)*/
select id,salary,
case
when salary>20000 and salary<30000 then 'salary is greater than 20000'
when salary>30000 then 'salary is greater than 30000'
else 'salary is under 20000'
end as sal_cal
from chartable;

/* Nesting Functions */
SELECT ifnull(CONCAT('$', FORMAT(1000, 2)),23) from chartable
where id=1;