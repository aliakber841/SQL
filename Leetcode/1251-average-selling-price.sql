SELECT p.product_id,
ROUND(
    CASE WHEN SUM(u.units)>0 THEN SUM(p.price*u.units)/SUM(u.units)
    ELSE 0 
    END ,2
    ) AS average_price
FROM Prices p
LEFT JOIN UnitsSold u ON p.product_id=u.product_id
AND u.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY p.product_id;