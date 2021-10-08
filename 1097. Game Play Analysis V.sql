SELECT D.INSTALL_DT, SUM(INS_IND) AS INSTALLS, AVG(DAY1_IND) AS DAY1_RETENTION
FROM(SELECT C.*, CASE WHEN C.EVENT_DATE = C.INSTALL_DATE THEN 1 ELSE 0 END AS INS_IND,
                 CASE WHEN DATEDIFF(EVENT_DATE, INSTALL)DATE) = 1 THEN 1 ELSE 0 END AS DAY1_IND
                 FROM (SELECT *, (SELECT MIN(EVENT_DATE) AS INSTALL_DATE FROM ACTIVITY AS B WHERE A.PLAYER_ID = B.PLAYER_ID)
                       FROM ACTIVITY AS A)) AS C) AS D
GGROUP BY D.INSTALL_DT



SELECT a.install_dt, COUNT(a.player_id) AS installs,
ROUND(COUNT(b.player_id)/COUNT(a.player_id),2) AS Day1_retention FROM (
SELECT DISTINCT player_id, FIRST_VALUE(event_date) OVER(PARTITION BY player_id ORDER BY event_date) AS install_dt FROM Activity
) AS a
LEFT JOIN Activity AS b
ON a.player_id = b.player_id
AND DATEDIFF(b.event_date, a.install_dt) = 1
GROUP BY a.install_dt
