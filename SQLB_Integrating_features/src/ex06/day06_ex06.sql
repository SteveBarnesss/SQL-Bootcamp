CREATE sequence seq_person_discounts
    INCREMENT BY 1;

SELECT setval
       (
               'seq_person_discounts',
               (SELECT /*COUNT(*)или так*/ COALESCE(MAX(id), 0) FROM person_discounts)
       );

ALTER TABLE person_discounts
    ALTER COLUMN id SET DEFAULT nextval('seq_person_discounts');

/* CHECK  */
-- BEGIN;
-- INSERT INTO person_discounts(person_id, pizzeria_id, discount)
-- VALUES (9, 4, 30);
--
-- SELECT *
-- FROM person_discounts;
-- ROLLBACK;
--
--
-- ALTER TABLE person_discounts
--     ALTER COLUMN id DROP DEFAULT;