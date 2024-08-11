-- CTE (Common Table Expression)
use mavenmovies;
--  Create a CTE with two named subqueries. The first one gets the actors with last names starting with s.
--  The second one gets all the pg films acted by them. Finally show the film id and title.

-- subquery 1
select * from actor where last_name like 's%'; -- saving the result in variable -> actor_s
-- subquery 2
select a.actor_id, a.first_name, a.last_name, f.title, f.film_id from actor as a inner join film_actor as fa on a.actor_id = fa.actor_id 
inner join film as f on f.film_id = fa.film_id where rating = 'pg';

with actor_s as (
select * from actor where last_name like 's%'), 
actor_pg as (
select a.actor_id, a.first_name, a.last_name, f.title, f.film_id from actor_s as a inner join film_actor as fa on a.actor_id = fa.actor_id 
inner join film as f on f.film_id = fa.film_id where rating = 'pg')
select * from actor_pg; 

-- Add one more subquery to the previous CTE to get the revenues of those movies
with actor_s as (
select * from actor where last_name like 's%'), -- task 1 filter people as last name as s
actor_pg as ( -- rtask 2 filter film with rating as pg
select a.actor_id, a.first_name, a.last_name, f.title, f.film_id from actor_s as a inner join film_actor as fa on a.actor_id = fa.actor_id 
inner join film as f on f.film_id = fa.film_id where rating = 'pg'),
film_revenue as ( -- task 3 join amount of filtered films
select ap.title, ap.film_id, p.amount from actor_pg as ap inner join inventory i on i.film_id = ap.film_id
inner join rental as r on i.inventory_id = r.inventory_id inner join payment as p on p.rental_id = r.rental_id)
select title, sum(amount) from film_revenue group by title; -- task 4 revenue total of each movie

-- Question 1 - Give me the details of films along with its revenue having pg rating and actor with last name as s ?
-- number of tables - actor , film_actor , film, inventory , rental , payment
select * from film;
select * from actor;
select * from film_actor;
select * from inventory;
select * from rental;
select * from payment;

with actor_s as (
select * from actor where last_name like 's%'),
actor_pg as (
select ac.actor_id, ac.first_name, ac.last_name, f.title, f.film_id from actor_s as ac inner join film_actor as fa on ac.actor_id = fa.actor_id
inner join film as f on fa.film_id = f.film_id where rating = 'pg'),
revenue as (
select ap.first_name, ap.last_name, ap.title, p.amount from actor_pg as ap inner join inventory as i on ap.film_id = i.film_id
inner join rental as r on i.inventory_id = r.inventory_id
inner join payment as p on r.rental_id = p.rental_id)
select title, sum(amount) from revenue group by title;

-- CASE STATEMENT

-- Write a query to generate a value for the activity_type column which returns the string “Active” or “Inactive”
--  depending on the value of the customer.active column
select * from customer;

select first_name, last_name,
case 
when active =1 then 'active'
else 'inactive'
end as activity_type -- -> alias
from customer;

-- Write a query to show the number of film rentals for May, June and July of 2005 in a single row.
select * from rental;

select monthname(rental_date) as rental_month, count(rental_id) from rental group by rental_month;

select sum(case when monthname(rental_date) = 'may' then 1 else 0 end) as MAY,
sum(case when monthname(rental_date) = 'june' then 1 else 0 end) as JUNE,
sum(case when monthname(rental_date) = 'july' then 1 else 0 end) as JULY
from rental where year(rental_date) = 2005;

-- Write a query to categorize films based on the inventory level. 
-- If the count of copies is 0 then ‘Out of stock’
-- If the count of copies is 1 or 2  then ‘Scarce’
-- If the count of copies is 3 or 4 then ‘Available’
-- If the count of copies is >= 5 then ‘Common’
select * from inventory;

select title,
case 
(select count(*) from inventory where inventory.film_id = film.film_id)
when 0 then 'Out of stock'
when 1 then 'Scarce'
when 2 then 'Scarce'
when 3 then 'Available'
when 4 then 'Available'
else 'Common' end film_availiability from film;


--  Write a query to create a single row containing the number of films based on the ratings (G, PG and NC17)
select * from film;

select 
sum(case when rating='g' then 1 else 0 end) as G,
sum(case when rating='pg' then 1 else 0 end) as PG,
sum(case when rating='nc-17' then 1 else 0 end) as PG
from film;