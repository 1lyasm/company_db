select
    count(employee.ssn) as n_midware_empl,
    avg(employee.salary) as avg_midware_salary
from
    project,
    works_on,
    employee
where
    project.pnumber = works_on.pno and
    works_on.essn = employee.ssn and
    project.pname = 'Middleware'