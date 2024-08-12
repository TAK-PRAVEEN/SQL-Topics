-- Revision
use mavenmovies;

-- Write a query to count the number of film rentals for each customer 
-- and the containing query then retrieves those customers who have rented exactly 30 films.
select * from customer;
select * from rental;

select first_name, last_name from customer where 30 = (select count(*) from rental where rental.customer_id = customer.customer_id);

-- Write a query to find all customers whose total payments for all film rentals are between 100 and 150 dollars.
select * from customer;
select * from payment;

select c.first_name, c.last_name from customer c where (select sum(amount) from payment p where p.customer_id = c.customer_id) between 100 and 150;

-- retieve the film title along with their description and lengths that have rental rate greater than avg rental_rate films
-- released in same year
select * from film;
select title, description, length, release_year from film f where rental_rate > (select avg(rental_rate) from film ff where f.release_year = ff.release_year);




