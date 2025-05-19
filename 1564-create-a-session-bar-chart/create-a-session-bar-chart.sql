/* Write your PL/SQL query statement below */

select 
b.bin
,count(s.bin) as total
from 
(
    select '[0-5>' bin from dual
    union all
    select '[5-10>' bin from dual
    union all
    select '[10-15>' bin from dual
    union all
    select '15 or more' bin from dual  
)b
left join
(
    select
    case
        when floor(duration/60) between 0 and 4 then '[0-5>'
        when floor(duration/60) between 5 and 9 then '[5-10>' 
        when floor(duration/60) between 10 and 14 then '[10-15>' 
        when floor(duration/60)>=15 then '15 or more'
    end as bin
    from sessions   
)s
on b.bin = s.bin
group by  b.bin