CREATE VIEW june_vacancies AS
SELECT listings.id, property_type, host_name, count(date) AS days_vacant
FROM listings
JOIN availabilities ON listings.id = availabilities.listing_id
WHERE date < '2023-07-01'
AND date >= '2023-06-01'
AND availabilities.available = 'TRUE'
GROUP BY listing_id;

