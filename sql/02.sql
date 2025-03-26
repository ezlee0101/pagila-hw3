/*
 * Compute the country with the most customers in it. 
 */

SELECT country
FROM country
WHERE country_id in (
    SELECT country_id
    FROM customer
    JOIN address USING (address_id)
    JOIN city USING (city_id)
    JOIN country USING (country_id)
    GROUP BY country_id, country
    ORDER BY count(customer_id) DESC
    LIMIT 1);
