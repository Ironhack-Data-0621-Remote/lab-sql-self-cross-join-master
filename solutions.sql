USE sakila;
-- 1- Get all pairs of actors that worked together.
SELECT fa1.film_id, fa1.actor_id as actor_id_1, fa2.actor_id as actor_id_2
FROM film_actor fa1 
JOIN film_actor fa2
ON fa1.film_id = fa2.film_id
WHERE fa1.actor_id <> fa2.actor_id;

-- 2- Get all pairs of customers that have rented the same film more than 3 times.
SELECT r1.customer_id, r2.customer_id, COUNT(r1.inventory_id) as times_rented
FROM rental r1
JOIN rental r2
ON r1.customer_id <> r2.customer_id
AND r1.inventory_id = r2.inventory_id
GROUP BY r1.customer_id, r2.customer_id 
HAVING times_rented > 3;

-- 3. Get all possible pairs of actors and films.
SELECT f1.film_id, f1.actor_id as actor_id_1, f2.actor_id as actor_id_2
FROM film_actor f1
JOIN film_actor f2
ORDER BY f1.film_id ASC;
