/*
176.Write a SQL query to get the second highest salary from the Employee table. If there is no second highest salary, then the query should return null.
*/
SELECT (ISNULL((SELECT DISTINCT Salary
from(
SELECT Salary,
    RANK() OVER(ORDER BY Salary DESC) AS ranking
FROM Employee ) as EM
WHERE EM.ranking = 2),NULL)) as SecondHighestSalary




177. Write a SQL query to get the nth highest salary from the Employee table.
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
      SELECT max(Salary)
      FROM Employee x
      WHERE (N-1) = (SELECT COUNT(Salary)
          FROM (SELECT DISTINCT Salary 
                     FROM Employee) y
          WHERE y.Salary > x.Salary)
  );
END
