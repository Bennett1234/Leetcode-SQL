/* this one is similar to 1225
*/

select min(log_id) as start_id, max(log_id) as end_id
from (select l.log_id, (l.log_id - l.row_num) as diff
      from (select log_id, row_number() over() as row_num from Logs) l
      ) 
group by diff
