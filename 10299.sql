select id, first_name, last_name, max(salary), department_id
from ms_employee_salary
group by id, first_name, last_name, department_id
order by id asc