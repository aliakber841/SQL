SELECT * FROM Users
WHERE REGEXP_LIKE (email,'^[a-zA-Z0-9_-]+@+[a-zA_Z]+\\.com$')
ORDER BY user_id;