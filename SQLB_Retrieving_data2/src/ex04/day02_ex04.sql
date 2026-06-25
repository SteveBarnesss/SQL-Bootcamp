SELECT
    m.pizza_name,
    pz.name AS pizzeria_name,
    m.price
FROM
    menu m
    JOIN pizzeria pz 
    ON m.pizzeria_id = pz.id
    WHERE m.pizza_name IN ('mushroom pizza' , 'pepperoni pizza')
ORDER BY pizza_name, pizzeria_name;

-- SELECT pizza_name, pizzeria.name FROM menu
-- JOIN pizzeria ON pizzeria_id = pizzeria.id
-- WHERE pizza_name IN ('mushroom pizza','pepperoni pizza');