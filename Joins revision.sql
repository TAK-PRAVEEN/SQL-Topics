use mavenmovies;

-- Inner join
select count(*) from film;
select count(*) from film_actor;
select count(*) from film f inner join film_actor fa on f.film_id = fa.film_id;

-- Left join
select count(*) from film;
select count(*) from film_actor;
select * from film as f left join film_actor as fa on f.film_id = fa.film_id;

-- Right join
select count(*) from film;
select count(*) from film_actor;
select * from film as f right join film_actor as fa on f.film_id = fa.film_id;

-- Cross join -> it returns all the combination formed with each valuein left table to right table
select count(*) from film;
select count(*) from film_actor;
select count(*) from film cross join film_actor;

-- Full outer join -> all the values from left, right join data and removes duplicated values
select count(*) from film;
select count(*) from film_actor;
select * from film as f right join film_actor as fa on f.film_id = fa.film_id union 
select * from film as f right join film_actor as fa on f.film_id = fa.film_id;

-- Natural join
select * from film as f natural join film_actor as fa;


-- Self join
select * from film as f join film as fa on f.film_id = fa.film_id;

-- Non-correlated query
select * from payment;

-- give me the custyomer id who is spending more than average
select avg(amount) from payment;
select distinct customer_id from payment where amount > (select avg(amount) from payment);

-- retrieve the film title, description, and release year for the film that has the longest duration
select * from film;

select title, description, release_year from film where length = (select max(length) from film);

-- show the title, rental rate, and difference from average rental rate for each film
select title, rental_rate, rental_rate - (select avg(rental_rate) from film) as average_rental_diff from film;

-- scaler subquery
-- show the title , rental_rate and diff from average renatl rate for each film
select title , rental_rate , rental_rate - (select avg(rental_rate) from film) as average_rental_diff from film;

-- multirow subquery
-- Write a query to generate a list of customer IDs along with the number of film rentals and the total payments.
select c.first_name, c.last_name , tot_rentals , tot_payments from customer c inner join 
( select customer_id , count(customer_id) as tot_rentals , sum(amount) as tot_payments
 from payment group by customer_id) a 
 on c.customer_id = a.customer_id;
 
 ( select customer_id , count(customer_id) as tot_rentals , sum(amount) as tot_payments
 from payment group by customer_id);
 
 -- Determine the customers who have rented movies from both stores (store ID 1 and store ID 2)
 select * from customer; -- name
 select * from inventory; -- store id
 select * from rental; -- rental id
 
SELECT 
    *
FROM
    customer c
        INNER JOIN
    rental r ON c.customer_id = r.customer_id
        INNER JOIN
    inventory i ON i.inventory_id = r.inventory_id
        INNER JOIN
    store s ON s.store_id = i.store_id
WHERE
    s.store_id IN (1 , 2);