/* Write your PL/SQL query statement below */
with highestVotes as (select c.name as name,count(*) over(partition by v.candidateId) as cnt  
from Candidate c
join Vote v on c.id = v.candidateId) select distinct(name) from highestVotes where cnt = (select max(cnt) from highestVotes)
