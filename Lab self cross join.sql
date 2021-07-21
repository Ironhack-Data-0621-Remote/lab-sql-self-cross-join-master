use sakila;

-- 1- Get all pairs of actors that worked together.
SELECT a.actor_id, b.actor_id
FROM film_actor a, film_actor b
where a.film_id = b.film_id
and a.actor_id <> b.actor_id;

-- 2- Get all pairs of customers that have rented the same film more than 3 times.
-- I'm stuck in this question, I can't find more than this :'( 

select * from (select c.customer_id, r.customer_id, count(i.film_id) as rented from rental r
join customer c
on r.customer_id != c.customer_id
join inventory i
on r.inventory_id = i.inventory_id) t1
where rented > 3;

-- 3- Get all possible pairs of actors and films.
SELECT a.actor_id, b.actor_id, a.film_id 
FROM film_actor a, film_actor b
where a.film_id = b.film_id
and a.actor_id <> b.actor_id;