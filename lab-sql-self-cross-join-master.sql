use sakila;
-- 1- Get all pairs of actors that worked together.
 select a.film_id, a.actor_id as a_actor_id , b.actor_id as b_actor_id
from film_actor a
left join film_actor b
on a.film_id = b.film_id
where a.actor_id <> b.actor_id
;
-- 2- Get all pairs of customers that have rented the same film more than 3 times
 
 -- i create two temporary tables and merge them. I have to create two of them as i can't do a self join on a temp table
 
-- create temporary table customer_film
-- select r.customer_id, i.film_id
-- from rental r
-- left join inventory i
-- on r.inventory_id = i.inventory_id;

-- create temporary table bcustomer_film
-- select r.customer_id, i.film_id
-- from rental r
-- left join inventory i
-- on r.inventory_id = i.inventory_id;

select * from customer_film;

select count(a.film_id) as n_repeated, a.customer_id, b.customer_id
from customer_film a
left join bcustomer_film b
on a.film_id = b.film_id
where a.customer_id <> b.customer_id
group by a.customer_id, b.customer_id
having n_repeated >= 3;

-- 3- Get all possible pairs of actors and films.