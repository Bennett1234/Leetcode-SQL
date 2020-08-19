/*
Write a SQL query to find employees who have the highest salary in each of the departments. 
For the above tables, your SQL query should return the following rows (order of rows does not matter).
*/
select D.Name as Department, E1.Name as Employee, E1.Salary
from (select Name, Salary, DepartmentId,
dense_rank() over(partition by DepartmentId order by Salary Desc) as rank
from Employee) AS E1 Join Department as D on (D.Id = E1.DepartmentId)
where E1.rank = 1
