select
    avg(salary),
    sum(salary)
from
    employee as e
where
    e.dno = 8