-- 1. How many actors are there with the last name ‘Wahlberg’?
-- Answer: 2
SELECT first_name, last_name
FROM actor
WHERE last_name = 'Wahlberg';

-- 2. How many payments were made between $3.99 and $5.99?
-- Answer: 5602
SELECT COUNT (amount)
FROM payment
WHERE amount between 3.99 AND 5.99;

-- 3. What film does the store have the most of? (search in inventory)
-- Answer:film id = 1000 / total= 8000 / title = Zorro Ark
SELECT film_id, SUM(film_id), 
FROM inventory
GROUP BY film_id
ORDER BY film_id DESC;

SELECT title, film_id
FROM film
WHERE film_id = 1000;

-- 4. How many customers have the last name ‘William’?
-- Answer: 1
SELECT COUNT(last_name), last_name
FROM customer
WHERE last_name = 'Williams'
GROUP BY last_name;

-- 5. What store employee (get the id) sold the most rentals?
-- Answer: 1 - Mike Hillyer
SELECT COUNT(rental_id), staff_id
FROM rental
GROUP BY staff_id;

SELECT staff_id, first_name, last_name
FROM staff
WHERE staff_id = 1;

-- 6. How many different district names are there?
-- Answer:603
SELECT COUNT(district)
FROM address;

-- 7. What film has the most actors in it? 
-- (use film_actor table and get film_id)
-- Answer:film id = 508/ count = 15/ title = Lambs Cincinatti
SELECT film_id, COUNT(actor_id) AS actor_count
FROM film_actor
GROUP BY film_id
ORDER BY actor_count DESC;

SELECT title
FROM film
WHERE film_id = 508;

-- 8. From store_id 1, how many customers have 
-- a last name ending with ‘es’? (use customer table)
-- Answer:13
SELECT COUNT(last_name)
FROM customer
WHERE store_id = 1 AND last_name LIKE '%es';

-- 9. How many payment amounts (4.99, 5.99, etc.) 
-- had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use group by and having > 250)
-- Answer: I could not find an answer :(
SELECT payment_id, customer_id, rental_id, amount
FROM payment;

SELECT COUNT(amount) AS amount_count, customer_id
FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY customer_id
HAVING customer_id > 250
ORDER BY COUNT(amount) DESC;

-- 10. Within the film table, how many rating categories 
-- are there? And what rating has the most movies total?
-- Answer:5 categories/ PG-13 = 223
SELECT COUNT(rating), rating
FROM film
GROUP BY rating;
