BEGIN;
INSERT INTO person_visits(id, person_id, pizzeria_id, visit_date)

SELECT (SELECT MAX(id) + 1 FROM person_visits),
       (SELECT p.id AS person_id
        FROM person p
        WHERE name = 'Dmitriy'),
       (SELECT m.pizzeria_id
        FROM menu m
        WHERE price < 800
          AND pizzeria_id NOT IN (SELECT id FROM pizzeria WHERE name = 'Papa Johns')
        LIMIT 1),
       DATE '2022-01-08';

COMMIT;

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;