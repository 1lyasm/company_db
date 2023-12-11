SELECT DISTINCT
	w2.pno
FROM
	works_on w1,
	works_on w2,
	department d,
	employee e
WHERE
	w1.essn = e.ssn and
	e.dno = d.dnumber and
	w1.pno = 1 and
	d.mgrssn = w2.essn


SELECT
	*
FROM
	department

CREATE VIEW
	range_salary_emp
AS
	SELECT
		fname,
		lname,
		salary
	FROM
		employee
	WHERE
		salary between 20000 and 40000

SELECT
	*
FROM
	range_salary_emp

CREATE SEQUENCE
	seq
MINVALUE
	9
MAXVALUE
	99
INCREMENT BY
	1

SELECT
	*
FROM
	seq


SELECT
	nextval('seq')



SELECT
	fname,
	lname
FROM
	employee as e,
	project as p,
	works_on as w
WHERE
	e.ssn = w.essn and
	w.pno = p.pnumber and
	p.pname = 'OperatingSystems'

INTERSECT

SELECT
	fname,
	lname
FROM
	employee e,
	department d
WHERE
	e.dno = d.dnumber and
	d.dname = 'Software'


SELECT
	fname,
	lname
FROM
	employee e
WHERE
	ssn NOT IN (
		SELECT DISTINCT
			superssn
		FROM
			employee
		WHERE
			superssn = e.ssn
	) AND
	ssn NOT IN (
		SELECT DISTINCT
			mgrssn
		FROM
			department
		WHERE
			mgrssn = e.ssn
	)



SELECT
	*
FROM
	employee



SELECT
	dname
FROM
	department
WHERE
	dnumber IN (
		SELECT
			dno
		FROM
			employee
		WHERE
			fname = 'John'
	)



