/* Write your PL/SQL query statement below */
with res as (
    select
    employee_id
    ,name
    ,salary
    ,count(salary) over(partition by salary order by salary) as cnt
    from 
    employees
), team_ranking as 
(
    select 
    employee_id
    ,name
    ,salary
    ,dense_rank() over(order by salary) as team_id
    from res
    where cnt>=2
)select * from team_ranking
order by team_id,employee_id
