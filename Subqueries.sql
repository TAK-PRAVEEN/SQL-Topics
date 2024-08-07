-- Subquery -> query inside query
use mavenmovies;

select payment_id, amount from payment where amount > (select avg(amount) from payment);

select * from film;
select * from language;
select film_id, title from film where language_id in (select language_id from language where name = 'English'); 
select film_id, title from film inner join language on film.language_id = language.language_id where language.name like 'e%'; 

-- Find the films that have a higher rental rate than any film in the 'Action' genre. 
-- Display the title and rental rate.
select * from film;
select * from category;
select * from film_category;

select category_id from category where name = 'action';
select film_id from film_category where film_id in (select category_id from category where name = 'action');
select max(rental_rate) from film where film_id in (select film_id from film_category where category_id in (select category_id from category where name = 'action'));
select title, rental_rate from film where rental_rate = (select max(rental_rate) from film where film_id in (select film_id from film_category where category_id in (select category_id from category where name = 'action')));   

-- Retrieve the films that have a replacement cost higher than the average replacement cost 
-- of films in the 'Drama' genre. Display the title and replacement cost.
select * from film;
select * from film_category;
select * from category;

select avg(replacement_cost) from film;
select category_id from category where name = 'drama';
select film_id from film_category where category_id in (select category_id from category where name = 'drama');
select avg(replacement_cost) from film where film_id in (select film_id from film_category where category_id in (select category_id from category where name = 'drama'));
SELECT 
    title, replacement_cost
FROM
    film
WHERE
    replacement_cost > (SELECT 
            AVG(replacement_cost)
        FROM
            film
        WHERE
            film_id IN (SELECT 
                    film_id
                FROM
                    film_category
                WHERE
                    category_id IN (SELECT 
                            category_id
                        FROM
                            category
                        WHERE
                            name = 'drama')));
                            
-- Retrieve the titles of films that have a rental duration greater than the average rental duration of all films.
select * from film;

select avg(rental_duration) from film;
select title, rental_duration from film where rental_duration > (select avg(rental_duration) from film);

-- List the names of actors who have not appeared in any films. Display the actor's first name and last name.
select * from actor;
select * from film_actor;

select actor_id from film_actor;
select first_name, last_name from actor where actor_id not in (select actor_id from film_actor);

-- List the first and last names of customers who have made payments.
select * from customer;
select * from payment;

select customer_id from payment;
select first_name, last_name from customer where customer_id in (select distinct customer_id from payment);

-- Find the titles of films that are available in the inventory.
select * from film;
select * from inventory;

select film_id from inventory;
select title from film where film_id in (select film_id from inventory); 

