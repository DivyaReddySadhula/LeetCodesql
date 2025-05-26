/* Write your PL/SQL query statement below */
with res as (
    select team_id
    ,team_name
    ,(wins*3+draws*1+losses*0) as points
    ,rank() over(order by (wins*3+draws*1+losses*0) desc ) as position
    from teamstats
)select team_id,team_name,points,position
 from res
order by points desc,team_name