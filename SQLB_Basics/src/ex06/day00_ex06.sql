SELECT
    (SELECT name
    FROM person
    WHERE person.id = person_order.person_id
    ) AS NAME,
    CASE
        WHEN (SELECT name
              FROM person
              WHERE person.id = person_order.person_id
            ) = 'Denis'
        THEN true
        ELSE false
        END AS CHECK_NAME

FROM person_order
WHERE menu_id IN (13,14,18)
AND order_date = '2022-01-07';

-- второй способ
-- SELECT
--     (SELECT person.name
--        FROM person_order 
--       WHERE (person_order.menu_id = 13 OR person_order.menu_id = 14 OR person_order.menu_id = 18) 
--         AND person_order.order_date = '2022-01-07'
--         AND person_order.person_id = person.id) AS NAME,
--     (name = 'Denis') AS check_name
-- FROM person;