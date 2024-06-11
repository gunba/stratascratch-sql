SELECT user_count, concat(start_timestamp, ' to ', end_timestamp), device_type
FROM user_activity u
WHERE (SELECT COUNT(*) 
     FROM user_activity u2
     WHERE u.device_type = u2.device_type 
     AND u.user_count < u2.user_count) = 0
ORDER BY device_type ASC;
