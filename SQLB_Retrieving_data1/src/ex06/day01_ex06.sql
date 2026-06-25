SELECT t.action_date, p.name AS person_name

FROM
(

SELECT order_date AS action_date, person_id FROM person_order

INTERSECT

SELECT visit_date AS action_date, person_id FROM person_visits

) t

JOIN person p ON p.id = t.person_id

ORDER BY 
action_date ASC, 
person_name DESC;