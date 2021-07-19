-- 1- Get all pairs of actors that worked together.
SELECT f1.film_id, f1.actor_id as id1, f2.actor_id as id2, a.last_name
FROM film_actor f1 
JOIN film_actor f2 ON f1.film_id = f2.film_id
JOIN actor a ON f1.actor_id = a.actor_id
WHERE f1.actor_id <> f2.actor_id;

-- 2- Get all pairs of customers that have rented the same film more than 3 times.
SELECT c.customer_id, c.last_name, COUNT(*)
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id, c.last_name
HAVING COUNT(*) > 1
ORDER BY 3 DESC; 

-- 3- Get all possible pairs of actors and films.
SELECT a.first_name, a.last_name, f.title
FROM actor a
LEFT JOIN (film_actor fa CROSS JOIN film f) 
ON a.actor_id = fa.actor_id;
