/* Write your PL/SQL query statement below */
select
su.user_id,
round(sum(case when cf.action = 'confirmed' then 1 else 0 end) / count(nvl(action,1)),2) confirmation_rate
from signups su
left join confirmations cf on su.user_id = cf.user_id
group by su.user_id
