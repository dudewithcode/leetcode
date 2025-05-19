/* Write your PL/SQL query statement below */
select to_char(activity_date, 'YYYY-MM-DD') day, count(distinct user_id) active_users
from activity
where activity_date between (to_date('2019-07-27', 'YYYY-MM-DD') - INTERVAL '29' DAY)
and to_date('2019-07-27', 'YYYY-MM-DD')
group by to_char(activity_date, 'YYYY-MM-DD')
order by 1
