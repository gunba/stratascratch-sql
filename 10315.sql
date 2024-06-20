with cte1 as
(
    select 
        avg(mkt_price) as avg_price
    from 
        zillow_transactions
),
cte2 as (
    select 
        city, 
        avg(mkt_price) as avg_price
    from 
        zillow_transactions
    group by city
)
select 
    city
from 
    cte1 c1, cte2 c2
where
    c1.avg_price < c2.avg_price