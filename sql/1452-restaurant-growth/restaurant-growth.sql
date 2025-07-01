/* Write your PL/SQL query statement below */
with cte as (
    select visited_on, sum(amount) amount
    from customer
    group by visited_on
),
rolling as 
(select
visited_on,
sum(amount) over ( order by visited_on rows 6 PRECEDING ) amount,
round(avg(amount) over ( order by visited_on asc rows 6 PRECEDING ), 2) average_amount,
rank() over ( order by visited_on) rank
from cte
)
select to_char(visited_on, 'yyyy-mm-dd') visited_on, amount, average_amount
from rolling
where rank > 6