SELECT pz.name,
       COUNT(po.*)            AS count_of_orders,
       ROUND(AVG(m.price), 2) AS average_price,
       MAX(m.price)           AS max_price,
       MIN(m.price)           AS min_price
FROM person_order po
         JOIN menu m ON m.id = po.menu_id
    /*
    FULL если нужно учитывать без заказа пиццерии,
    но тогда и начинать надо с pizzeria
    */
         JOIN pizzeria pz ON pz.id = m.pizzeria_id
GROUP BY pz.name

ORDER BY pz.name;