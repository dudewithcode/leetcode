with categories as (
        select 'Low Salary' category 
        from dual
        union 
        select 'Average Salary' 
        from dual
        union 
        select 'High Salary'
        from dual
)
select b.category, nvl(a.accounts_count,0) accounts_count
from (
select 
case when income < 20000 then 'Low Salary'
    when income >= 20000 and income <= 50000 then 'Average Salary'
    else 'High Salary'
end category, count(account_id) accounts_count 
from accounts
group by case when income < 20000 then 'Low Salary'
    when income >= 20000 and income <= 50000 then 'Average Salary'
    else 'High Salary'
end) a
right join categories b on b.category = a.category