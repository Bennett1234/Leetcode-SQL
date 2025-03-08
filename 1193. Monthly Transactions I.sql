select
left(trans_date,7) as month
,country
,count(*) as trans_count
,sum(case when state = 'approved' then 1 else 0 end) as approved_count
,sum(amount) as trans_total_amount
,sum(case when state = 'approved' then amount else 0 end) as approved_total_amount
from Transactions
group by country, left(trans_date,7)



SELECT DATA_FROMAT(trans_date, "%Y-%m") as month,
count(id) as trans_count,
sum(case when state = 'approved' then 1 else 0 end) as approved_count
from Transactions
group by DATE_FORMAT(trans_date, "%Y-%m"), country

