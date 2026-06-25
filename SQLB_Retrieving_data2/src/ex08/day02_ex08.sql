SELECT DISTINCT
    p.name
FROM
    person p
    JOIN person_order po ON po.person_id = p.id
    JOIN menu m ON m.id = po.menu_id
WHERE
    p.gender = 'male'
    AND p.address IN ('Moscow', 'Samara')
    AND m.pizza_name IN ('pepperoni pizza', 'mushroom pizza')
ORDER BY
    p.name DESC;