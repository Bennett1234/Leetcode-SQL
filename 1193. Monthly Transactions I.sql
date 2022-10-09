SELECT DATE_FORMAT(a.trans_date, "%Y-%m") AS month, a.country,
COUNT(a.id) AS trans_count,
(select count(*) from Transactions as b where b.state = 'approved' and DATE_FORMAT(b.trans_date, "%Y-%m") = DATE_FORMAT(a.trans_date, "%Y-%m") and a.country = b.country) as 
approved_count
SUM(a.amount) AS trans_total_amount,
(select SUM(COALESCE(c.amount,0)) from Transactions as c where c.state = 'approved' and DATE_FORMAT(c.trans_date, "%Y-%m") = DATE_FORMAT(a.trans_date, "%Y-%m") and a.country = c.country) as 
AS approved_total_amount 
FROM Transactions AS a
GROUP BY DATE_FORMAT(a.trans_date, "%Y-%m"), a.country;



SELECT DATA_FROMAT(trans_date, "%Y-%m") as month,
count(id) as trans_count,
sum(case when state = 'approved' then 1 else 0 end) as approved_count
from Transactions
group by DATE_FORMAT(trans_date, "%Y-%m"), country

