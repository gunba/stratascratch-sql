SELECT 
    u.user_id AS mutual_friend_id,
    u.user_name AS mutual_friend_name
FROM 
    users u
WHERE 
    EXISTS (
        SELECT 1 
        FROM friends f1 
        WHERE f1.friend_id = u.user_id 
          AND f1.user_id = 1
    )
    AND EXISTS (
        SELECT 1 
        FROM friends f2 
        WHERE f2.friend_id = u.user_id 
          AND f2.user_id = 2
    );
