select distinct(marks) from student
order by marks;

Select * 
from student
ORDER BY (marks) desc;

Select * 
from student
ORDER BY (marks) asc;

select * from student
where marks<=50;

select * from student
where marks<=70 And age>=22;

select * from student
where marks<=70 or age>=20;

select * from student
where marks<=70 And age!=21;

select Marks as 'MARKS'
from student;

select name notnull
from student;

select name isnull
from student