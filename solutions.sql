-- 1- Get all pairs of actors that worked together.
use sakila;
select f1.actor_id, f2.actor_id 
from film_actor f1
join film_actor f2
on f1.film_id = f2. film_id
and f1.actor_id <> f2.actor_id;


-- 2- Get all pairs of customers that have rented the same film more than 3 times.

-- Below is my first idea (including the film title)
select r1.customer_id, r2.customer_id, f.title, count(f.title) as num_films
from rental r1
join rental r2
on r1.inventory_id = r2.inventory_id
and r1.customer_id <> r2.customer_id
left join inventory i
on r1.inventory_id = i.inventory_id
left join film f
on i.film_id = f.film_id
GROUP BY r1.customer_id, r2.customer_id, f.title
HAVING num_films >=3;

-- 2nd idea (without the film title)
SELECT r1.inventory_id, r1.customer_id, r2.customer_id, count(r1.inventory_id) AS num_inventory
FROM rental r1
JOIN rental r2
ON r1.inventory_id = r2.inventory_id
GROUP BY r1.inventory_id, r1.customer_id, r2.customer_id
HAVING num_inventory > 3;

-- third idea using 2 sub query. but an error that mentions that there are duplicate rental_id.... :(
SELECT r1.inventory_id, f.title, r1.cusotmer_id, r2.customer_id FROM
(SELECT * -- r1.inventory_id, r1.customer_id, r2.customer_id, count(r1.inventory_id) AS num_inventory
FROM rental r1
JOIN rental r2
ON r1.inventory_id = r2.inventory_id) as t1
LEFT JOIN (SELECT i.inventory_id, f.title
from inventory i
left join film f
on i.film_id = f.film_id) as t2
on r1.inventory_id = i.inventory_id;




-- 3- Get all possible pairs of actors and films.
SELECT f1.actor_id, f2.actor_id, f2.film_id  
FROM film_actor f1
JOIN film_actor f2
ON f1.film_id = f2.film_id
AND f1.actor_id <> f2.actor_id;
