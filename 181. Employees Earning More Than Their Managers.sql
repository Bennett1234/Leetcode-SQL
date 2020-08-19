/*
Given the Employee table, write a SQL query that finds out employees who earn more than their managers.
For the above table, Joe is the only employee who earns more than his manager.
*/

SELECT E1.Name as Employee
FROM Employee E1 JOIN Employee E2 on (E1.ManagerId = E2.Id)
where E1.Salary > E2.Salary
