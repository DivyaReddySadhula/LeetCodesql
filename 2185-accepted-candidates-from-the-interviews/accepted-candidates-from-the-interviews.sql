/* Write your PL/SQL query statement below */
with res as 
(
    select 
    c.candidate_id
    ,sum(r.score)  as tot_score
    from candidates c
    join rounds r
    on c.interview_id = r.interview_id
    where c.years_of_exp>=2
    group by r.interview_id,c.candidate_id
)select  candidate_id from res where tot_score>15
