with temp as (
SELECT *, row_number() over(partition by product_id order by change_date desc) as rk
from Products
where change_date <= '2019-08-16'
)
,
list as (select distinct product_id from Products)

select
list.product_id,
coalesce(new_price,10) as price
from list left join temp on (list.product_id = temp.product_id and temp.rk=1)
