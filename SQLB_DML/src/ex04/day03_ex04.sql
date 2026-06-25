WITH male_visits AS (SELECT pz.name AS pizzeria_name
                     FROM person p
                              INNER JOIN person_order po ON p.id = po.person_id
                              INNER JOIN menu m ON m.id = po.menu_id
                              INNER JOIN pizzeria pz ON pz.id = m.pizzeria_id
                     WHERE p.gender = 'male'),
     female_visits AS (SELECT pz.name AS pizzeria_name
                       FROM person p
                                INNER JOIN person_order po ON p.id = po.person_id
                                INNER JOIN menu m ON m.id = po.menu_id
                                INNER JOIN pizzeria pz ON pz.id = m.pizzeria_id
                       WHERE p.gender = 'female')

    (SELECT pizzeria_name
     FROM female_visits
     EXCEPT
     SELECT pizzeria_name
     FROM male_visits)
UNION

(SELECT pizzeria_name
 FROM male_visits
 EXCEPT
 SELECT pizzeria_name
 FROM female_visits)
ORDER BY pizzeria_name;