select
    d.dname
from
    employee as e,
    department as d
where
    d.dnumber = e.dno
group by
    d.dnumber
having
    max(e.salary) - min(e.salary) > 20000