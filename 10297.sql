with users as
(
    select 
        id,
        joined_at
    from
        fb_users
    where
        joined_at between '2018-01-01' and '2020-12-31'
),
user_counts as
(
select 
    u.id,
    count(*) as comment_cnt
from 
    fb_comments fc
left join 
    users u 
on 
    u.id = fc.user_id
where
    fc.created_at >= u.joined_at and
    fc.created_at between '2020-01-01' and '2020-01-31'
group by u.id
)
select 
    comment_cnt,
    count(*) as user_cnt
from 
    user_counts
group by 
    comment_cnt
