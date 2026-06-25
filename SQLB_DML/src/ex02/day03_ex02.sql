SELECT
    m.pizza_name,
    m.price,
    pz.name
FROM
    menu m
    LEFT JOIN person_order po ON m.id = po.menu_id
    JOIN pizzeria pz ON pz.id = m.pizzeria_id
WHERE
    po.menu_id IS NULL
ORDER BY
    m.pizza_name,
    m.price;