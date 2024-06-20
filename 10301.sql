with project_counts as (
    select 
        mep.project_id, 
        count(*) as emp_count
    from 
        ms_emp_projects mep
    group by 
        mep.project_id
)
select 
    mp.title,
    ceil(budget * 1.0 / pc.emp_count) as budget_per_employee
from 
    ms_projects mp
join 
    project_counts pc on mp.id = pc.project_id
where 
    pc.emp_count > 0
order by 
    budget_per_employee desc
