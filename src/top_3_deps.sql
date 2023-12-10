select
    d.dnumber,
    d.dname,
    sum(e.salary)
from
    department as d,
    employee as e
where
    d.dnumber = e.dno
group by
    d.dnumber
order by
    sum(e.salary) desc
limit
    3
