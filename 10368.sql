WITH summary AS (
    SELECT
        city,
        country,
        round(population / area) AS density
    FROM 
        cities_population
    WHERE
        area > 0
)
SELECT
    city,
    country,
    density
FROM 
    summary
WHERE
    density = (SELECT MAX(density) FROM summary)
    OR density = (SELECT MIN(density) FROM summary);
