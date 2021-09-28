SELECT pay_month, department_id,
CASE WHEN dep_avg > com_avg THEN 'higher'
WHEN dep_avg < com_avg THEN 'lower'
ELSE 'same' END AS comparison
FROM (
SELECT date_format(pay_date,'%Y-%m') AS pay_month,
b.department_id, AVG(a.amount) AS dep_avg,
(SELECT AVG(amount) FROM salary AS x
 WHERE date_format(a.pay_date,'%Y-%m') = date_format(x.pay_date,'%Y-%m')
GROUP BY date_format(x.pay_date,'%Y-%m')) AS com_avg
FROM salary AS a
JOIN employee AS b
ON a.employee_id = b.employee_id
GROUP BY date_format(pay_date,'%Y-%m'), b.department_id
ORDER BY pay_month DESC ) AS tmp;
