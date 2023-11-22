select
    dno,
    avg(salary) as avg_salary
from
    employee
group by
    dno
having
    avg(salary) > 50000
order by
    avg_salary