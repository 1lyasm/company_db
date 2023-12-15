CREATE OR REPLACE FUNCTION get_emp_names(dept_no INTEGER)
	RETURNS VOID AS $$
	DECLARE
		emp_names CURSOR FOR
			SELECT
				fname, lname
			FROM
				employee
			WHERE
				dno = dept_no;
	BEGIN
		FOR i IN emp_names LOOP
			RAISE NOTICE '%, %', i.fname, i.lname;
		END LOOP;
	END;
$$ LANGUAGE 'plpgsql';

SELECT get_emp_names(8);

drop function avg_salaries(integer);

create or replace function avg_salaries(dept_no INTEGER)
	returns NUMERIC as $$
	declare
		salaries cursor for
			select
				salary
			from
				employee
			where
				dno = dept_no;
		n_salary INTEGER := (
			select
				count(*)
			from
				employee
			where
				dno = dept_no
		);
		s NUMERIC := 0;
	begin
		for i in salaries loop
			s = s + i.salary;
		end loop;
		return s / n_salary;
	end;
$$ language 'plpgsql';

select avg_salaries(5);

create or replace function sum_salaries(dept_no INTEGER)
	returns NUMERIC as $$
	declare
		salaries cursor for
			select
				salary
			from
				employee
			where
				dno = dept_no;
		s NUMERIC := 0;
	begin
		for i in salaries loop
			s = s + i.salary;
		end loop;
		return s;
	end;
$$ language 'plpgsql';

select sum_salaries(5);

create or replace function sum_salaries_out(dept_no integer, out s numeric)
	returns numeric as $$
	declare
		salaries cursor for
			select
				salary
			from
				employee
			where
				dno = dept_no;
	begin
		s := 0;
		for i in salaries loop
			s = s + i.salary;
		end loop;
	end;
$$ language 'plpgsql';

select sum_salaries_out(5);

drop function total_hours(numeric);

create or replace function total_hours(inp_ssn works_on.essn%type)
	returns numeric as $$
	begin
		return (
			select
				sum(hours)
			from
				works_on as w
			where
				essn = inp_ssn
			group by
				essn
		);
	end;
$$ language 'plpgsql';

select * from works_on;

select total_hours('123456789');

create or replace function avg_salary(dept_no integer)
	returns numeric as $$
	declare
		s numeric := 0;
		n numeric := 0;
		salaries cursor for
			select
				salary
			from
				employee
			where
				dno = dept_no;
		avg_ numeric;
	begin
		for i in salaries loop
			s = s + i.salary;
			n = n + 1;
		end loop;
		if n > 0 then
			avg_ = s / n;
		else
			avg_ = null;
		end if;
		return avg_;
	end;
$$ language 'plpgsql';

select avg_salary(4);
select avg_salary(-1);

drop function hottest_proj();

create or replace function hottest_proj()
returns project.pname%type as $$
	declare
		proj_h cursor for
			select
				sum(hours) as sum_h,
				pname
			from
				works_on, project
			where
				pno = pnumber
			group by
				pnumber;
		max_h numeric := -1;
		pname project.pname%type;
	begin
		for i in proj_h loop
			if i.sum_h > max_h then
				max_h = i.sum_h;
				pname = i.pname;
			end if;
		end loop;
		return pname;
	end;
$$ language 'plpgsql';

select hottest_proj();

drop type empl_info;

create type empl_info as (fname text, lname text, 
						 salary numeric);
						 
drop function retrieve(numeric, numeric);

create or replace function retrieve(proj_no numeric, base_salary numeric)
returns void as $$
	declare
		infos empl_info[];
		infos_curs cursor for
			select distinct
				e.fname,
				e.lname,
				e.salary
			from
				employee e,
				works_on w
			where
				e.ssn = w.essn and
				e.salary > base_salary and
				proj_no = w.pno;
	begin
		for i in infos_curs loop
			raise notice '% % %', i.fname, i.lname, i.salary;
		end loop;
	end;
$$ language 'plpgsql';

select retrieve(3, 0);

select * from works_on;
select * from employee;

create or replace function retrieve_2(proj_no numeric, base_salary numeric)
returns empl_info[] as $$
	declare
		infos empl_info[];
		infos_curs cursor for
			select distinct
				e.fname,
				e.lname,
				e.salary
			from
				employee e,
				works_on w
			where
				e.ssn = w.essn and
				e.salary > base_salary and
				proj_no = w.pno;
		i numeric := 0;
	begin
		for info_ in infos_curs loop
			infos[i] = info_;
			i = i + 1;
		end loop;
		return infos;
	end;
$$ language 'plpgsql';

select retrieve_2(1, 10000);

create or replace function print_dep_emps(dept_no numeric)
returns void as $$
	declare
		emps cursor for
			select
				fname,
				lname
			from
				employee
			where
				dno = dept_no;
	begin
		for i in emps loop
			raise info '% %', i.fname, i.lname;
		end loop;
	end;
$$ language 'plpgsql';

select print_dep_emps(8);
