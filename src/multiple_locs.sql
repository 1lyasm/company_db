select
    e.ssn,
    e.fname,
    e.lname,
    count(p.plocation)
from
    employee as e,
    works_on as w,
    project as p
where
    e.ssn = w.essn and
    p.pnumber = w.pno
group by
    e.ssn
having
    count(p.plocation) > 1