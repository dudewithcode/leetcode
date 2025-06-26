/* Write your PL/SQL query statement below */
with cum_queue as (
    select 
        person_name, 
        sum(weight) over(order by turn asc) cum_weight
    from queue),
fil_queue as (
        select person_name, cum_weight
    from cum_queue
    where cum_weight <= 1000
)

select 
    distinct first_value(person_name) over(order by cum_weight desc) person_name
from fil_queue