USE sakila;
-- 1. Get all pairs of actors that worked together.
SELECT f.film_id, f.actor_id, a.first_name, a.last_name, f2.actor_id, a2.first_name, a2.last_name
FROM film_actor f
JOIN film_actor f2
ON f.actor_id <> f2.actor_id
AND f.film_id = f2.film_id
JOIN actor a 
ON f.actor_id = a.actor_id
JOIN actor a2
ON f2.actor_id = a2.actor_id; 
-- 2. Get all pairs of customers that have rented the same film more than 3 times.
SELECT r.customer_id, r2.customer_id, COUNT(r.inventory_id) as number_of_times_rented
FROM rental r
JOIN rental r2
ON r.customer_id <> r2.customer_id
AND r.inventory_id = r2.inventory_id
GROUP BY r.customer_id, r2.customer_id 
HAVING COUNT(r.inventory_id) > 3;
-- 3. Get all possible pairs of actors and films.
-- CROSS JOIN
SELECT f.film_id, f.actor_id, f2.actor_id
FROM film_actor f
JOIN film_actor f2
ORDER BY f.film_id ASC;