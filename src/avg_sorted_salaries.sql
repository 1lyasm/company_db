select
    project.pname as proj_name,
    avg(employee.salary) as avg_salary
from
    works_on,
    employee,
    project
where
    works_on.essn = employee.ssn and
    works_on.pno = project.pnumber
group by
    project.pname
order by
    proj_name