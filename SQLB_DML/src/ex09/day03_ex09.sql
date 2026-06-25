BEGIN;

INSERT
INTO person_visits (id, person_id, pizzeria_id, visit_date)
-- по идее можно без СOALESCE, это на тот случай если id NULL
SELECT (SELECT COALESCE(MAX(id), 0) FROM person_visits) +
       ROW_NUMBER() OVER (ORDER BY name)                AS id,
       p.id                                             AS person_id,
       (SELECT id FROM pizzeria WHERE name = 'Dominos') AS pizzeria_id,
       DATE '2022-02-24'
FROM person p
WHERE p.name IN ('Denis', 'Irina');

COMMIT;