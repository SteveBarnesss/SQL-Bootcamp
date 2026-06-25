SELECT gen.generated_date AS missing_date
FROM v_generated_dates AS gen

         LEFT JOIN person_visits pv ON pv.visit_date = gen.generated_date
WHERE visit_date IS null

ORDER BY missing_date;