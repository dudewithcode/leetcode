/* Write your PL/SQL query statement below */
with products_1 as (
select product_id,
new_price price,
change_date
from products
where change_date <= to_date('2019-08-16', 'YYYY-MM-DD')
),
distinct_products as (
select distinct product_id
from products),
initial_price as (
select product_id, price
from(
select product_id, price, change_date,
    rank() over(partition by product_id order by change_date desc) rank
from products_1
)
where rank = 1
)

select d.product_id, nvl(i.price, 10) price
from distinct_products d
 left join initial_price i on i.product_id = d.product_id