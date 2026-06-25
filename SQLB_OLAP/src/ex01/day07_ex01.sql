SELECT p.name,
       COUNT(pv.id) AS count_of_visits
FROM person_visits pv
         JOIN person p ON p.id = pv.person_id
GROUP BY p.id, p.name

ORDER BY count_of_visits DESC, p.name
LIMIT 4;

-- ВТОРОЙ ВАРИАНТ, КАК ПРАВИЛЬНО??
-- SELECT name,
--        count_of_visits
-- FROM (SELECT p.name,
--              COUNT(pv.*)                                   AS count_of_visits,
--              ROW_NUMBER() OVER (ORDER BY COUNT(pv.*) DESC) AS rn
--       FROM person_visits pv
--                JOIN person p ON p.id = pv.person_id
--       GROUP BY p.name) t
-- WHERE rn <= 4
--
-- ORDER BY count_of_visits DESC, name;