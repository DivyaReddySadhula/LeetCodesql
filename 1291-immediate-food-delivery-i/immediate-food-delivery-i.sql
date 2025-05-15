/* Write your PL/SQL query statement below */
with imm as 
(select 
count(*) as imm_cnt
from Delivery
where order_date = customer_pref_delivery_date )
select round((imm_cnt/(select count(*) as tot_cnt
    from Delivery))*100,2) as immediate_percentage from imm