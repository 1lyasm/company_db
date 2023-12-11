create or replace function my_add(num_1 numeric, num_2 numeric)
returns numeric as $$
	declare
		sum_ numeric;
	begin
		sum_ = num_1 + num_2;
		return sum_;
	end;
$$ language plpgsql;

select my_add(22, 63);
