SELECT "players"."first_name", "players"."last_name", ("salaries"."salary"/"performances"."H") AS "dollars per hit"
FROM "players"
JOIN "salaries" ON "players"."id" = "salaries"."player_id"
JOIN "performances" ON "performances"."player_id" = "players"."id"
WHERE "performances"."H" > 0
AND "performances"."year" = "salaries"."year"
AND "performances"."year" = 2001
ORDER BY "dollars per hit" ASC, "first_name" ASC, "last_name" ASC
LIMIT 10
;
