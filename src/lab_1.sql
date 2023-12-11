-- ddl commands

create database lab1;

create table student(
	student_no int not null primary key,
	firstName varchar(20) not null,
	lastName varchar(20) not null,
	address varchar(255)
);

-- drop table student;

alter table student rename to stud;

alter table stud rename to student;

ALTER TABLE
	student
ADD
	birthday char(4);

ALTER TABLE
	student
DROP
	birthday;

SELECT
	*
FROM
	student;

ALTER TABLE
	student
RENAME
	student_no
TO
	stdNo;

-- dml commands
SELECT
	*
FROM
	student;

INSERT INTO
	student
VALUES
	(134, 'Tommy', 'Shelby');

INSERT INTO
	student(stdNo, firstName, lastName)
VALUES
	(135, 'Arthur', 'Shelby');

DELETE FROM
	student
WHERE
	stdNo = 134;

UPDATE
	student
SET
	firstName = 'Tommy'
WHERE
	stdno = 135;

-- delete records with names Ali from student table
DELETE FROM
	student
WHERE
	firstname = 'Ali';

INSERT INTO
	student
VALUES
	(136, 'Ali', 'Shelby');

-- rename address column of student to 'sehir'
ALTER TABLE
	student
RENAME
	address
TO
	sehir;

SELECT * FROM student;

-- only return firstname and lastname columns of student
SELECT
	firstname,
	lastname
FROM
	student

INSERT INTO
	student
VALUES
	(137, 'Ayse', 'Shelby');

-- return all columns about student names 'Ayse'
SELECT
	*
FROM
	student
WHERE
	firstname = 'Ayse';

INSERT INTO
	student
VALUES
	(138, 'John', 'Sherlby');

SELECT * FROM student;

-- list people with 'r' in their lastnames
SELECT
	*
FROM
	student
WHERE
	lastname like '%r%';

-- list students with numbers between 104 and 289
SELECT
	*
FROM
	student
WHERE
	stdno BETWEEN 104 AND 289;

