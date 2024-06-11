select 
    l.date_liked,
    count(*)
from 
    likes l
inner join 
    user_posts u on l.post_id = u.post_id
inner join
    friendships f on (f.user_name1 = l.user_name and
    f.user_name2 = u.user_name or f.user_name2 = l.user_name and
    f.user_name1 = u.user_name)
where 
    extract(DOW from l.date_liked) = 5
group by
    l.date_liked