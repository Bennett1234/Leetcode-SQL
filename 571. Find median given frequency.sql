SELECT AVG(Number) AS median
FROM 
(
select *, SUM(Frequency) OVER (ORDER BY Number) AS cum_sum, 
          (SUM(Frequency) OVER ())/2.0  AS mid
FROM Numbers
) AS temp
WHERE mid BETWEEN cum_sum - frequency AND cum_sum;
