SELECT "districts"."name", "expenditures"."per_pupil_expenditure", "staff_evaluations"."proficient"
FROM "districts"
JOIN "expenditures" ON "districts"."id" = "expenditures"."district_id"
JOIN "staff_evaluations" ON "districts"."id" = "staff_evaluations"."district_id"
WHERE "proficient" >= 50
AND "per_pupil_expenditure" >= (
    SELECT AVG("per_pupil_expenditure")
    FROM "expenditures"
)
ORDER BY "proficient
" DESC, "per_pupil_expenditure" DESC;
