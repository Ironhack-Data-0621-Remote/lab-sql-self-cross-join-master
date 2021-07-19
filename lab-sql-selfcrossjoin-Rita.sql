use sakila;

-- 1- Get all pairs of actors that worked together.
-- I tried to get the names of the actors too

SELECT f.film_id, f.actor_id, a.first_name, a.last_name, f1.actor_id, a1.first_name, a1.last_name
FROM film_actor f
JOIN film_actor f1
ON f.film_id = f1.film_id AND
f.actor_id != f1.actor_id
JOIN actor a
ON a.actor_id = f.actor_id
JOIN actor a1
on a1.actor_id = f1.actor_id;

-- 2- Get all pairs of customers that have rented the same film more than 3 times.

SELECT r.customer_id, count(i.film_id) AS rented
FROM rental r
JOIN inventory i
ON r.inventory_id = i.inventory_id
JOIN rental r1
ON r.customer_id = r1.customer_id AND
r.rental_id != r1.rental_id
JOIN inventory i1
ON r1.inventory_id = i1.inventory_id
WHERE i.film_id = i1.film_id
GROUP BY r.customer_id
HAVING rented > 3;


-- 3- Get all possible pairs of actors and films.
-- I tried to get film title and actors names

SELECT DISTINCT f2.title, a.first_name, a.last_name
FROM film_actor f
JOIN film_actor f1
ON f.film_id = f1.film_id  
JOIN film f2
ON f1.film_id = f2.film_id
JOIN actor a
ON a.actor_id = f1.actor_id

