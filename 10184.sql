select noc, min(year) as first_year
from olympics_athletes_events
group by noc
order by first_year, noc;
