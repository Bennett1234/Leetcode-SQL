SELECT 
ROUND(100 * COUNT(*)/(SELECT COUNT(DISTINCT customer_id) FROM Delivery),2) 
AS immediate_percentage
FROM Delivery AS a
JOIN (
SELECT
customer_id, MIN(order_date) AS first_order
FROM Delivery
GROUP BY customer_id
) AS b
ON a.customer_id = b.customer_id
AND a.order_date = b.first_order
WHERE a.order_date = a.customer_pref_delivery_date
