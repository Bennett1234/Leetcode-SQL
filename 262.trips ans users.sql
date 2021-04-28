select Request_at as Day,
      1 - round(sum(case when Status = 'completed' then 1 else 0 end)/count(*),2) as 'Cancellation Rate' 
from Trips as t left join Users as u1 on (u1.Users_Id = t.Client_Id)
                 left join Users as u2 on (u2.Users_Id = t.Driver_Id)
where u1.Role = 'client'
and u2.role = 'driver'
and u1.Banned = 'No'
and u2.Banned = 'No'
and t.Request_at between '2013-10-01' and '2013-10-03'
group by Request_at
