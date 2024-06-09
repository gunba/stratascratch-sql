SELECT  DISTINCT
    *
FROM 
    customer_feedback
WHERE
    source_channel = 'social_media' and
    comment_category != 'short_comments'
    