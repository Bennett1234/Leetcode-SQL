WITH temp AS (
    SELECT PLAYER_ID, EVENT_DATE AS install_dt,
           ROW_NUMBER() OVER(PARTITION BY PLAYER_ID ORDER BY EVENT_DATE) AS RK
    FROM Activity
)
SELECT 
    install_dt,
    COUNT(*) AS installs,
    ROUND(
        SUM(CASE WHEN EXISTS (
            SELECT 1 
            FROM Activity a 
            WHERE a.PLAYER_ID = temp.PLAYER_ID 
            AND DATEDIFF(a.EVENT_DATE, temp.install_dt) = 1
        ) THEN 1 ELSE 0 END) / COUNT(*), 2
    ) AS day1_retention
FROM temp
WHERE RK = 1
GROUP BY install_dt;
