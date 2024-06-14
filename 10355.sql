SELECT 
    profession,
    COUNT(CASE WHEN birth_month = 1 THEN 1 END) AS Month_1,
    COUNT(CASE WHEN birth_month = 2 THEN 1 END) AS Month_2,
    COUNT(CASE WHEN birth_month = 3 THEN 1 END) AS Month_3,
    COUNT(CASE WHEN birth_month = 4 THEN 1 END) AS Month_4,
    COUNT(CASE WHEN birth_month = 5 THEN 1 END) AS Month_5,
    COUNT(CASE WHEN birth_month = 6 THEN 1 END) AS Month_6,
    COUNT(CASE WHEN birth_month = 7 THEN 1 END) AS Month_7,
    COUNT(CASE WHEN birth_month = 8 THEN 1 END) AS Month_8,
    COUNT(CASE WHEN birth_month = 9 THEN 1 END) AS Month_9,
    COUNT(CASE WHEN birth_month = 10 THEN 1 END) AS Month_10,
    COUNT(CASE WHEN birth_month = 11 THEN 1 END) AS Month_11,
    COUNT(CASE WHEN birth_month = 12 THEN 1 END) AS Month_12
FROM employee_list
GROUP BY profession
ORDER BY profession DESC;