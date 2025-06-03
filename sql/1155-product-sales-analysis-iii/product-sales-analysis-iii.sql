/* Write your PL/SQL query statement below */
select distinct p.product_id, s.year first_year,s.quantity, s.price
from sales p

join ( 
    select * from sales
    where (product_id, year) in (
            select product_id, min(year) year from sales group by product_id )) s
on s.product_id = p.product_id