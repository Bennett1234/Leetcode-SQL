SELECT login_date, COUNT(user_id) AS user_count
FROM (
SELECT DISTINCT user_id, FIRST_VALUE(activity_date) OVER(PARTITION BY user_id ORDER BY activity_date ASC) AS login_date FROM Traffic
WHERE activity = 'login'
) AS tmp
WHERE DATEDIFF("2019-06-30", login_date) <= 90
GROUP BY login_date;
