SELECT c.name as Customers from Customers c
LEFT JOIN Orders d
ON c.id=d.customerId
WHERE (d.customerId IS NULL);