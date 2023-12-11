create or replace function my_func(x numeric)
returns text as $$
	declare
		msg text;
	begin
		case x
			when 1, 2 then
				msg := 'one or two';
			when 3, 4 then
				msg := 'three or four';
			else
				msg := 'other value';
			end case;
			return msg;
	end;
$$ language plpgsql;

select my_func(0);
select my_func(1);
select my_func(2);
select my_func(3);
select my_func(4);
select my_func(5);
select my_func(6);
