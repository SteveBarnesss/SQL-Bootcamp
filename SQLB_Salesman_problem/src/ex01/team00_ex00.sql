SELECT total_cost,
       tour
FROM tours
WHERE total_cost = (SELECT min(total_cost)
                    FROM tours)
   OR total_cost = (SELECT max(total_cost)
                    FROM tours)

ORDER BY total_cost, tour;