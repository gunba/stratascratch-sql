with cte as 
(select 
    distance_to_travel/monetary_cost as distance_per_dollar,
    to_char(request_date, 'yyyy-mm') as year_month
from uber_request_logs
),
cte2 as (
select 
    year_month, 
    avg(distance_per_dollar) as distance_per_dollar
from cte
group by year_month)
select 
    cte.year_month,
    round(avg(abs(cte.distance_per_dollar - cte2.distance_per_dollar)::numeric), 2) as difference
from cte
left join cte2
on cte.year_month = cte2.year_month
group by cte.year_month
order by cte.year_month