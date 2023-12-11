create or replace function min_max_dept_no(out min_dept_no department.dnumber%type,
										   out max_dept_no department.dnumber%type) as $$
	begin
		select
			min(d.dnumber),
			max(d.dnumber) into min_dept_no, max_dept_no
		from
			department as d;
	end;
$$ language plpgsql;

drop function min_max_dept_no();

select min_max_dept_no();

