SELECT d.name, e.per_pupil_expenditure, se.exemplary
FROM "districts" AS d
JOIN "expenditures" AS e
ON d.id = e.district_id
JOIN "staff_evaluations" as se
ON d.id = se.district_id
WHERE d.type = 'Public School District'
	AND e.per_pupil_expenditure > (
			SELECT AVG(expenditures.per_pupil_expenditure)
			FROM "expenditures")
	AND se.exemplary > (
			SELECT AVG(staff_evaluations.exemplary)
			FROM "staff_evaluations")
ORDER BY se.exemplary DESC, e.per_pupil_expenditure DESC;
