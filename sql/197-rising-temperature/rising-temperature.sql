/* Write your PL/SQL query statement below */
select c.id
from weather c
join weather p on c.recordDate = (p.recorddate + 1)
and c.temperature > p.temperature