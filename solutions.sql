USE sakila;

-- 1- Get all pairs of actors that worked together.
SELECT faan1.film_id, faan1.first_name AS firstname_1, faan1.last_name AS lastname_1, faan2.first_name AS firstname_2, faan2.last_name AS lastname_2
FROM (
	SELECT fa.film_id, fa.actor_id, a.first_name, a.last_name
	FROM film_actor fa
	JOIN actor a
	ON fa.actor_id = a.actor_id
	ORDER BY fa.film_id
    ) faan1
JOIN (
	SELECT fa.film_id, fa.actor_id, a.first_name, a.last_name
	FROM film_actor fa
	JOIN actor a
	ON fa.actor_id = a.actor_id
	ORDER BY fa.film_id
    )  faan2
ON faan1.film_id = faan2.film_id
AND faan1.actor_id <> faan2.actor_id
ORDER BY  faan1.film_id;

-- 2- Get all pairs of customers that have rented the same film more than 3 times.
-- full self join table
SELECT *
FROM (
	SELECT rental_id, customer_id, r.inventory_id, film_id 
	FROM rental r
	JOIN inventory i
	ON r.inventory_id = i.inventory_id
	ORDER BY rental_id
    ) ri1
JOIN (
	SELECT rental_id, customer_id, r.inventory_id, film_id 
	FROM rental r
	JOIN inventory i
	ON r.inventory_id = i.inventory_id
	ORDER BY rental_id
    ) ri2
ON ri1.customer_id = ri2.customer_id
AND ri1.film_id = ri2.film_id
AND ri1.rental_id <> ri2.rental_id
JOIN (
	SELECT rental_id, customer_id, r.inventory_id, film_id 
	FROM rental r
	JOIN inventory i
	ON r.inventory_id = i.inventory_id
	ORDER BY rental_id
    ) ri3
ON ri1.customer_id = ri3.customer_id
AND ri1.film_id = ri3.film_id
AND ri1.rental_id <> ri3.rental_id
AND ri2.rental_id <> ri3.rental_id;

-- compact view
SELECT DISTINCT ri1.rental_id, ri1.customer_id, ri1.film_id
FROM (
	SELECT rental_id, customer_id, r.inventory_id, film_id 
	FROM rental r
	JOIN inventory i
	ON r.inventory_id = i.inventory_id
	ORDER BY rental_id
    ) ri1
JOIN (
	SELECT rental_id, customer_id, r.inventory_id, film_id 
	FROM rental r
	JOIN inventory i
	ON r.inventory_id = i.inventory_id
	ORDER BY rental_id
    ) ri2
ON ri1.customer_id = ri2.customer_id
AND ri1.film_id = ri2.film_id
AND ri1.rental_id <> ri2.rental_id
JOIN (
	SELECT rental_id, customer_id, r.inventory_id, film_id 
	FROM rental r
	JOIN inventory i
	ON r.inventory_id = i.inventory_id
	ORDER BY rental_id
    ) ri3
ON ri1.customer_id = ri3.customer_id
AND ri1.film_id = ri3.film_id
AND ri1.rental_id <> ri3.rental_id
AND ri2.rental_id <> ri3.rental_id;

-- I'm not sure if I'm getting only customers renting the same movie exactly 3 times or also more than 3 times

-- 3- Get all possible pairs of actors and films.
SELECT * 
FROM film
CROSS JOIN actor;
