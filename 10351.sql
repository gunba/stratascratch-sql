select
    from_user, 
    count(from_user) as total_emails,
    row_number() over (order by count(from_user) desc, from_user asc) as rownum
from google_gmail_emails 
group by from_user
order by rownum


