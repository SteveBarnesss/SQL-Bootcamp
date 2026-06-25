SELECT * FROM person

CROSS JOIN pizzeria

ORDER BY person.id;

-- второй способ

-- SELECT *
-- FROM person, pizzeria
-- ORDER by person.id;