SELECT visited_on,amount,round(amount/7,2)average_amount,
from 
	(select 
		visited_on, 
	 sum(amount) over (order by visited_on rows 6 preceding) amount,
   row_number() over (order by visited_on rows) rnk
	from (select visited_on, sum(amount) amount from Customer GROUP BY visited_on) a
	) b
where b.rnk >= 6;




with temp as (
select
visited_on
,sum(amount) as amount
from Customer
group by visited_on


)
,
 temp2 as(
select
visited_on,
sum(amount) over(order by visited_on rows between 6 preceding and current row) as amount,
round(avg(amount) over(order by visited_on rows between 6 preceding and current row),2) as average_amount
,row_number() over(order by visited_on) as rk
from temp
order by visited_on)

select visited_on, amount, average_amount
from temp2
where rk > 6
