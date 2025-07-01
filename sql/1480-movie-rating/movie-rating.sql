/* Write your PL/SQL query statement below */
select results
from (select name results
from movierating a
inner join users b on b.user_id = a.user_id
group by name
order by count(movie_id) desc, name)
where rownum = 1
union all
select results
from (select title results
from movierating a
inner join movies b on b.movie_id = a.movie_id
where created_at >= to_date('01-FEB-2020', 'DD-MM-YYYY')
and created_at < to_date('01-MAR-2020', 'DD-MM-YYYY')
group by title
order by avg(rating) desc, title)
where rownum = 1