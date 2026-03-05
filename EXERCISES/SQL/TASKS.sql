-- 1.
SELECT first_name,
       last_name,
       max(datediff(day, rental_date, ISNULL(return_date, SYSDATETIME()))) AS longest_rental
FROM customer
         INNER JOIN rental ON customer.customer_id = rental.customer_id
GROUP BY first_name, last_name
ORDER BY longest_rental DESC;

-- 2.
SELECT first_name, last_name, SUM(amount) AS spending
FROM customer
         INNER JOIN payment ON customer.customer_id = payment.customer_id
WHERE activebool = 1
GROUP BY first_name, last_name
HAVING SUM(amount) >= 100;

-- 3.
SELECT title, name
FROM film
         INNER JOIN film_category ON film.film_id = film_category.film_id
         INNER JOIN category ON film_category.category_id = category.category_id
WHERE rating = (SELECT MAX(rating)
                FROM film
                         INNER JOIN film_category ON film.film_id = film_category.film_id
                WHERE film_category.category_id = category.category_id);

-- 4.
SELECT first_name, last_name
FROM actor
GROUP BY first_name, last_name
HAVING COUNT(1) = (SELECT MAX(y.count)
                   FROM (SELECT COUNT(1) as count
                         FROM film_actor
                         GROUP BY actor_id) y);

-- 5.
SELECT name, AVG(rental_rate)
FROM category
         INNER JOIN film_category ON category.category_id = film_category.category_id
         INNER JOIN film ON film_category.film_id = film.film_id
GROUP BY name;

SELECT name, AVG(amount)
FROM category
         INNER JOIN film_category ON category.category_id = film_category.category_id
         INNER JOIN film ON film_category.film_id = film.film_id
         INNER JOIN inventory ON film.film_id = inventory.film_id
         INNER JOIN rental ON inventory.inventory_id = rental.inventory_id
         INNER JOIN payment ON rental.rental_id = payment.rental_id
GROUP BY name;

-- 6.
SELECT name, COUNT(1)
FROM language
         LEFT JOIN film ON language.language_id = film.language_id
GROUP BY name
ORDER BY COUNT(1) DESC;

-- 7.
SELECT first_name, last_name, amount
FROM staff
         INNER JOIN payment ON staff.staff_id = payment.staff_id
WHERE payment_date = (SELECT MIN(payment_date) FROM payment WHERE payment.staff_id = staff.staff_id);

-- 8.
SELECT title, length, NTILE(4) over (ORDER BY length)
FROM film;

-- 9.
SELECT customer.customer_id, MONTH(rental_date) AS month, COUNT(1) AS rentals
FROM customer
         INNER JOIN rental ON customer.customer_id = rental.customer_id
WHERE YEAR(rental_date) = YEAR(SYSDATETIME()) - 1
GROUP BY customer.customer_id, MONTH(rental_date)
ORDER BY customer.customer_id, month

-- 10.
SELECT MONTH(payment_date) AS month, AVG(amount) AS average_payment
FROM payment
GROUP BY MONTH(payment_date)
ORDER BY average_payment DESC;
