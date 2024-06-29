select h.nationality, sum(a.n_beds) as total_available_beds
from airbnb_apartments a
join airbnb_hosts h on a.host_id = h.host_id
group by h.nationality
order by total_available_beds desc;
