SELECT m.id AS menu_id
FROM menu m
         LEFT JOIN person_order po ON m.id = po.menu_id
WHERE po.menu_id IS NULL

ORDER BY m.id;

-- SELECT m.id AS menu_id
-- FROM menu m
-- WHERE NOT EXISTS (SELECT 1
--                   FROM person_order po
--                   WHERE po.menu_id = m.id)
-- ORDER BY m.id;