select distinct song_name 
from billboard_top_100_year_end 
where year_rank = 1 
and year >= extract(year from current_date) - 20;
