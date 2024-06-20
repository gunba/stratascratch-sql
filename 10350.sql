--select * from fb_search_events;
--clicked 0 = 1
--clicked 1 and search_results_position >3 = 2
--clicked 1 and search_results_position <=3 = 3

with cte as 
    (select
        search_id,
        case
            when clicked = 0 then 1
            when clicked = 1 and search_results_position > 3 then 2
            when clicked = 1 and search_results_position <= 3 then 3
            else NULL
        end as rating
    from fb_search_Events
    )
select 
    search_id,
    max(rating)
from cte
group by search_id