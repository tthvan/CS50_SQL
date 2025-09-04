-- Find info on a UNI name is somewhat 'Dundee'
SELECT * FROM general_view
WHERE uni_name LIKE '%Dundee%';

-- Find list of schools in the USA, ranked by ranking and tuition
SELECT * FROM general_view
WHERE country_name = 'United States'
ORDER BY rank ASC, fee_usd_avg DESC;

-- Find UNI: tuition < 20,000 USD, in Canada, ranking < 500
SELECT * FROM general_view
WHERE country_name = 'Canada'
AND fee_usd_avg < 20000
AND rank < 500;

-- Find the evaluations (scores) for York University
SELECT * FROM scoring_stats
WHERE uni_id = (
	SELECT id FROM general_view
	WHERE uni_name = 'York University');

-- Find the evaluations (scores) for University of British Columbia and University of Alberta
-- (2 TOP Uni in Canada) for comparison
SELECT
	g.id,
	g.uni_name,
	g.fee_usd_avg,
	g.rank,
	s.name AS metric,
	s.score
FROM general_view g
JOIN scoring_stats s
ON g.id = s.uni_id
WHERE g.uni_name = 'University of British Columbia'
OR g.uni_name = 'University of Alberta'
AND s.year = 2024
ORDER BY s.name;

-- Compute annual total costs for a year to study in Germany vs France, by UNI
SELECT
	u.name AS uni_name,
	c.name AS country_name,
	g.fee_usd_avg AS tuition,
	s.rent_discounted AS rent,
	(g.fee_usd_avg + s.rent_discounted*12) AS total_cost
FROM universities u
JOIN country_stats s ON u.country_id = s.id
JOIN countries c ON c.id = u.country_id
JOIN general_view g ON u.id = g.id
WHERE c.name = 'Germany'
OR c.name = 'France'
ORDER BY total_cost ASC;

-- Rank annual total costs in different countries, aggregated
SELECT
	c.name AS country_name,
	ROUND(AVG(g.fee_usd_avg),2) AS avg_tuition,
	ROUND(AVG(s.rent_discounted),2) AS avg_rent,
	ROUND((AVG(g.fee_usd_avg) + AVG(s.rent_discounted)*12),2) AS annual_total_cost
FROM country_stats s
JOIN countries c ON c.id = s.country_id
JOIN general_view g ON g.country_id = c.id
GROUP BY c.name
ORDER BY annual_total_cost ASC;

SELECT * FROM scoring_stats ORDER BY uni_id;
WHERE name LIKE '%'

-- Find the best affordable Uni <20000USD with a high Employment score in Canada
SELECT
	g.uni_name,
	g.country_name,
	g.fee_usd_avg,
	g.rank,
	s.name AS metric,
	s.score
FROM general_view g
JOIN scoring_stats s ON g.id = s.uni_id
WHERE s.year = 2024
AND g.fee_usd_avg < 20000
AND g.country_name = 'Canada'
AND s.name = 'Employer Reputation'
ORDER BY s.score DESC;
