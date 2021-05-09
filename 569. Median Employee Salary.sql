SELECT Id, Company, Salary
FROM(SELECT Id, Company, Salary,
ROW_NUMBER () OVER (PARTITIONBY Company ORDERBY Salary) AS RN ,
COUNT(Id) OVER (PARTITION BY Company) AS COUNTS FROM Employee)T WHERE RN BETWEEN COUNTS/2 AND COUNTS/2+1 ORDER BY 23 ASC

/***
COUNT(*) OVER (ORDER BY U.userid) AS CNT calulates a "running count" - the count until "that" row. 
If you want to count all rows in the complete result, use the window function without the order by
***/
