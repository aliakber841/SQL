create database ist;
use ist;
create table student
(
id int(4)Not Null Unique,
name char(20)Not Null,
age int(4)NOt NULL,
Marks int(4) Not Null,
Primary Key(id)
);
Insert into student(id,name,age,Marks)values(16,'Ali',21,56);
Insert into student values(2,'AWAIS',21,76);
insert into student values(4, 'ahmed', 25, 68);
Insert into student values(6,'hassan',27,42);
SELECT * FROM amitdiwan.student;
describe student;
ALTER TABLE student ADD COLUMN  height int(4);
select * from student;
select id,name from student;
ALTER TABLE student ;
update student 
set name = "ali raza" , marks= 80
where id=4




