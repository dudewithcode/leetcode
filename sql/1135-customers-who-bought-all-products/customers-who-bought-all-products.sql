/* Write your PL/SQL query statement below */
select customer_id
from customer c
group by customer_id
having count(distinct c.product_key) = (select count(*) from product)