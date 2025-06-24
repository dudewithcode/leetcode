/* Write your PL/SQL query statement below */
select distinct num ConsecutiveNums 
from (
select num, lag(num, 1) over (order by id) prev_1, lag(num,2) over (order by id) prev_2
from logs
)
where num = prev_1
and num = prev_2