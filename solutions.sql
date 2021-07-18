-- 1- Get all pairs of actors that worked together.
select f1.film_id, f1.actor_id, f2.actor_id
from film_actor f1
join film_actor f2
on f1.film_id = f2.film_id
and f1.actor_id != f2.actor_id;

-- 2- Get all pairs of customers that have rented the same film more than 3 times.
select concat(z.customer_id, ', ', y.customer_id) as cust_pair, z.film_id -- concat to get the pair of customers in the same column
from 
(
select r.rental_id, i.film_id, r.customer_id
from rental r
left join inventory i
on r.inventory_id = i.inventory_id
) z -- first left join to get film_id joined on rental table thanks to inventory_id FK
join 
( 
select r.rental_id, i.film_id, r.customer_id
from rental r
left join inventory i
on r.inventory_id = i.inventory_id
) y -- self join on left joined above
on z.film_id = y.film_id
and z.customer_id != y.customer_id
group by cust_pair -- grouping by cust_pair in order to count only rentals > 3
having count(z.film_id) > 3;
-- There must be something wrong here because we can see first row 431,541 and row 11 541,431 but these ideally would need to be on the same row ... How should I do that ?

-- 3- Get all possible pairs of actors and films.
select concat(actor_id, ', ', film_id) as actors_films
from film_actor;


