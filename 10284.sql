with all_relations as (
    select * from (
        (select user1, user2 from facebook_friends) union 
        (select user2, user1 from facebook_friends) 
    ) users_relations
)
select user1, 
    (cast(count(user2) as float) / (select count(*) from facebook_friends)) * 100 as popularity_percent
from all_relations
group by user1
order by user1;
