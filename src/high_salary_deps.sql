select
    dno
from
    employee
group by
    dno
having
    avg(salary) > 40000