select
    w.pno
from
    works_on as w,
    employee as e
where
    w.essn = e.ssn
group by
    w.pno
having
    avg(e.salary) > (
        select
            max(e.salary)
        from
            employee as e
        where
            e.dno = 4
    )
