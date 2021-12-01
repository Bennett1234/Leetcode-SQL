WITH 

cte AS(
SELECT product_id, '2018' AS report_year,
       CASE
       WHEN period_start >= '2019-01-01' THEN 0
       WHEN period_end < '2019-01-01' AND period_start < '2019-01-01' THEN  DATEDIFF(period_end, period_start)+1
       ELSE DATEDIFF('2019-01-01', period_start)
       END AS days_in_year,
       average_daily_sales
FROM Sales 
    
UNION 
    
SELECT product_id, '2019' AS report_year,
       CASE
       WHEN period_start >='2020-01-01' THEN 0
       WHEN period_end < '2020-01-01' AND period_start > '2018-12-31' THEN  DATEDIFF(period_end, period_start)+1
       WHEN period_end < '2020-01-01' AND period_start <= '2018-12-31' THEN DATEDIFF(period_end, '2018-12-31')
       WHEN period_end >= '2020-01-01' AND period_start > '2018-12-31' THEN  DATEDIFF('2020-01-01', period_start)
       ELSE DATEDIFF('2020-01-01', '2019-01-01')
       END AS days_in_year,
       average_daily_sales
FROM Sales 


UNION 
    
SELECT product_id, '2020' AS report_year,
       CASE
       WHEN period_start >= '2020-01-01' THEN  DATEDIFF(period_end, period_start)+1
       WHEN period_end <'2020-01-01' THEN 0
       ELSE DATEDIFF(period_end, '2019-12-31')
       END AS days_in_year,
       average_daily_sales
FROM Sales 
)

SELECT c.product_id, 
       p.product_name,  
       c.report_year,
       c.days_in_year*c.average_daily_sales AS total_amount
FROM cte AS c
JOIN Product AS p ON c.product_id = p.product_id 
WHERE c.days_in_year > 0
ORDER BY 1, 3;
