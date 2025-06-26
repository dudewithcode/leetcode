/* Write your PL/SQL query statement below */
with categories as (
select 'Low Salary' category
from dual
union
select 'Average Salary'
from dual
union
select 'High Salary'
from dual
),
cat_accounts as (
select account_id,
    case 
    when income < 20000 then 'Low Salary'
    when income > 50000 then 'High Salary'
    else 'Average Salary'
    end category
from accounts)

select b.category, nvl(count(a.account_id),0) accounts_count 
from cat_accounts a
right join categories b on a.category = b.category
group by b.category