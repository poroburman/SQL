--1. select column as new_name from table
SELECT amount AS rental_price
FROM payment;

SELECT SUM(amount) AS net_revenue
FROM payment;

SELECT count(amount) AS num_transactions
FROM payment;

SELECT customer_id, SUM(amount) AS total_spent
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 100;

SELECT customer_id, amount AS new_name
FROM payment
WHERE amount > 2;

--2. practice inner joins
SELECT * FROM payment
INNER JOIN customer
ON payment.customer_id = customer.customer_id;

SELECT payment_id, payment.customer_id, first_name
FROM payment
INNER JOIN customer
ON payment.customer_id = customer.customer_id;

--3. practice outer joins
SELECT * FROM customer
FULL OUTER JOIN payment
ON customer.customer_id = payment.customer_id
WHERE customer.customer_id IS null
OR payment.payment_id IS null;

SELECT COUNT(DISTINCT customer_id) FROM customer;

--4. left outer join
SELECT film.film_id, title, inventory_id
FROM film
LEFT JOIN inventory ON
inventory.film_id = film.film_id
WHERE inventory.film_id IS NULL;

--5. what are the emails of the customers who live in California?
SELECT district, email FROM address
INNER JOIN customer ON
address.address_id = customer.address_id
WHERE district = 'California';

--6. Get a list of all the movies 'Nick Wahlberg' has been in
SELECT title, first_name, last_name FROM actor
INNER JOIN film_actor
ON actor.actor_id = film_actor.actor_id
INNER JOIN film
ON film_actor.film_id = film.film_id
WHERE first_name = 'Nick' AND
last_name = 'Wahlberg';





















