--1. Timestamps
SHOW TIMEZONE;

SELECT NOW();

SELECT TIMEOFDAY();

SELECT CURRENT_TIME;

SELECT CURRENT_DATE;

--2. EXTRACT
SELECT EXTRACT(MONTH FROM payment_date) AS pay_month
FROM payment;

SELECT AGE(payment_date)
FROM payment;

SELECT TO_CHAR(payment_date, 'MM/dd/YYYY')
FROM payment;

--3. during which months did payments occur?
SELECT DISTINCT(TO_CHAR(payment_date, 'MONTH'))
FROM payment;

--4. how many payments occurred on a Monday?
SELECT COUNT(*)
FROM payment
WHERE EXTRACT(dow FROM payment_date) = 1;

--5. math
SELECT ROUND(rental_rate/replacement_cost, 2)*100 AS percent_cost
FROM film;

--6. strings
SELECT LENGTH(first_name)
FROM customer;

SELECT first_name || last_name
FROM customer;

SELECT first_name || ' ' || last_name AS full_name
FROM customer;

SELECT first_name || last_name || '@gmail.com'
FROM customer;

SELECT LEFT(first_name,1) || last_name || '@gmail.com'
FROM customer;

SELECT LOWER(LEFT(first_name,1)) || last_name || '@gmail.com'
AS custom_email
FROM customer;

--7. sub query
SELECT title, rental_rate
FROM film
WHERE rental_rate > 
(SELECT AVG(rental_rate) FROM film);

SELECT film_id, title
FROM film
WHERE film_id IN
(SELECT inventory.film_id 
FROM rental
INNER JOIN inventory ON inventory.inventory_id = rental.inventory_id
WHERE return_date BETWEEN '2005-05-29' AND '2005-05-30');

--8. exists operator
SELECT first_name, last_name
FROM customer AS c
WHERE EXISTS
(SELECT * FROM PAYMENT as p
WHERE p.customer_id = c.customer_id
AND amount > 11);

--9. self-join
SELECT f1.title, f2.title, f1.length 
FROM film AS f1
INNER JOIN film AS f2 ON
f1.film_id = f2.film_id
AND f1.length = f2.length










