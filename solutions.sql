use sakila;
-- 1- Get all pairs of actors that worked together.

select a.actor_id, a.film_id, b.actor_id
from film_actor a, film_actor b
where a.actor_id <> b.actor_id
and a.film_id = b.film_id;

-- 2- Get all pairs of customers that have rented the same film more than 3 times.

select * 
from (select film_id, customer_id
from rental r
join inventory i on i.inventory_id = r.inventory_id) as new_table t, new_table a
where t.customer_id <> a.customer_id
and t.film_id = b.film_id
and count(distinct film_id)>3;

-- doesn't work like all the other ideas i had

-- 3-  Get all possible pairs of actors and films.
select actor_id, film_id
from actor a
cross join film f;

