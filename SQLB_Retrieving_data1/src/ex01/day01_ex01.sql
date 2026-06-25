SELECT object_name
FROM
(
SELECT name AS object_name, 1 AS sort_key
FROM person

UNION ALL

SELECT pizza_name AS object_name, 2 AS sort_key
FROM menu
) t

ORDER BY sort_key, object_name;