/* Write your PL/SQL query statement below */
select
i.invoice_id
,c.customer_name
,i.price
,count(distinct ct.contact_email) as contacts_cnt
,COUNT(DISTINCT CASE WHEN cu.email IS NOT NULL THEN ct.contact_email END) AS trusted_contacts_cnt
from Invoices i
join Customers c
on i.user_id = c.customer_id
left join contacts ct
on i.user_id = ct.user_id
left join customers cu 
on cu.email = ct.contact_email
group by i.invoice_id,c.customer_name,i.price
order by i.invoice_id