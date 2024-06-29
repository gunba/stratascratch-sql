select c.id, c.first_name, sum(o.total_order_cost) as total_order_cost
from customers c
join orders o on c.id = o.cust_id
group by c.id, c.first_name
order by c.first_name;
