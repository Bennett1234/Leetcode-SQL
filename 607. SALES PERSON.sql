SELECT name FROM salesperson
WHERE sales_id NOT IN (
SELECT b.sales_id FROM company AS a
INNER JOIN orders AS b
ON a.com_id = b.com_id
WHERE a.name = 'RED'
);
