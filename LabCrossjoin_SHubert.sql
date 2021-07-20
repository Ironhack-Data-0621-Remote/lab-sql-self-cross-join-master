use sakila;

-- 1- Get all pairs of actors that worked together.
-- select fa1.film_id, fa1.actor_id, fa2.actor_id
-- from film_actor fa1
-- join film_actor fa2
-- on fa1.film_id = fa2.film_id
-- and fa1.actor_id != fa2.actor_id;


-- 2- Get all pairs of customers that have rented the same film more than 3 times.
select  r1.customer_id, r2.customer_id, r1.rental_id , r2.rental_id , count(i1.film_id)
from rental r1 
join rental r2
on r1.customer_id != r2.customer_id
join inventory i1
on i1.inventory_id = r1.inventory_id
and i1.inventory_id = r2.inventory_id
where i1.film_id >= 3;




-- 3- Get all possible pairs of actors and films.

select fa1.film_id, fa1.film_id, fa1.actor_id, fa2.actor_id
from film_actor fa1
join film_actor fa2
on fa1.film_id != fa2.film_id
and fa1.actor_id != fa2.actor_id