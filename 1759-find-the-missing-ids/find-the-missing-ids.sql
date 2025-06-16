/* Write your PL/SQL query statement below */
with listofIds as 
(
    select 
    level n
    from dual
    connect by level<= (select max(customer_id) from customers)
)
select n as "ids" from
(select n  from listOfIds
minus
select customer_id from customers
) order by "ids"

