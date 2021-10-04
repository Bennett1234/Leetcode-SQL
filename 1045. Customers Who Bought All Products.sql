SELECT b.customer_id FROM Product AS a
LEFT JOIN Customer AS b
ON a.product_key = b.product_key
GROUP BY b.customer_id
HAVING COUNT(DISTINCT b.product_key) = (SELECT COUNT(*) FROM Product)
