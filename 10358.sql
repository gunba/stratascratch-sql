with cte as (select 
    extract(week from date) as week, 
    avg(amount_spent) as mean_amount
from user_purchases 
where day_name = 'Friday'
group by date),
numbers as (
    select generate_series(1, 13) AS week
)
SELECT 
    n.week,
    coalesce(c.mean_amount, 0)
FROM 
    numbers n
LEFT JOIN
    cte c
ON n.week = c.week