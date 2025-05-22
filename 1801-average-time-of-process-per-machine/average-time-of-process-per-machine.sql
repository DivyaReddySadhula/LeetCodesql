/* Write your PL/SQL query statement below */
WITH pair AS(
    SELECT 
        a.machine_id,
        a.timestamp AS start_time,
        e.timestamp AS end_time
    FROM Activity a
    JOIN Activity e
      ON a.machine_id = e.machine_id
     AND a.process_id = e.process_id  
     AND a.activity_type = 'start'
     AND e.activity_type = 'end'
)SELECT 
machine_id
,ROUND(AVG(end_time-start_time),3) as processing_time
FROM pair
GROUP BY machine_id
ORDER BY machine_id    