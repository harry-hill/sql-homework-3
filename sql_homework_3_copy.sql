-- 1. List all customers who live in Texas
select customer_id, first_name, last_name, customer_state
from customer
where customer_state = 'TX';

-- 2. Get all payments above $6.99 with the Customer's Full Name
select first_name, last_name, payment.amount, payment.payment_id 
from customer c
inner join payment p
on c.customer_id = p.customer_id
where p.amount > 6.99

-- 3. Show all customers names who have made payments over $175(use subqueries)
select first_name, last_name
from customer c 
where customer_id in (
	select customer_id
	from payment
	where amount > $175 
group by customer_id 
order by customer_id 

-- 4. List all customers that live in Nepal (use the city table)
select first_name, last_name
from customer c 
where customer_id in(
	select customer_id 
	from city c2
	where country_id in(
		select country_id
		where country = 'Nepal'
group by customer_id

-- 5. Which staff member had the most transactions?
-- Answer: Jon had the most transactions with 7,304. Mike had only 7,292
select staff.staff_id, staff.first_name, staff.last_name, count(payment.staff_id)
from staff
inner join payment
on staff.staff_id = payment.staff_id
group by staff.staff_id
order by count(payment.staff_id) desc;

-- 6. How many movies of each rating are there?
select movie_id, title, content_rating, count(content_rating)
from movie
group by content_rating;

-- 7. Show all customers who have made a single payment above $6.99 (Use Subqueries)
select first_name, last_name
from customer c 
where customer_id in(
	select customer_id 
	from payment p 
	where amount > 6.99
	group by customer_id 
);

-- 8. How many free rentals did our stores give away?
select rental_id, customer_id, count(rental_id)
from rental r 
where rental_id in(
	select rental_id
	from payment
	where amount = 0
)
group by rental_id;
	