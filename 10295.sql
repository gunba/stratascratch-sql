select username, sum(msg_count) as total_msg_count
from (
    select user1 as username, msg_count
    from fb_messages
    union all
    select user2 as username, msg_count
    from fb_messages
) combined
group by username
order by total_msg_count desc
limit 10;
