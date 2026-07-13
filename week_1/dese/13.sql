SELECT s.name, gr.graduated, e.per_pupil_expenditure
FROM "schools" AS s
JOIN "graduation_rates" AS gr
ON s.id = gr.school_id
JOIN "expenditures" AS e
ON s.district_id = e.district_id
WHERE e.per_pupil_expenditure > (
			SELECT AVG(expenditures.per_pupil_expenditure)
			FROM "expenditures")
ORDER BY gr.graduated DESC, s.name ASC;
