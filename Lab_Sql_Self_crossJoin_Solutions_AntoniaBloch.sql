-- 1- Get all pairs of actors that worked together.

use sakila;
select b.film_id,a.actor_id,b.actor_id
from film_actor a
join film_actor b
on a.actor_id <> b.actor_id
and a.film_id = b.film_id
group by b.film_id;

-- Solution 
select fa1.film_id, concat(a1.first_name, ' ', a1.last_name), concat(a2.first_name, ' ', a2.last_name)
from sakila.actor a1
inner join film_actor fa1 on a1.actor_id = fa1.actor_id
inner join film_actor fa2 on (fa1.film_id = fa2.film_id) and (fa1.actor_id != fa2.actor_id)
inner join actor a2 on a2.actor_id = fa2.actor_id;


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

-- solution
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


-- 3- Get all possible pairs of actors and films.

select  * 
from film
cross join actor;

-- solution:
select concat(a.first_name,' ', a.last_name) as actor_name, f.title
from sakila.actor a
cross join sakila.film as f;