/* Write your PL/SQL query statement below */
select name, bonus
from employee e
left join bonus b on e.empid = b.empid
where bonus < 1000
or bonus is null
