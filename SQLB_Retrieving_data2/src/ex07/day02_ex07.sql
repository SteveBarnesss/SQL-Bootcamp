SELECT
    pz.name
FROM
    pizzeria pz
    JOIN menu m ON m.pizzeria_id = pz.id
    JOIN person_visits pv ON pv.pizzeria_id = pz.id
    JOIN person p ON pv.person_id = p.id
WHERE
    p.name = 'Dmitriy'
    AND m.price < 800
    AND pv.visit_date = '2022-01-08'