SELECT 
    user_id,
    (sum(coalesce(listen_duration))/60)::int as total_listen_duration,
    count(distinct song_id) as unique_song_count
FROM 
    listening_habits
group by 1 order by 1
    