select 
    r.user_id,
    u.name,
    sum(r.distance) as traveled_distance
from lyft_rides_log r
left join lyft_users u 
on u.id = r.user_id
group by r.user_id, u.name
order by traveled_distance desc
limit 10