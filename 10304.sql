with cte as
(
    select
        lp.title,
        lp.budget,
        (
            select 
                ceil(sum(le.salary * ((lp.end_date - lp.start_date) / 365.0)))
            from 
                linkedin_employees le
            where 
                le.id in (
                    select 
                        lep.emp_id 
                    from 
                        linkedin_emp_projects lep 
                    where 
                        lep.project_id = lp.id
                )
        ) as prorated_employee_expense
    from
        linkedin_projects lp
    order by lp.title asc
)
select * from cte where prorated_employee_expense > budget