select
    fname,
    lname
from
    employee
where
    salary = (
        select
            max(salary)
        from
            employee
    )
