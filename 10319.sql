with cte as (
    select
        row_number() over (order by to_char(created_at, 'YYYY-MM')) as rownum,
        to_char(created_at, 'YYYY-MM') as year_month,
        sum(value) as value
    from sf_transactions
    group by to_char(created_at, 'YYYY-MM')
)
select 
    c1.year_month,
    case
        when c1.rownum = 1 then null
        else round(((c1.value - c2.value) / c2.value) * 100, 2)
    end as percentage_change
from cte c1
left join cte c2 on c1.rownum = c2.rownum + 1
order by c1.year_month;