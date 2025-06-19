/* Write your PL/SQL query statement below */
WITH unpivoted AS (
  SELECT contest_id, winner
  FROM Contests
  UNPIVOT (
    winner FOR medal IN (gold_medal, silver_medal, bronze_medal)
  )
),
consec_medals AS (
  SELECT 
    winner,
    contest_id - ROW_NUMBER() OVER (PARTITION BY winner ORDER BY contest_id) AS grp
  FROM unpivoted
),
qualified_consec AS (
  SELECT winner
  FROM consec_medals
  GROUP BY winner, grp
  HAVING COUNT(*) >= 3
),
gold_winners AS (
  SELECT gold_medal AS winner
  FROM Contests
),
qualified_gold AS (
  SELECT winner
  FROM gold_winners
  GROUP BY winner
  HAVING COUNT(*) >= 3
),
final_candidates AS (
  SELECT winner FROM qualified_consec
  UNION
  SELECT winner FROM qualified_gold
)
SELECT DISTINCT u.name, u.mail
FROM final_candidates fc
JOIN Users u ON u.user_id = fc.winner;
