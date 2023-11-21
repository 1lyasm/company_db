select
	count(*) as n_sales_empl, 
	sum(salary) as sum_sales_salary,
	max(salary) as max_sales_salary,
	min(salary) as min_sales_salary,
	avg(salary) as avg_sales_salary
from
	department as d,
	employee as e
where
	d.dname = 'Sales' and
	d.dnumber = e.dno
