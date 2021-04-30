SELECT a.player_id, a.device_id FROM Activity AS a
INNER JOIN
(SELECT player_id, MIN(event_date) AS first_login FROM Activity
GROUP BY player_id
ORDER BY player_id) AS b
ON a.player_id = b.player_id
AND a.event_date = b.first_login
ORDER BY a.player_id;

SELECT player_id, device_id FROM (
    SELECT player_id, device_id, 
    RANK() OVER (PARTITION BY player_id ORDER BY event_date) AS rnk
    FROM Activity)
AS tmp
WHERE rnk = 1;
