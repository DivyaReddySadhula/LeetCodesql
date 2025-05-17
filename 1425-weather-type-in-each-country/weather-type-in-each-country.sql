/* Write your PL/SQL query statement below */
select
c.country_name
,case when avg(w.weather_state)<=15 then 'Cold'
    when avg(w.weather_state)>=25 then 'Hot'
    else 'Warm'
    end as weather_type
from Countries c
left join Weather w
on c.country_id = w.country_id
where extract(year from w.day) = 2019 and extract(month from w.day) = 11
group by c.country_name