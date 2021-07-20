-- 1- Get all pairs of actors that worked together.

SELECT c.title AS film, a.actor_id AS actor1, b.actor_id AS actor2
FROM film_actor a, film_actor b
JOIN film c
WHERE c.film_id = a.film_id
AND a.actor_id <> b.actor_id
AND a.film_id = b.film_id
ORDER BY a.film_id
;

-- I couldn't JOIN with this query to get the names
SELECT actor_id, CONCAT(first_name, ' ', last_name) AS actor_name 
FROM sakila.actor;

-- 2- Get all pairs of customers that have rented the same film more than 3 times.

-- The rank is not working properly here
SELECT r.customer_id, i.film_id
	, RANK() OVER(PARTITION BY r.customer_id ORDER BY i.film_id) film_rank
FROM sakila.rental r
JOIN sakila.inventory i
ON r.inventory_id = i.inventory_id
GROUP BY r.customer_id, i.film_id
ORDER BY film_rank DESC
;

SELECT r.customer_id, i.film_id, count(*)
FROM sakila.rental r
JOIN sakila.inventory i
ON r.inventory_id = i.inventory_id
GROUP BY r.customer_id, i.film_id
ORDER BY r.customer_id, count(*) desc
;

-- 3- Get all possible pairs of actors and films.

SELECT a.actor_id, concat(a.first_name, " ", a.last_name) AS actor_name, f.film_id, f.title
FROM sakila.actor a
CROSS JOIN sakila.film f
ORDER BY a.actor_id;