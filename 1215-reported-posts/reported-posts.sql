/* Write your PL/SQL query statement below */

select
extra as report_reason
,count(distinct post_id ) as report_count
from Actions
where action_date = to_date('2019-07-04','YYYY-MM-DD')
and action = 'report'
group by extra