/* Write your PL/SQL query statement below */
select m.employee_id, m.name, count(*) reports_count, round(avg(e.age)) average_age 
from employees e
join employees m on e.reports_to = m.employee_id
group by m.employee_id, m.name
order by 1
