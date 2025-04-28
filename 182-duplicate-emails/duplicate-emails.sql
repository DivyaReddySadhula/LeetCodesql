# Write your MySQL query statement below
select distinct email from (select email, count(*) from Person 
group by email
having count(*)>=2) as a