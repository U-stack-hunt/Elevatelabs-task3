-- 1.creating database --
create database assignment1;
-- 2.creating employee table --
create table assignment1.employee (`id` int(10) primary key,`name` varchar(45),`city` varchar(45) ,`department` varchar(50), `salary` int(10));
-- inserting rows--
insert into assignment1.employee (`id`,`name`,`city`,`department`,`salary`) values (1, 'David', 'London', 'IT', 80000), (2, 'Emily', 'London', 'IT', 70000), (3, 'Peter', 'Paris', 'IT', 60000), (4, 'Ava', 'Paris', 'IT', 50000), (5, 'Penny', 'London', 'Management', 11000), (6, 'Jim', 'London', 'Management*', 90000), (7, 'Amy', 'Rome', 'Support', 30000), (8, 'Cloe', 'London', 'IT', 110000);
-- 3.creating department table --
create table assignment1.department (`id` int(10) primary key,`name` varchar(30));
insert into assignment1.department (`id`,`name`) values (1,'IT'),(2,'Management'),(3,'IT'),(4,'Support');
-- 4.creating company table --
create table assignment1.company (`id` int(10) primary key,`name` varchar(30),`revenue` int(10));
insert into assignment1.company (`id`,`name`,`revenue`) values (1, 'IBM', 2000000),(2, 'GOOGLE', 9000000), (3, 'Apple', 10000000);
-- 5.query all rows from dept table--
select * from department;
-- 6.change name of department --
update department
set name = 'management'
where id = 1;
-- 7.delete employees with sal < 100000 --
delete  from employee
where salary > 100000;
-- 8.query names of company --
select name from company;
-- 9.query name and city of every employee --
select name,city from employee;
-- 10.query all companies with revenue greater than 5000000 --
select name from company
where revenue > 5000000;
-- 11.query all companies with revenue smaller than 5000000 --
select name from company
where revenue < 5000000;
-- 12.Query all companies with revenue smaller than 5 000 000, but you cannot use the '<' operator --
select name from company
where not revenue >= 5000000;
-- 13.Query all employees with salary greater than 50 000 and smaller than 70 000 --
select name from employee
where salary between 50000 and 70000;
-- 14.Query all employees with salary greater than 50 000 and smaller than 70000, but you cannot use BETWEEN --
SELECT name FROM employee
WHERE salary > 50000 AND salary < 70000;
-- 15. Query all employees with salary equal to 80 000 --
select name from employee
where salary = 80000;
-- 16. Query all employees with salary not equal to 80 000 --
SELECT name FROM employee
WHERE salary != 80000;
-- 17. Query all names of employees with salary greater than 70 000 together with employees who workon the 'IT' department--
SELECT name FROM employee
WHERE salary > 70000
AND department = 'IT';
-- 18. Query all employees that work in city that starts with 'L'--
SELECT * FROM employee
WHERE City LIKE 'l%';
-- 19. Query all employees that work in city that starts with 'L' or ends with 's'--
select * from employee
where city like 'l%'
or city like '%s';
-- 20. Query all employees that work in city with 'o' somewhere in the middle--
SELECT * FROM employee
WHERE city LIKE '%o%';
-- 21. Query all departments (each name only once) --
SELECT DISTINCT department FROM employee;
-- 22. Query names of all employees together with id of department they work in, but you cannot use JOIN--
SELECT employee.name, 
       (SELECT id 
        FROM department 
        WHERE department.id = employee.id) AS id
FROM employee;
-- 23. Query names of all employees together with id of department they work in,using JOIN --
SELECT employee.name, department.id
FROM employee
JOIN department ON employee.id = department.id;
-- 24. Query name of every company together with every department Personal thoughts: It is kind a weird question, as there is no relationship between company anddepartment--
SELECT company.name AS company_name, department.name AS department_name
FROM company
CROSS JOIN department;
-- 25. Query name of every company together with departments without the 'Support' department --
SELECT company.name, department.name
FROM company
JOIN department ON company.id = department.id
WHERE department.name != 'Support';
-- 26. Query employee name together with the department name that they are not working in --
SELECT employee.name, department.name
FROM employee
CROSS JOIN department
WHERE employee.id != department.id;
-- 27. Query company name together with other companies names LIKE: GOOGLE Apple GOOGLE IBM Apple IBM --
SELECT c1.name AS company_1, c2.name AS company_2
FROM company c1
JOIN company c2
ON c1.name < c2.name;
-- 28. Query names of every company and change the name of column to 'Company' --
SELECT name AS Companyy
FROM company;
-- 29. Query all employees that work in same department as Peter --
select name from employee
where name = 'peter' 







