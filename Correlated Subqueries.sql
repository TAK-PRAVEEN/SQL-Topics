-- Correlated subqueries
use mavenmovies;
-- Retrieve the titles of films that have a rental rate higher than the average rental rate of films released in the same year.
select * from film;
select title, release_year from film f where rental_rate > (select avg(rental_rate) from film where release_year = f.release_year);

-- List customers who have made more than five payments. Display their first name and last name.
select * from customer;
select * from payment;
select customer_id, count(*) from payment group by customer_id having count(*) > 5;
select first_name, last_name from customer c where (select count(*) from payment p where c.customer_id = p.customer_id) > 5;

SELECT 
    first_name, last_name, COUNT(*)
FROM
    customer c
        INNER JOIN
    payment p ON c.customer_id = p.customer_id
GROUP BY first_name , last_name
HAVING COUNT(*) > 5;

-- Find films with a rental rate higher than the average rental rate for all films. Display the title and rental rate.
select * from film;
select title, rental_rate from film where rental_rate > (select avg(rental_rate) from film);

-- Retrieve the names of actors who have appeared in at least two films. Display their first name and last name.
select * from film;
select * from film_actor;
select * from actor;

SELECT 
    first_name, last_name
FROM
    actor a
WHERE
    (SELECT 
            COUNT(film_id)
        FROM
            film_actor f
        WHERE
            a.actor_id = f.actor_id
        GROUP BY actor_id) >= 2;

-- Write a query to count the number of film rentals for each customer and 
-- the containing query then retrieves those customers name who have rented exactly 30 films.
select * from customer;
select * from rental;
select * from film;

select first_name, last_name from customer c where (select count(rental_id) from rental r where c.customer_id = r.customer_id ) = 30;

-- Write a query to find all customers whose total payments for all film rentals are between 100 and 150 dollars.
select * from rental;
select * from customer;
select * from payment;

select first_name, last_name from customer c where (select sum(amount) from payment p where c.customer_id = p.customer_id) between 100 and 150;

-- Write a query to generate a list of customer IDs along with the number of film rentals and the total payments.
select * from customer;
select * from payment;

SELECT 
    c.first_name,
    c.last_name,
    c.customer_id,
    total_rentals,
    total_payment
FROM
    customer c
        INNER JOIN
    (SELECT 
        customer_id,
            COUNT(*) AS total_rentals,
            SUM(amount) AS total_payment
    FROM
        payment
    GROUP BY customer_id) a ON c.customer_id = a.customer_id;