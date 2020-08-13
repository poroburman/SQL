-- 1. how many payments did each staff member handle
SELECT staff_id, COUNT(payment_id) FROM payment
GROUP BY staff_id;

-- 2. what is the average replacement cost per MPAA rating?
SELECT rating, ROUND(AVG(replacement_cost),2)
FROM film
GROUP BY rating;

-- 3. what are the customer ids of the top 5 customers by total spend?
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC
LIMIT 5;

-- 4. which customers have 40 or more transaction payments?
SELECT customer_id, COUNT(*) 
FROM payment
GROUP BY customer_id
HAVING COUNT(*) >= 40;

-- 5. what are customer ids of customers who have spent more than $100 
--    in payment transactions with our staff_id member 2?
SELECT customer_id, staff_id, SUM(amount)
FROM payment
WHERE staff_id = 2
GROUP BY customer_id, staff_id
HAVING SUM(amount) > 100
















