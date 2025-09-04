WITH top10_by_hit AS(
        SELECT
                "players"."id" AS "player_id",
                "players"."first_name",
                "players"."last_name",
                ("salaries"."salary"/"performances"."H") AS "dollars per hit"
        FROM "players"
        JOIN "salaries" ON "players"."id" = "salaries"."player_id"
        JOIN "performances" ON "performances"."player_id" = "players"."id"
        WHERE "performances"."H" > 0
        AND "performances"."year" = "salaries"."year"
        AND "performances"."year" = 2001
        ORDER BY "dollars per hit" ASC, "first_name" ASC, "last_name" ASC
        LIMIT 10
),

top10_by_RBI AS(
        SELECT
                "players"."id" AS "player_id",
                "players"."first_name",
                "players"."last_name",
                ("salaries"."salary"/"performances"."RBI") AS "dollars per RBI"
        FROM "players"
        JOIN "salaries" ON "players"."id" = "salaries"."player_id"
        JOIN "performances" ON "performances"."player_id" = "players"."id"
        WHERE "performances"."RBI" > 0
        AND "performances"."year" = "salaries"."year"
        AND "performances"."year" = 2001
        ORDER BY "dollars per RBI" ASC, "first_name" ASC, "last_name" ASC
        LIMIT 10
)

SELECT
        "top10_by_hit"."first_name",
        "top10_by_hit"."last_name"
FROM "top10_by_hit"
JOIN "top10_by_RBI" ON "top10_by_hit"."player_id" = "top10_by_RBI"."player_id"
ORDER BY "top10_by_hit"."last_name"
;
