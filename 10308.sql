with cte as
(
    select
        dbe.salary, dbd.department
    from 
        db_employee dbe
    left join 
        db_dept dbd
    on 
        dbe.department_id = dbd.id
    where
        dbd.department in ('marketing', 'engineering')
)
select 
    abs(
        (select max(salary) from cte where department = 'marketing') - 
        (select max(salary) from cte where department = 'engineering')
    ) as salary_difference;
