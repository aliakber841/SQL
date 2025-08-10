SELECT p1.email as Email from Person p1
GROUP BY p1.email
HAVING COUNT(p1.email)>1;