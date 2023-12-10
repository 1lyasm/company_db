select
    e.fname,
    e.lname
from
    employee as e
where
    e.ssn not in (
        select distinct
            essn
        from
            works_on
    ) and e.salary = (
        select 
            max(salary)
        from
            employee
        where
            employee.dno = e.dno
        group by
            dno
    )
