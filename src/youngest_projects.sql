select
    works_on.pno as youngest_projects
from
    employee,
    works_on
where
    employee.ssn = works_on.essn and
    employee.bdate = (
        select
            max(employee.bdate)
        from
            employee
    )