select
    e.fname,
    e.lname
from
    employee as e
where
    e.salary = (
        select
            avg(emp.salary)
        from
            employee as emp
        where
            emp.dno = e.dno
        group by
            emp.dno
    )
