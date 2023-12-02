select
    dno,
    avg_dep_salary
from
    (
    select
        employee.dno as dno,
        avg(employee.salary) as avg_dep_salary
    from
        employee
    group by
        employee.dno
    )
where
    avg_dep_salary > (
        select
            avg(employee.salary)
        from
            employee
        )
