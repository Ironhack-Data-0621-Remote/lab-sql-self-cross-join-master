-- lab-sql-self-cross-join-master
USE sakila;
-- Get all pairs of actors that worked together.

SELECT fa1.film_id, concat(a1.first_name, ' ', a1.last_name) AS actor1, concat(a2.first_name, ' ', a2.last_name)  AS Actor2
FROM sakila.actor a1
JOIN film_actor fa1 ON a1.actor_id = fa1.actor_id
JOIN film_actor fa2 ON (fa1.film_id = fa2.film_id) AND (fa1.actor_id != fa2.actor_id)
JOIN actor a2 ON a2.actor_id = fa2.actor_id;

-- Get all pairs of customers that have rented the same film more than 3 times.

select c1.customer_id, c2.customer_id, count(*) as num_films
from sakila.customer c1
inner join rental r1 on r1.customer_id = c1.customer_id
inner join inventory i1 on r1.inventory_id = i1.inventory_id
inner join film f1 on i1.film_id = f1.film_id
inner join inventory i2 on i2.film_id = f1.film_id
inner join rental r2 on r2.inventory_id = i2.inventory_id
inner join customer c2 on r2.customer_id = c2.customer_id
where c1.customer_id <> c2.customer_id
group by c1.customer_id, c2.customer_id
having count(*) > 3
order by num_films desc;

-- Get all possible pairs of actors and films.

select concat(a.first_name,' ', a.last_name) as actor_name, f.title
from sakila.actor a
cross join sakila.film as f;