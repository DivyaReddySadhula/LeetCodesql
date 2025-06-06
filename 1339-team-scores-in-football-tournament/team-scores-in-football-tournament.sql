/* Write your PL/SQL query statement below */
WITH score AS (
    SELECT 
        m.host_team AS team_id,
        CASE 
            WHEN m.host_goals > m.guest_goals THEN 3
            WHEN m.host_goals = m.guest_goals THEN 1
            ELSE 0
        END AS points
    FROM matches m

    UNION ALL
    SELECT 
        m.guest_team AS team_id,
        CASE 
            WHEN m.guest_goals > m.host_goals THEN 3
            WHEN m.guest_goals = m.host_goals THEN 1
            ELSE 0
        END AS points
    FROM matches m
),
points_by_team AS (
    SELECT 
        team_id,
        SUM(points) AS num_points
    FROM score
    GROUP BY team_id
)
SELECT 
    t.team_id,
    t.team_name,
    NVL(p.num_points, 0) AS num_points
FROM teams t
LEFT JOIN points_by_team p ON t.team_id = p.team_id
ORDER BY num_points DESC, t.team_id ASC;
