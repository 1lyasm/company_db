select
    employee.dno,
    count(employee.ssn)
from
    employee
group by
    employee.dno
having
    count(employee.ssn) % 2 = 1
