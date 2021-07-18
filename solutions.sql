use sakila;

-- 1- Get all pairs of actors that worked together.

select a.actor_id as actor_id1, b.actor_id as actor_id2, a.film_id
from film_actor a, film_actor b
where a.actor_id <> b.actor_id
and a.film_id = b.film_id
order by a.film_id;


-- 2- Get all pairs of customers that have rented the same film more than 3 times.

-- not sure how to do this :(


-- 3- Get all possible pairs of actors and films.

select * from actor
cross join film;


