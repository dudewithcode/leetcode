/* Write your PL/SQL query statement below */
SELECT p.product_name, s.year, s.price
from sales s
LEFT JOIN product p on s.product_id = p.product_id