/* Write your PL/SQL query statement below */
SELECT
    d.driver_id,
    COUNT(DISTINCT r.ride_id) AS cnt
FROM (
    SELECT DISTINCT driver_id FROM rides
) d
LEFT JOIN rides r
    ON r.passenger_id = d.driver_id
GROUP BY d.driver_id;
