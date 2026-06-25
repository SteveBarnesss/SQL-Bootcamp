WITH orders_top AS (SELECT pz.name,
                           COUNT(*) AS count
                    FROM person_order po
                             JOIN menu m ON m.id = po.menu_id
                             JOIN pizzeria pz ON pz.id = m.pizzeria_id
                    GROUP BY name),
     visits_top AS (SELECT pz.name,
                           COUNT(*) AS count
                    FROM pizzeria pz
                             JOIN person_visits pv ON pv.pizzeria_id = pz.id
                    GROUP BY name)

SELECT COALESCE(ot.name, vt.name)                    AS name,
       COALESCE(ot.count, 0) + COALESCE(vt.count, 0) AS total_count
FROM orders_top ot
         FULL JOIN visits_top vt ON vt.name = ot.name
ORDER BY total_count DESC, name ASC;