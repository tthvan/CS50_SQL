SELECT "city", COUNT(*) AS "school_num"
FROM "schools"
WHERE type = 'Public School'
GROUP BY "city"
HAVING "school_num" <= 3
ORDER BY "school_num" DESC, "city";
