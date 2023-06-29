
SELECT
  f.film_id,
  f.title,
  f.release_year,
  f.length,
  f.rating,
  f.rental_duration,
  f.rental_rate,
  f.language_id,
  COUNT(r.rental_id) AS rental_count,
  AVG(f.rental_duration) AS avg_rental_duration,
  AVG(f.rental_rate) AS avg_rental_rate
FROM
  film AS f
JOIN
  inventory AS i ON f.film_id = i.film_id
JOIN
  rental AS r ON i.inventory_id = r.inventory_id
WHERE
  r.rental_date >= '2005-05-01' AND r.rental_date <= '2005-05-31'
GROUP BY
  f.film_id, f.title, f.release_year, f.length, f.rating, f.rental_duration, f.rental_rate, f.language_id;


SELECT 
    film.title,
    CASE WHEN rental.rental_date IS NULL THEN FALSE ELSE TRUE END AS rented_in_may
FROM
    film
LEFT JOIN
    inventory ON film.film_id = inventory.film_id
LEFT JOIN
    rental ON inventory.inventory_id = rental.inventory_id
    AND date_format('year', rental.rental_date) = 2005
    AND date_format('month', rental.rental_date) = 5
GROUP BY
    film.title;






