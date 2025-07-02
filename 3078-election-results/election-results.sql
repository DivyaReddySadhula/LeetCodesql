/* Write your PL/SQL query statement below */
with votes_cnt as 
(select
voter
,count(*) as cnt
from votes
where candidate is not null
group by voter 
),votes_value as 
(
    select
    v.candidate,1.0/vc.cnt as votes_share
    from votes v
    join votes_cnt vc
    on v.voter = vc.voter
),votes_share as 
(
    select 
    candidate
    ,sum(votes_share) as tot
    from votes_value
    group by candidate
)select candidate 
from votes_share 
where tot in (select max(tot) from votes_share)
order by candidate