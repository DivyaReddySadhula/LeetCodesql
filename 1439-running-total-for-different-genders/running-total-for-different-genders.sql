/* Write your PL/SQL query statement below */
SELECT
GENDER
,TO_CHAR(DAY,'YYYY-MM-DD') AS DAY
,SUM(SCORE_POINTS) OVER(PARTITION BY GENDER ORDER BY GENDER,DAY) AS TOTAL
FROM SCORES
-- ORDER BY GENDER, DAY ASC
