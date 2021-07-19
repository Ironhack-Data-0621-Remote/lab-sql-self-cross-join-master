USE sakila;

-- 1- Get all pairs of actors that worked together.
SELECT *
FROM film_actor fa1, film_actor fa2
WHERE fa1.actor_id <> fa2.actor_id
AND fa1.film_id = fa2.film_id;

SELECT fa1.film_id, f.title, fa1.actor_id, a.first_name, a.last_name, fa2.actor_id, a1.first_name, a1.last_name
FROM film_actor fa1
JOIN film_actor fa2 
ON fa1.film_id = fa2.film_id AND fa1.actor_id <> fa2.actor_id
JOIN actor a 
ON a.actor_id = fa1.actor_id
JOIN actor a1 
ON a1.actor_id = fa2.actor_id
JOIN film f
ON f.film_id = fa1.film_id;


-- 2- Get all pairs of customers that have rented the same film more than 3 times.
SELECT r1.inventory_id, COUNT(r1.inventory_id) AS count_rentals, r1.customer_id, r2.customer_id
FROM rental r1, rental r2
WHERE r1.customer_id <> r2.customer_id
AND r1.inventory_id = r2.inventory_id
GROUP BY r1.customer_id, r2.customer_id
HAVING count_rentals > 3;

-- 3- Get all possible pairs of actors and films.
SELECT a.actor_id, a.first_name, a.last_name, f.film_id, f.title
FROM film f
CROSS JOIN actor a
ORDER BY a.actor_id;