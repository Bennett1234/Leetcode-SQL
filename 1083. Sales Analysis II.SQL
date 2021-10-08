SELECT DISTINCT BUYER_ID
FROM SALES AS S
WHERE 1 IN (SELECT PRODUCT_ID FROM SALES AS A WHERE A.BUYER_ID = S.BUYER_ID)
AND 3 NOT IN (SELECT PRODUCT_ID FROM SALES AS B WHERE B.BUYER_ID = S.BUYER_ID)


WITH
tmp AS (
SELECT a.buyer_id, b.product_name FROM Sales AS a
JOIN Product AS b
ON a.product_id = b.product_id
)

SELECT DISTINCT buyer_id FROM tmp
WHERE buyer_id NOT IN (SELECT buyer_id FROM tmp WHERE product_name = 'iPhone')
AND buyer_id IN (SELECT buyer_id FROM tmp WHERE product_name = 'S8');
