/* Write your PL/SQL query statement below */
with defaultMonthly  as(
    select 
    level as month
    , 0 as salary 
    from dual
    connect by level<13
    )
    , empId as (
        select distinct
        id 
        from Employee
    )
    ,lookupSal as (
        select distinct empId.id
        ,defaultMonthly.month
        ,defaultMonthly.salary
    from defaultMonthly
    join empId on 1=1
    order by id,month)
    ,cumSum as (
        select lk.id
        ,e.month
        ,sum(nvl(e.salary,0)) over(partition by lk.id order by lk.month desc rows between current row  and 2 Following)salary
    from lookupSal lk 
    left join Employee e 
    on  lk.id = e.id 
    and lk.month = e.month
    order by 1,2 desc)
    select * 
    from cumSum c 
    where month is not null
    and (id,month) not in (select e.id, max(e.month) over(partition by e.id)  from employee e)






