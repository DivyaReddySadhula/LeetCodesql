/* Write your PL/SQL query statement below */
with name_of_days as 
(select 
TRIM(to_char(submit_date,'DAY')) as day_s
from tasks
)select count(case when day_s IN('SATURDAY','SUNDAY') then 1 end) as weekend_cnt,
count(case when day_s IN('MONDAY','TUESDAY','WEDNESDAY','THURSDAY','FRIDAY') then 1 end) as working_cnt
from name_of_days