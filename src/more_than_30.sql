select
    p.pname
from
    project as p,
    works_on as w
where
    p.pnumber = w.pno
group by
    p.pnumber
having
    avg(w.hours) > 30
order by
    p.pname