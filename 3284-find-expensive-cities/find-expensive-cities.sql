/* Write your PL/SQL query statement below */
with avgHome as (select
city
,avg(price) as avg_home_prices
from Listings
group by city)
select city from avgHome
where avg_home_prices>(select  avg(price) as nat_avg from Listings)
order by city asc