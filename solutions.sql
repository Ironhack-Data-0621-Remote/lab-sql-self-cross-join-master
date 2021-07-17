use sakila;

-- 1- Get all pairs of actors that worked together.
# only showing actor_id 
select a1.actor_id , a2.actor_id, a1.film_id
from film_actor a1
join film_actor a2
	on a1.actor_id <> a2.actor_id
	and a1.film_id = a2.film_id;

# showing the names of actors and films
select a3.first_name as first_name1, a3.last_name as last_namea1, 
a4.first_name as first_name2, a4.last_name as last_namea2, f.title
from film_actor a1 
join actor a3 # join first table of film_actor and actor
	on a1.actor_id = a3.actor_id 
join film f # join film_id and film title
	on a1.film_id = f.film_id 
join film_actor a2 # self join
	on a1.actor_id <> a2.actor_id
	and a1.film_id = a2.film_id
join actor a4 # join second table of film_actor and actor
	on a2.actor_id = a4.actor_id;


-- 2- Get all pairs of customers that have rented the same film more than 3 times.

# I want to self-join customer_id by using film_id, which i need to first join rental and inventory tables.

select t1.customer_id as customer_1, t2.customer_id as customer_2, count(t1.film_id) as rented_same
  # subquery to make a joined table to get customer_id and film_id in the same table 
from(select r.customer_id, i.inventory_id, i.film_id 
	from inventory i
	join rental r
	on i.inventory_id = r.inventory_id) as t1
  # to self-join, subquery again to make the same joined table
join (
	select r.customer_id, i.inventory_id, i.film_id 
	from inventory i
	join rental r
	on i.inventory_id = r.inventory_id) t2
on t1.customer_id <> t2.customer_id
and t1.film_id = t2.film_id
  # to get pairs that have rented the same film more than 3 times, group by 2 customer and count films
group by t1.customer_id, t2.customer_id
having rented_same >= 3
order by t1.customer_id, t2.customer_id;

-- 3- Get all possible pairs of actors and films.
select f.title, a.first_name, a.last_name
from actor a  
cross join film f
limit 100; # there would be too many possible outputs, so I limit number
