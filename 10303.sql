with cte as
(
    select
        state,
        percentile_cont(0.95) within group (order by fraud_score) as percentile_95
    from 
        fraud_score
    group by 
        state 
)
select * from fraud_score fs
where fs.fraud_score >= (select c.percentile_95 from cte c where c.state = fs.state)
