SELECT 
    f.flight_id,
    m.movie_id,
    m.duration as movie_duration
FROM 
    flight_schedule f,
    entertainment_catalog m
WHERE 
    f.flight_duration > m.duration and
    f.flight_id = 101