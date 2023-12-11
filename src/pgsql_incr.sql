create or replace function incr(num numeric)
returns numeric as $$
	begin
		return num + 1;
	end;

$$ language plpgsql;

select incr(5);
select incr(-1);
select incr(8);
