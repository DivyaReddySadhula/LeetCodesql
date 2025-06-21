/* Write your PL/SQL query statement below */
with res as 
(select
SUM(case when income< 20000 then 1 else 0 end) as "Low Salary"
,SUM(case when income between  20000 and 50000 then 1 else 0 end) as "Average Salary"
,SUM(case when income> 50000 then 1 else 0 end) as "High Salary"
from accounts
),unpivotres as 
(
    select category, accounts_count
    from res
    unpivot(
        accounts_count for category in ("Low Salary", "Average Salary", "High Salary")
    )
)select * from unpivotres
