select p1.product_id, p1.new_price as price
from Products p1
join (select product_id, max(change_date) as change_date
     from Products as p2
     where changge_date <= '2019-08-06'
     group by product_id) as p2
    on p2.product_id = p1.product_id and p1.changge_date = p2.change_date

union

select product_id, 10 as price
from Products
group by product_id
having min(change_date) > '2019-08-16'
order by price desc
