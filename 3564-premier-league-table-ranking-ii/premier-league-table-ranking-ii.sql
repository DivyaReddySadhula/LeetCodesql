/* Write your PL/SQL query statement below */
with tot_points as 
(
    select 
    team_name
    ,(wins*3+draws*1) as points
    ,rank() over(order by (wins*3+draws*1) desc) as position
    ,count(*) over () as cnt
    from TeamStats
), tier_rank as 
(
    select 
    tp.team_name
    ,case when tp.position<=ceil((cnt)*0.33) then 'Tier 1'
        when tp.position<=ceil((cnt)*0.66) then 'Tier 2'
    else 'Tier 3'
    end as tier
    from tot_points tp
)select 
tp.team_name as team_name
,tp.points as points
,tp.position as position
,tr.tier as tier
 from tot_points tp
 join tier_rank tr on tp.team_name = tr.team_name
 order by tp.points desc,tp.team_name asc