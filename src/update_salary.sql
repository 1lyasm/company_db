create or replace function update_salary() returns void as $$
	declare
		n_worker numeric := 0;
	begin
		select
			count(*) into n_worker
		from
			employee
		where
			dno = 6;
		if (n_worker < 10) then
			update
				employee
			set
				salary = salary * 1.1
			where
				dno = 6;
		end if;
	end;
$$ language plpgsql;
create or replace function update_salary() returns void as $$
	declare
		n_worker numeric := 0;
	begin
		select
			count(*) into n_worker
		from
			employee
		where
			dno = 6;
		if (n_worker < 10) then
			update
				employee
			set
				salary = salary * 1.1
			where
				dno = 6;
		end if;
	end;
$$ language plpgsql;

