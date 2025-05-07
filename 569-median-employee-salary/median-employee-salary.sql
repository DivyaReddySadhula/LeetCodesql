/* Write your PL/SQL query statement below */
with medianSal as (
    select id,company,salary,
    row_number() over(partition by company order by salary) as rnk,
    count(id) over(partition by company) as cnt from Employee
    order by company
)select medianSal.id,medianSal.company,medianSal.salary from medianSal where(rnk = ceil(cnt/2)) or (rnk = ceil(cnt/2)+1 and mod(cnt,2)=0)