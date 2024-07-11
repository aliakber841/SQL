use dbtheory;

/* Sub Queries Outer Query will execute first
   Don't add order by clause in sub query*/
select id,deptno
from emp3
where sal>
	(select sal from emp3 
    where id=3);
    
/* Single Row SubQueries (returns only one row =,>,<,>=,<=,<>) */
select empname,job
from employeedep
where job= (select job from employeedep where empid=126);

/* Using Group functions in a subquery */
select id,deptno
from emp3
where sal=
	(select max(sal) from emp3);
    
/* Having Clause with subqueries */
SELECT deptno, MIN(sal)
FROM emp3
GROUP BY deptno
HAVING MIN(sal) > (SELECT MIN(sal) FROM emp3 WHERE deptno = 10);

/* Multiple Row SubQueries (returns more than one row  in,any,all) */
select id,deptno
from emp3
where sal <any
	(select sal from emp3 
     where id=3);
     
select id,deptno
from emp3
where sal > all
	(select sal from emp3 
     where deptno=22);
