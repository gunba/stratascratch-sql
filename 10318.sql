select
    c1.company_name,
    (select count(c2.company_name) from car_launches c2 where c2.year = 2020 and c2.company_name = c1.company_name) - (select count(c3.company_name) from car_launches c3 where year = 2019 and c3.company_name = c1.company_name) as net_products
from 
    car_launches c1
group by c1.company_name
order by c1.company_name
