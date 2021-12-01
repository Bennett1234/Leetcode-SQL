SELECT c.customer_id, c.customer_name
FROM customers AS c
WHERE EXISTS(SELECT * FROM orders WHERE customer_id = c.customer_id AND product_name = 'A')
AND EXISTS(SELECT * FROM orders WHERE customer_id = c.customer_id AND product_name = 'B')
AND NOT EXISTS(SELECT * FROM orders WHERE customer_id = c.customer_id AND product_name = 'C')
ORDER BY c.customer_id;
