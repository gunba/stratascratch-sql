with cte as (
    select 
        mud.user_id, mud.acc_id,
        mad.paying_customer,
        mdf.date, mdf.downloads
    from ms_user_dimension mud
    left join ms_acc_dimension mad on mud.acc_id = mad.acc_id
    left join ms_download_facts mdf on mud.user_id = mdf.user_id
)
select 
    c1.date,
    sum(case when c1.paying_customer = 'no' then c1.downloads else 0 end) as non_paying,
    sum(case when c1.paying_customer = 'yes' then c1.downloads else 0 end) as paying
from cte c1
group by c1.date
having sum(case when c1.paying_customer = 'no' then c1.downloads else 0 end) > sum(case when c1.paying_customer = 'yes' then c1.downloads else 0 end);
