/* Write your PL/SQL query statement below */
select employee_id, department_id
from (
select employee_id, department_id, primary_flag ,
rank() over ( partition by employee_id order by primary_flag  desc) as rank
from employee e
group by employee_id, department_id, primary_flag )
where rank = 1
