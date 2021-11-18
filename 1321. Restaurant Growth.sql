SELECT visited_on,amount,round(amount/7,2)average_amount,
from 
	(select 
		visited_on, 
	 sum(amount) over (order by visited_on rows 6 preceding) amount,
   row_number() over (order by visited_on rows) rnk
	from (select visited_on, sum(amount) amount from Customer GROUP BY visited_on) a
	) b
where b.rnk >= 6;
