-- SUBQUERY
SELECT o1.customer_number FROM Orders o1
GROUP BY o1.customer_number
HAVING COUNT(*)=(
    SELECT MAX(order_count) FROM (
        SELECT COUNT(*) AS order_count
        FROM Orders
        GROUP BY customer_number
    ) AS counts
    );