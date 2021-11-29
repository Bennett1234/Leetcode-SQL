WITH

tmp AS(
SELECT username, activity, startDate, endDate,
ROW_NUMBER() OVER(PARTITION BY username ORDER BY startDate DESC) AS rnk,
COUNT(activity) OVER(PARTITION BY username) AS num
FROM UserActivity 
)

SELECT DISTINCT username, activity, startDate, endDate FROM tmp 
WHERE 
CASE WHEN num = 1 THEN rnk = 1
ELSE rnk = 2
END;


SELECT distinct username, activity, startDate, endDate
from (select *,ROW_NUMBER() OVER(PARTITION BY username ORDER BY startDate DESC) AS rnk from UserActivity) a
left join (select username, count(*) as ct from UserActivity group by username) b on (a.username = b.username)
where case when ct = 1 then rnk = 1 else rnk =2 end;

select distinct username, activity, startDate, endDate
from UserActivity
WHERE concat(username, startDate) in (select concat(username, startDate) from (select username, max(startDate)
                                                                                from (select *, row_number() over (PARTITION BY username ORDER BY startDate DESC) AS rnk
                                                                                      from userActivity
                                                                                      where rn <= 2)
                                                                                 group by username))
