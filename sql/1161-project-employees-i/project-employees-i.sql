/* Write your PL/SQL query statement below */
select project_id, round(avg(e.experience_years),2) average_years
from project p
join employee e on p.employee_id = e.employee_id
group by project_id