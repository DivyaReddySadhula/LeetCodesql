/* Write your PL/SQL query statement below */
select product_id,store,price
from Products
UNPIVOT(
    price for store in (store1 as 'store1',store2 as 'store2',store3 as 'store3')
)
