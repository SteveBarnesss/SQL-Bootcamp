SELECT 
    (SELECT name
    FROM person
    WHERE person.id = person_order.person_id
    ) AS NAME
FROM person_order
WHERE menu_id IN (13,14,18)
AND order_date = '2022-01-07';

-- -- второй способ
-- SELECT person.name AS NAME
-- FROM person_order
-- JOIN person
-- ON person.id = person_order.person_id
-- WHERE menu_id IN (13,14,18)
-- AND order_date = '2022-01-07';