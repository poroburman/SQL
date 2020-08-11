-- 1. from customer table in the dvd rentals database, use SELECT statement to grab the first 
--     and last names of every customer and their email addresses
SELECT last_name, first_name, email FROM customer;

-- 2. retrieve distinct rating types our films could have in our database
SELECT DISTINCT(rating) FROM film;

-- 3. select all columns from customer table and pull out information for Jared
SELECT * FROM customer
WHERE FIRST_NAME = 'Jared';

-- 4. look at the film table and select the rental greater than 4, replacement_cost >= 19.99, and rating = 'R'
SELECT * FROM film
WHERE rental_rate > 4 AND replacement_cost >= 19.99
AND rating='R';

-- 5. find the number of movies with the above criteria
SELECT COUNT(*) FROM film
WHERE rental_rate > 4 AND replacement_cost >= 19.99
AND rating='R';

-- 6. select movies which have either R or PG13 rating
SELECT COUNT(*) FROM film
WHERE rating = 'R' OR rating = 'PG-13';

-- 7. what is the email for the customer with the name Nancy Thomas
SELECT first_name, last_name, email from customer
WHERE first_name = 'Nancy' AND last_name = 'Thomas';

-- 8. give the description for the movie "Outlaw Hanky"
SELECT title, description FROM film
WHERE title = 'Outlaw Hanky';

-- 9. get the phone number for customer who lives at '259 Ipoh Drive'
SELECT address, phone FROM address
WHERE address = '259 Ipoh Drive';

-- 10. what are the customer ids of the first 10 customers who created a payment?
SELECT payment_date, customer_id FROM payment
ORDER BY payment_date ASC
LIMIT 10;

-- 11. what are the titles of the 5 shortest (in length of runtime) movies?
SELECT length, title FROM film
ORDER by length ASC
LIMIT 5;

-- 12. how many movies have run time 50 minutes or less?
SELECT COUNT(title) FROM film
WHERE length <= 50;

-- 13. how many paymnet transactions were greater than $5?
SELECT COUNT(amount) FROM payment
WHERE amount > 5;

-- 14 how many actors have a first name that astarts with letter P?
SELECT COUNT(first_name) FROM actor
WHERE first_name LIKE 'P%';

-- 15 how many unique districts are our customers from?
SELECT COUNT(DISTINCT(district)) FROM address;

-- 16. retrieve list of names for those distinct districts
SELECT DISTINCT(district) FROM address;

-- 17. how many films have a rating of R and a replacement cost between $5 and $15?
SELECT COUNT(*) FROM film
WHERE rating = 'R' AND replacement_cost BETWEEN 5 AND 15;

-- 18. how many films have the word Truman somewhere in the title?
SELECT COUNT(*) FROM film
WHERE title LIKE '%Truman%';












































