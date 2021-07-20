-- 1- Get all pairs of actors that worked together.

use sakila;
select b.film_id,a.actor_id,b.actor_id
from film_actor a
join film_actor b
on a.actor_id <> b.actor_id
and a.film_id = b.film_id
group by b.film_id;
-- 2- Get all pairs of customers that have rented the same film more than 3 times.
-- I am not able to answer this question.. I tried something in the following but that is not right .. 
select customer_id, count(inventory_id)
from rental
group by inventory_id
having count(customer_id > 3);

create temporary table if not exists combocustomerrental
select r.customer_id, first_name, last_name, r.inventory_id 
from rental r
left join customer c
on c.customer_id = r.customer_id
order by r.customer_id;

select * from combocustomerrental;

create temporary table if not exists comboinventory
select customer_id, first_name, last_name, cr.inventory_id, film_id 
from combocustomerrental cr
join inventory i
on cr.inventory_id = i.inventory_id;

select * from comboinventory;

create temporary table if not exists comborentalfilm
select customer_id, first_name, last_name, inventory_id, rf.film_id, title
from comboinventory rf
join film f
on rf.film_id = f.film_id;


select * from comborentalfilm
order by film_id;

-- the solution I get is not right..

-- 3- Get all possible pairs of actors and films.

select  * 
from film
cross join actor;