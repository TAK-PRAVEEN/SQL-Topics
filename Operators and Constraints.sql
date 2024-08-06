use mavenmovies;

-- operators

-- Arithmatic opertors -> -, +, -, *, /, %
select * from payment;
select amount as original_amount, amount * 2, payment_date from payment;
select amount, amount % 2 from payment; -- remainder
select amount, amount / 2 from payment;
select amount, amount - 2 as updated_amount from payment where amount < 5.99 and amount > 3.99;


-- Comparison operators -> =, !=, >, <, >=, <=
select * from film;
select * from film where replacement_cost > 28.99;
select * from film where rating = 'PG' and replacement_cost = 20.99;

-- Logical operators -> and, or, not, in, between
select * from film;
select * from film where rental_rate = 0.99 and replacement_cost = 20.99;
select * from film where rental_rate = 0.99 or replacement_cost = 20.99;
select * from film where not replacement_cost >= 20.99;
select film_id, title, rental_rate, length, replacement_cost from film where length between 86 and 100;
select film_id, title, rental_rate, length, replacement_cost from film where length in (80, 90, 100);
select film_id, title, rental_rate, length, replacement_cost from film where length = 80 or length = 90 or length = 100; -- similar to above one 

-- Constraints (set of rules) -> not null, default, unique, primary key, foreign key, candidate key, superkey, check, artifical key, composite key
describe film;

create database pwskills;

use pwskills;

create table teacher(
teacherid int,
teacher_name char(50),
primary key (teacherid)
);

create table students(
studentid int auto_increment, -- column_name datatype
student_name char(50) not null, -- char(size)
aadhar_id int, -- cantidate key which has ability to become primary key
student_email varchar(100) unique, -- variable character
short_description text, -- for unknown legth of text
joining_date date default('2022-05-14'), -- date.now() for current date
grades decimal(3,2), -- for floating point 0.00 = (3,2)
teacherid int,
primary key (studentid),
foreign key  (teacherid) references teacher(teacherid),
age int check(age > 18)
);

insert into students(student_name, student_email, short_description, grades, age) values('aadi','aadi@gmail.com','very genius student',2.3,17); # Error chech constraint voilated

insert into students(student_name, student_email, short_description, grades, age) values('aadi','aadi@gmail.com','very genius student',2.3,19);

select * from students;

-- Question on operators
-- Retrieve the titles of films that have a rental rate greater than $4.00.
select title, rental_rate from film where rental_rate > 4.00;

-- List the customer names and emails of those who live in the address with the ID 300.
select first_name, last_name, email, address_id from customer where address_id = 300;

-- Find the films with a length between 120 and 150 minutes (inclusive). Display the title and length.
select title, length from film where length between 120 and 150;

-- LIKE operator or Wild Card operator -> _ , % (applicable to text data) 
-- % value can be 0 or anything or any position in text
-- _ is used to specify particular position of string or alphabet

-- Retrieve the first and last names of customers whose last name contains with the letter 'S' .
select first_name, last_name from customer where last_name like 'S%'; # starting with S
select first_name, last_name from customer where last_name like '%S'; # ending with S
select first_name, last_name from customer where last_name like '%S%';  # contain S in between
select first_name, last_name from customer where last_name like 'S%S'; # starts and ends with S
select first_name, last_name from customer where last_name like '%nes%'; # that contain nes anywhere in text

-- Retrieve the first and lastname of customer whose last name should contain e.
select first_name, last_name from customer where last_name like '%e%';

-- Retrieve the first and lastname of customer whose first name should end with e and start with a?
select first_name, last_name from customer where first_name like 'a%e';

-- Retrieve the first and lastname of customer whose first name should end with e and letter a is on second position?
select first_name, last_name from customer where first_name like '_a%e';

-- Retrieve the first and lastname of customer whose first name where letter a is on second position?
select first_name, last_name from customer where first_name like '_a%';

-- Retrieve the first and lastname of customer whose first name have letter a is on second position and e on 4th position?
select first_name, last_name from customer where first_name like '_a_e%';

-- Retrieve the first and lastname of customer whose first name have letter a is on second position and last name have letter e on 4th position?
select first_name, last_name from customer where first_name like '_a%' and last_name like '___e%';



