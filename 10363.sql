SELECT week, sum(quantity) as quantity
FROM orders_analysis
WHERE EXTRACT(YEAR FROM week) = 2023
  AND EXTRACT(QUARTER FROM week) = 1
GROUP BY week