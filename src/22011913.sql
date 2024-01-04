--BLM3041 Veritabanı Yönetimi 3.Quizi -- 04.01.2024 -- A GRUBU --- SÜRE: 70 dk + 5dk forma cevap yükleme
--Öğrenci No: 22011913
--Ad: Ilyas          Soyad: Mustafazade

--SORULAR
--1)Kişinin adını, doğum tarihini ve çalıştığı departmanın adını tutan bir record tanımı yazınız. (10 puan)

-- create or replace record;

--2)Her bir projede kaç kişinin çalıştığını proje isimlerine göre listeleyiniz. Kişi sayısının 1 ve 1’den az olduğu projeleri dâhil etmeyiniz. (15 puan)

-- select * from works_on;
-- select * from project;

select distinct p.pname pname, count(e.ssn) empl_count from employee e, works_on w, project p where e.ssn = w.essn and p.pnumber = w.pno
group by p.pnumber having count(w.essn) > 1 order by p.pname;

--3)En yakın zamanda departman yöneticisi olan kişinin adını ve soyadını bulan sorguyu yazınız. (15 puan)

-- select * from department;
-- select * from employee;

select e.fname fname, e.lname lname from employee e, department d where d.mgrssn = e.ssn
order by d.mgrstartdate desc limit 1;


--4)62 numaralı projede çalışanların ortalama çalışma saatleri 35 saatten fazla
-- ise o projenin yürütüldüğü departman çalışanların maaşına 5000 zam yapan fonksiyonu yazınız ve fonksiyonu çağırınız.  (20 puan)

-- select * from works_on;
select * from employee;

create or replace function increase_salary() returns void as $$
	declare
		avg_salary numeric;
		dept_no numeric;
	begin
		select avg(w.hours) into avg_salary from works_on w where w.pno = 62;
-- 		raise notice 'avg_salary: %', avg_salary;
		select p.dnum into dept_no from project p where p.pnumber = 62;
-- 		raise notice 'dept_no: %', dept_no;
		if avg_salary > 35 then
			update employee set salary = salary + 5000 where dno = dept_no;
		end if;
	end;
$$ language 'plpgsql';

select increase_salary();

--5)Yeni bir proje eklendiği zaman toplam çalışma süresi en az olan ilk çalışanı o projeye atayan triggerı ve fonksiyonunu yazınız.
-- Çalışanın bu projede çalışma süresini 10 saat olarak belirleyiniz.
-- Triggerin tetiklenmesini sağlayan SQL ifadesini de yazınız. (20 puan)

create or replace function assign() returns trigger as $$
 	declare
		least_empl works_on.essn%type;
	begin
--         update items
--         set n_sold = n_sold + new.n
--         where items.id = new.item_id;
		select w.essn into least_empl from works_on w order by w.hours limit 1;
		raise notice 'least_empl: %', least_empl;
		insert into works_on values(least_empl, new.pnumber, 10);
		return new;
    end;
$$ language 'plpgsql';

create or replace trigger trigger_1 after insert on public.project for each row execute function public.assign();

insert into project values('New project', 93, 'Baku', 8);

-- select * from works_on;

--6)Yeni bir proje eklenmek istendiğinde yeni eklenecek olan projenin adı hali hazırda mevcutsa ekrana uyarı mesajı yazdıran triggerı ve fonksiyonunu yazınız.
-- Tablodaki birden fazla değeri cursor kullanarak alınız. (20 Puan)
