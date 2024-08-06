-- Joins -> inner join, right join, left join, and full join
-- t1				t2
-- std name age	  std tid subject
-- 1    abc	 12		2	3	maths
-- 2	bdc	 23		4	3	maths
-- 3 	ojn	 25		5	4	science
-- 4	ljn	 26
 
-- inner join - std
-- 2 bdc 23 3 	maths
-- 4 ljn 26 3 	maths

use mavenmovies;
select * from actor;
select * from actor_award;
select * from actor inner join actor_award on actor.actor_id = actor_award.actor_id;

-- left join - std 
-- 1    abc	 12		2	3	maths
-- 2	bdc	 23		4	3	maths
-- 3 	ojn	 25		null
-- 4	ljn	 26		null

select * from actor left join actor_award on actor.actor_id = actor_award.actor_id;

-- right join - std
-- std name age	  std tid subject
-- 2	bdc	 23		2	3	maths
-- 4	ljn	 26		4	3	maths
-- null				5	4	science

select * from actor right join actor_award on actor.actor_id = actor_award.actor_id;

--  full join - std

-- Display all the cities in India?
select * from city;
select * from country;
select city.city, country.country from city inner join country on city.country_id = country.country_id and country.country = 'India';

-- Display all the cities with there postal code in India ?
select * from city;
select * from address;
select * from country;

SELECT 
    city.city, address.postal_code, country.country
FROM
    city
        INNER JOIN
    address ON city.city_id = address.city_id
        INNER JOIN
    country ON city.country_id = country.country_id
WHERE
    country.country = 'India';
    
-- Display the names of actors and the names of the films they have acted in.
select * from actor;
select * from  film_actor;
select * from film;

SELECT 
    concat(actor.first_name," ", actor.last_name) as actor_name, film.title
FROM
    actor
        INNER JOIN
    film_actor ON actor.actor_id = film_actor.actor_id
        INNER JOIN
    film ON film_actor.film_id = film.film_id;
    
-- Display all the actors and total number of films they have acted in.
select * from actor;
select * from film;
select * from film_actor;

SELECT 
    COUNT(film.title) as Number_of_movies,
    CONCAT(actor.first_name, ' ', actor.last_name) AS Actor_name
FROM
    actor
        LEFT JOIN
    film_actor ON actor.actor_id = film_actor.actor_id
        LEFT JOIN
    film ON film_actor.film_id = film.film_id
GROUP BY Actor_name; 
