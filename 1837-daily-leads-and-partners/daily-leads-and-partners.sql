/* Write your PL/SQL query statement below */
select
to_char(date_id,'YYYY-MM-DD') date_id
,make_name
,count(distinct lead_id) unique_leads
,count(distinct partner_id) unique_partners
from DailySales
group by date_id,make_name