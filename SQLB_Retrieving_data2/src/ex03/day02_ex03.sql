WITH dates AS (
    SELECT
        generate_series(
            '2022-01-01' :: date,
            '2022-01-10' :: date,
            '1 day'
        ) :: date AS missing_date
)
SELECT
    dates.missing_date
FROM
    dates
    LEFT JOIN person_visits pv ON pv.visit_date = dates.missing_date
    AND (
        pv.person_id = 1
        OR pv.person_id = 2
    )
WHERE
    pv.visit_date IS NULL
ORDER BY
    missing_date;