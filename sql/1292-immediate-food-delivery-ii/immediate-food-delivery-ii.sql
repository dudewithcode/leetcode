/* Write your PL/SQL query statement below */
select 
round((sum(
    case 
        when a.order_date = b.customer_pref_delivery_date then 1
        else 0
    end) / count(1)) * 100, 2) immediate_percentage
from (select customer_id, min(order_date) order_date from delivery
group by customer_id) a
join delivery b on a.customer_id = b.customer_id
and a.order_date = b.order_date