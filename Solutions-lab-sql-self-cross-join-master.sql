USE sakila;
-- 1- Get all pairs of actors that worked together.
select a1.actor_id , a2.actor_id, a1.film_id
from film_actor a1
join film_actor a2
	on a1.actor_id <> a2.actor_id
	and a1.film_id = a2.film_id;

-- 2- Get all pairs of customers that have rented the same film more than 3 times.
SELECT c1.customer_id, c2.customer_id, count(*) 
FROM customer c1
LEFT JOIN customer c2
ON c1.film_id = c2.film_id
WHERE c1.customer_id <> c2.customer_id
GROUP BY c1.customer_id, c2.customer_id
HAVING count(*) > 3;

-- 3- Get all possible pairs of actors and films.
select f.title, a.first_name, a.last_name
from actor a  
cross join film f