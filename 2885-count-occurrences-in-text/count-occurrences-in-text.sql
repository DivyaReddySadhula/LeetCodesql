/* Write your PL/SQL query statement below */
with wordcnt as 
(select 
file_name,
count(case when content like '% bull %' then 1 else null end) as bullcnt
,count(case when content like '% bear %' then 1 else null end) as bearcnt
from files
group by file_name
)select 'bull' as word, sum(bullcnt) as count from wordcnt
union all
select 'bear' as word, sum(bearcnt) as count from wordcnt
