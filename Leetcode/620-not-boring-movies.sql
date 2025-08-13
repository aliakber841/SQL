SELECT * FROM Cinema
WHERE MOD(id,2)!=0 AND description!='Boring'
ORDER BY rating DESC;