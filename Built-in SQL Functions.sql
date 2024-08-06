-- SQL Pre defined function -> mathematical, string, datetime function

use mavenmovies;
-- aggregate functions
select sum(amount) from payment; -- summing all the column values and giving single output 
select avg(amount) from payment; -- averaging all the column values and giving single output
select count(amount) from payment; -- counting all the values on column
select min(amount) from payment; -- minimum
select max(amount) from payment; -- maximum

-- string functions -> concat, length, upper, lower. substr
select concat(first_name,  " ", last_name) as full_name from actor; -- concat to join multiple strings together
select concat(first_name,  " ", last_name) as full_name, length(concat(first_name,  " ", last_name)) as length from actor; -- to get the number of character in a string
select upper(first_name) from actor; -- to change string to uppercase
select lower(first_name) from actor; -- to change string to lowercase
select upper('hello');
select substr(address, 3, 10) from address; -- substr(text data, starting point, no. of char) fucntion to extract/slice of a string
select substr("Hello, I'm Praveen Tak",11,8);

-- datetime functions -> month, year, day, monthname, datediff
select rental_date, month(rental_date) from rental;
select rental_date, monthname(rental_date) from rental;
select rental_date, year(rental_date) from rental;
select rental_date, day(rental_date) from rental;
select return_date, rental_date, datediff(return_date, rental_date) from rental; -- to find difference between two dates
select dayname('2024-08-05');

-- What smallest rental duration ?
select min(rental_duration) from film;

-- What is the highest replacement cost amongst all the films
select max(replacement_cost) from film;

-- Display all films whose title length is greater than 10 characters
select *, length(title) from film where length(title) > 10;

-- Provide the count of unique ratings of films provided
select count(distinct(rating)) from film;

-- Display the list of first 4 cities which start and end with ‘a’
select * from city where city like 'a%a' limit 4;

-- Operations -> from, join, where, group by, having, select, order by, limit

-- Group by 
select * from film;
select rating, avg(rental_duration) from film group by rating;
select rating, sum(rental_duration) from film group by rating;
select actor_id, count(film_id) as num_of_movies from film_actor group by actor_id order by num_of_movies desc;

-- List the total sales amount for each customer in the database
select * from payment;
select customer_id, sum(amount) as total_amount from payment group by customer_id order by total_amount desc;
select distinct(customer_id) from payment;
select customer_id from payment group by customer_id; -- output of this and above is same and distinct is working based on group by

-- Having use after group by
SELECT 
    customer_id, SUM(amount) AS total_amount
FROM
    payment
GROUP BY customer_id
HAVING total_amount > 200;


