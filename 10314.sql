with cte as
(
    select
        row_number() over (order by to_char(created_at, 'yyyy-mm')) as rownum,
        to_char(created_at, 'yyyy-mm') as month,
        sum(purchase_amt) as revenue
    from 
        amazon_purchases
    where 
        purchase_amt > 0
    group by 
        to_char(created_at, 'yyyy-mm')
)
select 
    a.month,
    (
        select avg(c.revenue)
        from cte c
        where c.rownum between a.rownum - 2 and a.rownum
    ) as avg_revenue
from 
    cte a
order by 
    a.rownum;
