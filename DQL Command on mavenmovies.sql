-- operations - from - join - where - group by - having - select - order by - limit

use mavenmovies;

select * from film; -- from helps to define which table is required

select title, description from film limit 3; -- limit helps to set the number of records

select film_id, title from film order by title asc; -- asending and descending order

select film_id, title from film where film_id < 20;

-- comparison operators - <, >, <=, >=, =, !=

select customer_id, first_name from customer where customer_id = 20;

-- arithmatic operators -, +, -, *, /, %

select amount*2, amount from payment;
select 2+2;

-- logical operators - and, or, not

describe payment;
select * from payment where amount > 2.99 and customer_id < 100;
select * from payment where amount > 2.99 or customer_id < 100;
select * from payment where amount > 2.99 or customer_id < 100 or staff_id = 1;




