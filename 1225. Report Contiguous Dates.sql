-- first step is to combine two sets
-- second step is to split in within the group, if it is continuous then after subtracting they should have the same outcome, use this as group ind in last step
--third step is to group based on the subtraction result

SELECT state period_state, 
    min(date) start_date, 
    max(date) end_date
from
    (SELECT *, SUBDATE(date,INTERVAL RANK() over (PARTITION by state ORDER BY date) day) ref
    from 
        (select fail_date date,'failed' state from Failed
        union all
        select success_date date,'succeeded' state from Succeeded
        ORDER BY date) a
    WHERE date BETWEEN  '2019-01-01' and '2019-12-31') b
GROUP BY state, ref
ORDER BY start_date;
