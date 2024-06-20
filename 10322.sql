select distinct
    user_id
from amazon_transactions u1
where exists 
    (select 1 from amazon_transactions u2
    where u1.user_id = u2.user_id and (u2.created_at >= u1.created_at)
    and u2.created_at - u1.created_at <= 7
    and u2.id != u1.id)
order by user_id asc