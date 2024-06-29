with valid_confirmations as (
    select phone_number, date
    from fb_confirmers
),

filtered_sms_sends as (
    select ds, phone_number, type
    from fb_sms_sends
    where type = 'message' and ds = '2020-08-04'
),

total_sms_sent as (
    select count(*) as total_sent
    from filtered_sms_sends
),

confirmed_sms as (
    select count(*) as total_confirmed
    from filtered_sms_sends fss
    join valid_confirmations vc
    on fss.phone_number = vc.phone_number and fss.ds = vc.date
)

select 
    (total_confirmed::float / total_sent::float) * 100 as perc
from 
    total_sms_sent, confirmed_sms;
