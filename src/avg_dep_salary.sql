create or replace function comp_avg_salary(dept_name department.dname%type)
returns real as $$
	declare
		avg_salary numeric;
	begin
		select
			avg(e.salary) into avg_salary
		from
			employee as e,
			department as d
		where
			e.dno = d.dnumber and
			d.dname = dept_name;
		return avg_salary;
	end;
$$ language plpgsql;

drop function comp_avg_salary(department.dname%type);

select comp_avg_salary('Hardware');

select * from department;

