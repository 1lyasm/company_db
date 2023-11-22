select
    employee.fname as fname,
    employee.lname as lname
from
    works_on, employee
where
    works_on.essn = employee.ssn
group by
    works_on.essn, employee.ssn
having
    count(works_on.pno) > 1
order by
    works_on.essn