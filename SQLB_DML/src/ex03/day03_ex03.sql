WITH male_visits AS(
    SELECT pz.name AS pizzeria_name
    FROM person_visits pv
    JOIN person p ON p.id = pv.person_id  
    JOIN pizzeria pz ON pv.pizzeria_id = pz.id
    WHERE p.gender = 'male'
), female_visits AS (
      SELECT pz.name AS pizzeria_name
    FROM person_visits pv
    JOIN person p ON p.id = pv.person_id  
    JOIN pizzeria pz ON pv.pizzeria_id = pz.id
    WHERE p.gender = 'female'
)

(
SELECT pizzeria_name
FROM female_visits

EXCEPT ALL 

SELECT pizzeria_name
FROM male_visits
)

UNION ALL

(
SELECT pizzeria_name
FROM male_visits

EXCEPT ALL 

SELECT pizzeria_name
FROM female_visits
)

ORDER BY pizzeria_name;