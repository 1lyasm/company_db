select
    avg(salary) as avg_salary_8,
    sum(salary) as sum_salary_8
from
    employee as e
where
    e.dno = 8