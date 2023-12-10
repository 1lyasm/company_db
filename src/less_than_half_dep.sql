select
    e.dno
from
    employee as e
group by
    e.dno
having
    count(e.ssn) < 0.5 * 
        (
        select count(*) from
            (
            select
                w.essn,
                count(w.pno)
            from
                works_on as w
            group by
                w.essn
            having
                count(w.pno) > 1
            )
        )