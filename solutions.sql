-- 1- Get all pairs of actors that worked together.
SELECT f1.actor_id, f2.actor_id, f1.film_id, f2.film_id
FROM film_actor f1
JOIN film_actor f2
ON f1.actor_id <> f2.actor_id
AND f1.film_id = f2.film_id;

-- 2- Get all pairs of customers that have rented the same film more than 3 times.
SELECT r1.customer_id,  r2.customer_id, COUNT(*)
FROM rental AS r1
  JOIN inventory AS i 
      ON i.inventory_id = r1.inventory_id
  JOIN rental AS r2 
      ON r1.customer_id <> r2.customer_id 
      AND i.inventory_id = r2.inventory_id
GROUP BY r1.customer_id,  r2.customer_id
HAVING COUNT(*) > 3
; 

-- 3- Get all possible pairs of actors and films.
SELECT fa.actor_id, f.film_id
FROM film_actor fa
CROSS JOIN film f;