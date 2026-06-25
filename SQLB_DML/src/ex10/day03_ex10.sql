BEGIN;

INSERT
INTO person_order (id, person_id, menu_id, order_date)

SELECT (SELECT COALESCE(MAX(id), 0) FROM person_order)
           + ROW_NUMBER() OVER (ORDER BY name) AS id,
       p.id                                    AS person_id,
       (SELECT m.id FROM menu m WHERE pizza_name = 'sicilian pizza'),
       DATE '2022-02-24'
FROM person p
WHERE p.name IN ('Denis', 'Irina');

COMMIT;