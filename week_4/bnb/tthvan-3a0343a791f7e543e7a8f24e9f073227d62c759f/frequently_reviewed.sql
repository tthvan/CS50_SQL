CREATE VIEW frequently_reviewed AS
SELECT listings.id, property_type, host_name, count(comments) as reviews
FROM listings
JOIN reviews on listings.id = reviews.listing_id
GROUP BY listing_id
ORDER BY reviews.date DESC
LIMIT 100;
