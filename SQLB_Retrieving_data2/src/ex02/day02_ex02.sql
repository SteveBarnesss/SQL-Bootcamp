WITH pv_filtered AS (
    SELECT
        *
    FROM
        person_visits
    WHERE
        visit_date BETWEEN '2022-01-01'
        AND '2022-01-03'
)
SELECT
    COALESCE(p.name, '-') AS person_name,
    pv.visit_date,
    COALESCE(pz.name, '-') AS pizzeria_name
FROM
    person p
    FULL OUTER JOIN pv_filtered pv ON p.id = pv.person_id
    FULL OUTER JOIN pizzeria pz ON pz.id = pv.pizzeria_id
ORDER BY
    person_name,
    pizzeria_name,
    visit_date;

-- второй вариант без CTE
-- SELECT
--     COALESCE(p.name, '-') AS person_name,
--     pv.visit_date,
--     COALESCE(pz.name, '-') AS pizzeria_name
-- FROM person p
-- FULL OUTER JOIN (
--     SELECT *
--     FROM person_visits
--     WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03'
-- ) pv
--     ON p.id = pv.person_id
-- FULL OUTER JOIN pizzeria pz
--     ON pz.id = pv.pizzeria_id
-- ORDER BY
--     person_name,
--     pizzeria_name,
--     visit_date;