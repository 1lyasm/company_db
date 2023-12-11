do $$
	begin
		for i in 0..10
			loop
				raise notice 'i: %', i;
			end loop;
	end;
$$;

do $$
	begin
		for i in reverse 10..0
			loop
				raise notice 'i: %', i;
			end loop;
	end;
$$;

do $$
	begin
		for i in reverse 10..0 by 2
			loop
				raise notice 'i: %', i;
			end loop;
	end;
$$;
