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