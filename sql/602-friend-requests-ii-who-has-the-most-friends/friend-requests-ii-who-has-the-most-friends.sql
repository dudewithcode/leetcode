/* Write your PL/SQL query statement below */
with cte as (
select requester_id as id
from RequestAccepted
union all
select accepter_id as id
from RequestAccepted
)

select id, num
from (select id, count(*) num
from cte
group by id
order by 2 desc)
where rownum = 1