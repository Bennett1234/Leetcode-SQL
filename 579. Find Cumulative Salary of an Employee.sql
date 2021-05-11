SELECT E1.id, E1.month,
(IFNULL(E1.salary, 0) + IFNULL(E2.salary, 0) + IFNULL(E3.salary, 0)) AS Salary
FROM
(
SELECT id, MAX(month) AS month FROM Employee
GROUP BY id
HAVING COUNT(*) > 1
) AS maxmonth
LEFT JOIN Employee AS E1 
ON (maxmonth.id = E1.id AND maxmonth.month > E1.month)
LEFT JOIN Employee AS E2 
ON (E2.id = E1.id AND E2.month = E1.month - 1)
LEFT JOIN Employee AS E3 
ON (E3.id = E1.id AND E3.month = E1.month - 2)
ORDER BY id ASC, month DESC;


--my solution
select e2.id, e2.month,
       sum(salary) over (partition by e2.id order by e2.month desc rows 2 preceding) as salary
       from 
(select id, month, coalesce(salary, 0) as salary
from employee as e left join (SELECT id, MAX(month) as max_month
                              from Employee
                              group by id) as e1 on (e1.id = d.id)
 where e.month < e.max_month) as e2
 ORDER BY id ASC, month DESC;
