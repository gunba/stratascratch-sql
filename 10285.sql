with requests_sent as (
    select date, count(*) as total_sent
    from fb_friend_requests
    where action = 'sent'
    group by date
),

requests_accepted as (
    select fr.date, count(*) as total_accepted
    from fb_friend_requests fr
    join fb_friend_requests fa
    on fr.user_id_sender = fa.user_id_sender and fr.user_id_receiver = fa.user_id_receiver
    where fr.action = 'sent' and fa.action = 'accepted'
    group by fr.date
)

select 
    rs.date,
    round(coalesce(ra.total_accepted, 0)::numeric / rs.total_sent::numeric, 3) as percentage_acceptance
from 
    requests_sent rs
left join 
    requests_accepted ra
on 
    rs.date = ra.date
order by 
    rs.date;
