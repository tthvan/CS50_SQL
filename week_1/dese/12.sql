SELECT "districts"."name", "expenditures"."per_pupil_expenditure", "staff_evaluations"."exemplary"
FROM "districts"
JOIN "expenditures" ON "districts"."id" = "expenditures"."district_id"
JOIN "staff_evaluations" ON "districts"."id" = "staff_evaluations"."district_id"
WHERE "exemplary" >= (
    SELECT AVG("exemplary")
    FROM staff_evaluations
)
AND districts.type = 'Public School District'
AND "per_pupil_expenditure" >= (
    SELECT AVG("per_pupil_expenditure")
    FROM "expenditures"
)
ORDER BY "exemplary" DESC, "per_pupil_expenditure" DESC;
