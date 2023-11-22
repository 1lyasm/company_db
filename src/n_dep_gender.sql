select
    dno,
    sex,
    count(*),
    avg(salary)
from
    employee
group by
    dno,
    sex
