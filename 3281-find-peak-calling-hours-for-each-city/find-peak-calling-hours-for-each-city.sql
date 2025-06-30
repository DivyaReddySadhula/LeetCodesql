/* Write your PL/SQL query statement below */
WITH hourly_calls AS (
    SELECT 
        city,
        EXTRACT(HOUR FROM cast(call_time as timestamp)) AS peak_hrs,
        COUNT(*) AS number_of_calls
    FROM calls
    GROUP BY city, EXTRACT(HOUR FROM cast(call_time as timestamp))
),
ranked_hours AS (
    SELECT 
        city,
        peak_hrs AS peak_calling_hour,
        number_of_calls,
        DENSE_RANK() OVER (PARTITION BY city ORDER BY number_of_calls DESC) AS rnk
    FROM hourly_calls
)
SELECT 
    city,
    peak_calling_hour,
    number_of_calls
FROM ranked_hours
WHERE rnk = 1
ORDER BY peak_calling_hour DESC, city DESC;
