WITH multiple_purchases AS (
    SELECT *
    FROM Users
    WHERE user_id IN (
        SELECT user_id
        FROM Users
        GROUP BY user_id
        HAVING COUNT(*) > 1
    )
)
SELECT DISTINCT u1.user_id
FROM multiple_purchases u1
JOIN multiple_purchases u2
  ON u1.user_id = u2.user_id
 AND u1.rowid != u2.rowid 
 AND ABS(u1.created_at - u2.created_at) <= 7;



-- select user_id, created_at, (created_at + INTERVAL '7' DAY ) as week from users
-- ,u1.created_at as u1_cre,u2.created_at as u2_cre
 


-- SELECT DISTINCT u1.user_id
-- FROM Users u1
-- JOIN Users u2
--   ON u1.user_id = u2.user_id
--  AND u1.created_at <= u2.created_at
--  AND u2.created_at <= u1.created_at + INTERVAL '7' DAY
--  AND u1.item != u2.item OR u1.created_at != u2.created_at;
