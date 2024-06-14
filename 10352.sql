with cte as (
    select 
        user_id, 
        date(timestamp),
        max(case when action = 'page_load' then timestamp end) as page_load,
        min(case when action = 'page_exit' then timestamp end) as page_exit
    from facebook_web_log
        group by user_id, date
)

select user_id, avg(page_exit-page_load) as avg_session_time from cte
group by user_id having avg(page_exit-page_load) is not null