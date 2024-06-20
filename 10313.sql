with cte as (
    select
        to_char(request_date, 'yyyy-mm') as month,
        sum(distance_to_travel) as sum_dist,
        sum(monetary_cost) as sum_cost,
        sum(distance_to_travel) / sum(monetary_cost) as distance_per_dollar
    from 
        uber_request_logs
    group by
        to_char(request_date, 'yyyy-mm')
),

forecasted_data as (
    select
        month,
        distance_per_dollar,
        lag(distance_per_dollar) over (order by month) as forecasted_distance_per_dollar
    from
        cte
),

squared_errors as (
    select 
        month,
        distance_per_dollar,
        forecasted_distance_per_dollar,
        power(distance_per_dollar - forecasted_distance_per_dollar, 2) as squared_error
    from 
        forecasted_data
    where 
        forecasted_distance_per_dollar is not null
)

select round(sqrt(avg(squared_error))::numeric, 2) as rmse from squared_errors;
