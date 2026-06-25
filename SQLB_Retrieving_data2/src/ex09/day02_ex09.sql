SELECT
    p.name
FROM
    person p
    JOIN person_order po ON po.person_id = p.id
    JOIN menu m ON m.id = po.menu_id
WHERE
    p.gender = 'female'
    AND m.pizza_name IN ('pepperoni pizza', 'cheese pizza') -- группирую по людям
GROUP BY
    p.id,
    p.name -- оставляю только людей у которых обе пиццы
HAVING
    COUNT(DISTINCT m.pizza_name) = 2
ORDER BY
    p.name;