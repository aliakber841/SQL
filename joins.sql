use ist;

/*Inner Joins => Common Data between two tables in single/result table*/
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

select * from student1 
inner join course
on student1.student_id=course.student_id;

/* using alias */
select * from student1 as s 
inner join course as c
on s.student_id=c.student_id;

/* Left Join =>Returns all records from the left table and matched records from the right table.
The table from which we wants the data should be written first*/
select * from student1 as s 
left join course as c
on s.student_id=c.student_id;

/* Right Join =>Returns all records from the right table and matched records from the left table
The table from which we wants the data should be written second*/
select * from student1 as s 
right join course as c
on s.student_id=c.student_id;

/* Full Join => Returns all the records when there is a match in either left or right table*/
select * from student1 as s 
left join course as c
on s.student_id=c.student_id
Union
select * from student1 as s 
right join course as c
on s.student_id=c.student_id;

/* Cross Join => CROSS JOIN in SQL Server combines all of the possibilities of two or more tables and returns a result that 
includes every row from all contributing tables. It's also known as CARTESIAN JOIN because it produces the Cartesian product of all linked tables. 
The Cartesian product represents all rows present in the first table multiplied by all rows present in the second table.*/

select * from student1 as s 
cross join course as c;


