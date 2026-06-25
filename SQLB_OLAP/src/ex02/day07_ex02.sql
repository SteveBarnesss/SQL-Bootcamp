WITH visits_orders_top AS ((SELECT pz.name,
                                   COUNT(*) AS count,
                                   'order'  AS action_type
                            FROM person_order po
                                     JOIN menu m ON m.id = po.menu_id
                                     JOIN pizzeria pz ON pz.id = m.pizzeria_id
                            GROUP BY name
                            ORDER BY count DESC
                            LIMIT 3)

                           UNION ALL

                           (SELECT pz.name,
                                   COUNT(*) AS count,
                                   'visit'  AS action_type
                            FROM pizzeria pz
                                     JOIN person_visits pv ON pv.pizzeria_id = pz.id
                            GROUP BY name
                            ORDER BY count DESC
                            LIMIT 3))
SELECT name, count, action_type
FROM visits_orders_top
ORDER BY action_type, count DESC;