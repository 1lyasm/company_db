create or replace function my_add(num_1 numeric, num_2 numeric, out sum_ numeric) as $$
	declare
	begin
		sum_ = num_1 + num_2;
	end;
$$ language plpgsql;

select my_add(22, 63);
