select distinct
    e1.fname,
    e1.lname
from
    employee as e1,
    employee as e2
where
    e1.ssn <> e2.ssn and
    e1.salary = e2.salary and
    e1.dno <> e2.dno
