/* Write your PL/SQL query statement below */
with cal as 
(
    select 
    transaction_date
    ,case when MOD(amount,2)<>0 then amount else 0 end  odd_amt
    ,case when MOD(amount,2)=0 then amount else 0 end  even_amt
    from transactions
), transac_sum as 
(
    select 
    to_char(transaction_date,'YYYY-MM-DD') as transaction_date 
    ,sum(odd_amt) as odd_sum
    ,sum(even_amt) as even_sum
    from cal
    group by transaction_date
)select * from transac_sum order by transaction_date asc