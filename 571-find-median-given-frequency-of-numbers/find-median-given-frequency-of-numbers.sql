/* Write your PL/SQL query statement below */
with  decompressed(num,frequency,occurrence) as (
    select num,frequency,1 as occurrence from Numbers
    where frequency >0 
    union all
    select d.num,d.frequency,d.occurrence+1 from decompressed d where d.occurrence+1<=d.frequency
), median_number as (
    select decompressed.num,
    row_number() over(order by decompressed.num) as row_num,
    count(*) over() total_num
    from decompressed
)select case when mod(max(total_num),2) = 0 then round(avg(num),1)
else round(max(num),1) end as median from median_number
where row_num between total_num/2 and total_num/2 +1