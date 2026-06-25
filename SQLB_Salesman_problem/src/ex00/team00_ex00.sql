CREATE VIEW tours AS
(
WITH RECURSIVE cheapest_tours AS (SELECT 'a' AS current, ARRAY ['a'] AS tour, 0 AS total_cost

                                  UNION ALL

                                  SELECT p.point2,
                                         t.tour || p.point2,
                                         t.total_cost + p.cost
                                  FROM cheapest_tours t
                                           JOIN points p ON p.point1 = t.current
                                  WHERE NOT p.point2 = ANY (tour))

SELECT t.total_cost + p.cost     AS total_cost,
       array_append(t.tour, 'a') AS tour
FROM cheapest_tours t
         JOIN points p ON p.point1 = t.current
    AND p.point2 = 'a'
WHERE array_length(t.tour, 1) = (SELECT COUNT(DISTINCT point1)
                                 FROM points)
    );

SELECT total_cost,
       tour
FROM tours
WHERE total_cost = (SELECT min(total_cost)
                    FROM tours)

ORDER BY total_cost, tour;