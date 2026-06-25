BEGIN;

WITH order_info AS (SELECT po.person_id,
                           m.pizzeria_id,
                           COUNT(*) AS order_count
                    FROM person_order po
                             JOIN menu m ON po.menu_id = m.id
                    GROUP BY po.person_id, m.pizzeria_id)

INSERT
INTO person_discounts(id, person_id, pizzeria_id, discount)

SELECT ROW_NUMBER() OVER () AS id,
       oi.person_id,
       oi.pizzeria_id,
       CASE
           WHEN oi.order_count = 1 THEN 10.5
           WHEN oi.order_count = 2 THEN 22
           ELSE 30
           END              AS discount
FROM order_info oi;

SELECT *
FROM person_discounts;

COMMIT;