create or replace function incr_salary(dep_name text, high_limit numeric,
									   low_limit numeric, incr_percent numeric)
returns void as $$
	declare
		avg_salary numeric;
		female_sum numeric;
	begin
		select
			avg(salary) into avg_salary
		from
			employee as e,
			department as d
		where
			e.dno = d.dnumber and
			d.dname = dep_name;
		select
			sum(salary) into female_sum
		from
			employee as e,
			department as d
		where
			e.dno = d.dnumber and
			d.dname = dep_name and
			e.sex = 'F';
		if avg_salary < high_limit and female_sum > low_limit then
			update
				employee as e
			set
				salary = salary * incr_percent
			where
				ssn in (
					select
						w.essn
					from
						employee as e,
						works_on as w,
						department as d
					where
						e.ssn = w.essn and
						e.dno = d.dnumber and
						d.dname = dep_name
					group by
						w.essn
					having
						count(*) > 1
				);
		end if;
	end;
$$ language plpgsql;

select incr_salary('Research', 50000, 20000, 5);
