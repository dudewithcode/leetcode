/* Write your PL/SQL query statement below */
select m.name
from employee m
join employee e on  m.id = e.managerid
group by m.id, m.name
having count(e.id) >= 5

