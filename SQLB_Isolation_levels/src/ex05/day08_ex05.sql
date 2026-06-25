--Session #1 start
BEGIN;

--Session #2 start
BEGIN;

--Session #1 check sum rating
SELECT SUM(rating)
FROM pizzeria;

--Session #2 update pizzeria table
INSERT INTO pizzeria(id, name, rating)
SELECT 10,
       'Kazan Pizza',
       5
           COMMIT;

--Session #1 check sum rating
SELECT SUM(rating)
FROM pizzeria COMMIT;

--Session #1 check sum rating
SELECT SUM(rating)
FROM pizzeria;

--Session #2 check sum rating
SELECT SUM(rating)
FROM pizzeria;