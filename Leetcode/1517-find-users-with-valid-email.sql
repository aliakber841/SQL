SELECT u.user_id,u.name,u.mail
FROM Users u
WHERE REGEXP_LIKE(u.mail,'^[a-zA-Z][a-zA-Z0-9_.-]*@leetcode\\.com$','c');