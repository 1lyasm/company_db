select
    dno as dno,
    avg(salary) as avg_salary
from
    employee
group by
    dno
having
    avg(salary) > 40000 and
    dno <> 5
limit
    3
offset
    1