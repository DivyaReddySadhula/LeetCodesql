/* Write your PL/SQL query statement below */
with allMatches as 
(
    select  
    home_team_id as team_id
    ,home_team_goals as goals_for
    ,away_team_goals as goals_against
    from Matches
    UNION ALL
    select
    away_team_id as team_id
    ,away_team_goals as goals_for
    ,home_team_goals as goals_against
    from Matches
),stats as 
(
    select
    team_id
    ,COUNT(*) AS matches_played
    ,SUM(CASE 
                WHEN goals_for > goals_against THEN 3
                WHEN goals_for = goals_against THEN 1
                ELSE 0
            END) AS points
    ,SUM(goals_for) AS goal_for,
    SUM(goals_against) AS goal_against
    from allMatches
    group by team_id
)
SELECT 
    t.team_name,
    s.matches_played,
    s.points,
    s.goal_for,
    s.goal_against,
    (s.goal_for - s.goal_against) AS goal_diff
FROM stats s
JOIN Teams t ON s.team_id = t.team_id
ORDER BY 
    s.points DESC,
    (s.goal_for - s.goal_against) DESC,
    t.team_name;
