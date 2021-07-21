USE sakila;
-- 1- Get all pairs of actors that worked together.

SELECT t1.actor_id, t2.actor_id, t1.film_id
FROM film_actor AS t1
JOIN film_actor AS t2
WHERE t1.actor_id <> t2.actor_id
AND t1.film_id = t2.film_id
ORDER BY t1.actor_id;

-- 2- Get all pairs of customers that have rented the same film more than 3 times.

-- exploration of data

SELECT* FROM inventory
WHERE inventory_id BETWEEN 80 AND 100;
SELECT* FROM inventory
WHERE film_id BETWEEN 1 AND 25;
SELECT* FROM rental
WHERE inventory_id BETWEEN 80 AND 100;
SELECT * FROM film;

-- QUERY
SELECT t1.customer_id AS customerA, t2.customer_id AS customerB, film_id, count(t3.film_id)
FROM inventory AS t3
JOIN rental AS t1
ON t3.inventory_id = t1.inventory_id
JOIN rental AS t2
WHERE t1.customer_id <> t2.customer_id 
AND t1.inventory_id = t2.inventory_id
GROUP BY film_id
HAVING count(film_id) > 3
ORDER BY t3.film_id;

-- check consistency with random film_id

SELECT t1.customer_id AS customerA, t2.customer_id AS customer2, t3.film_id
FROM inventory AS t3
JOIN rental AS t1
ON t3.inventory_id = t1.inventory_id
JOIN rental AS t2
WHERE t1.customer_id <> t2.customer_id 
AND t1.inventory_id = t2.inventory_id
AND film_id = 1
ORDER BY t1.customer_id;

-- 3- Get all possible pairs of actors and films.
SELECT title, last_name FROM film
CROSS JOIN actor;