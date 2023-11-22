select
    fname,
    lname,
    salary
from
    employee
where
    salary > (
        select
            avg(salary)
        from
            employee
    )
order by
    salary