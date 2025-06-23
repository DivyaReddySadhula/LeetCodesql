/* Write your PL/SQL query statement below */

with col1 as
(select
first_col
,row_number() over(order by first_col) as rnk from 
Data
), col2 as 
(
    select second_col
    ,row_number() over(order by second_col desc) as  rnk
from Data
)select col1.first_col,col2.second_col
from col1 join col2 on col1.rnk = col2.rnk

  