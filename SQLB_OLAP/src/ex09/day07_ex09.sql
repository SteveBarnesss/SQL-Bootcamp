SELECT address,
       ROUND(MAX(age) - MIN(age)::numeric / MAX(age), 2)    AS formula,
       ROUND(AVG(age), 2)                                   AS average_age,
       (MAX(age) - MIN(age)::numeric / MAX(age)) > AVG(age) AS comparison
FROM person
GROUP BY address
ORDER BY address;


-- можно проверить тип pg_typeof()
-- SELECT pg_typeof(AVG(age))
-- FROM person;

-- SELECT pg_typeof(MAX(age) - MIN(age)::numeric / MAX(age))
-- FROM person;