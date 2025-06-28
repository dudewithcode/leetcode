/* Write your PL/SQL query statement below */
select 
case 
    when (lead(id,1,0) over(order by id) = 0 and mod(id, 2) != 0)  then id
    when mod(id, 2) != 0 then id + 1
    else id - 1
end id, student
from seat
order by id