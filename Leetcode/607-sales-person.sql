-- USING SubQuery+NOT EXISTS
SELECT s.name FROM SalesPerson s
WHERE NOT EXISTS(
    SELECT 1 FROM Orders o
 WHERE o.sales_id=s.sales_id
 AND o.com_id IN (
    SELECT c.com_id FROM company c 
    WHERE (c.name='RED')  
 )
);
-- USING NOT EXISTS+JOIN
SELECT s.name FROM SalesPerson s
WHERE NOT EXISTS(
    SELECT 1 FROM Orders o
 JOIN Company c2 
 ON c2.com_id=o.com_id
    WHERE (c2.name='RED') AND o.sales_id=s.sales_id
);
-- USING NOT IN+JOIN
SELECT s.name FROM SalesPerson s
WHERE s.sales_id NOT IN(
    SELECT o.sales_id FROM Orders o
    INNER JOIN Company c2 ON c2.com_id=o.com_id
    WHERE (c2.name='RED')
);