use mavenmovies;

-- Retrieve the top 5 films with the highest rental rates, displaying the film title, rental rate, and the average rental
-- rate for all films. Use window functions to rank the films based on their rental rates.
select * from film;

select title, rental_rate, rental_rate, rating, avg(rental_rate) over(), rank() over(order by rental_rate desc) from film order by rental_rate desc limit 5; 

-- select column, indow_func() over() from table_name;

-- Find the total number of rentals for each customer, along with their 
-- individual rental counts and the average number of rentals across all customers. --rental -> customer_id, count(rental), averagre(count())
-- add new column with individual having higher value than avg is marked higher or else lower
-- give me the list of people who rented movies higher than average
select * from rental;

select customer_id, count(rental_id) as count_of_rental, avg(count(rental_id)) over() from rental group by customer_id;

select customer_id, count(rental_id) as count_of_rental, avg(count(rental_id)) over() as average_of_count,
case
when count(rental_id) > avg(count(rental_id)) over() then 'Higher' 
else 'Lower' end count_stats
from rental group by customer_id order by count_of_rental desc;

-- Find the films that have been rented the least number of times. Display the film 
-- title, rental count, and the average rental count across all films.
-- from - join - where - group by - having - select - order by - limit
select * from film;

select title, count(rental_id) as no_of_rentals, avg(count(rental_id)) over() from film f 
left join inventory i on f.film_id= i.film_id
left join rental r on r.inventory_id = i.inventory_id group by title order by no_of_rentals;

-- Display the title and rental duration of films from the database, 
-- alongside the title and rental duration of the subsequent film (using LEAD function) 
select title, rental_duration, LEAD(title, 1, "NA") over(order by title), LEAD(rental_duration, 1, "NA") over(order by title) from film;

select title, rental_duration, LAG(title, 1, "NA") over(order by title), LAG(rental_duration, 1, "NA") over(order by title) from film;

-- lag -- when you want to compare performance on weekly bases

-- function - string , numeric , date function , aggregate , window functions

-- user defined function -> create your own function

select concat(first_name," ", last_name) from customer;

-- function to get a squared value
SET GLOBAL log_bin_trust_function_creators =1;

delimiter //
create function squared (num int)
returns int 
begin
declare result int;
set result = num*num; 
return result;
end// 
delimiter ;

select squared(5);
select squared(25);
