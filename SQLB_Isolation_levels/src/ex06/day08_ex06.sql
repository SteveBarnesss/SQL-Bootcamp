--Session #1 start
BEGIN;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

--Session #2 start
BEGIN;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

--Session #1 check sum rating
SELECT SUM(rating)
FROM pizzeria;

--Session #2 update pizzeria table
INSERT INTO pizzeria(id, name, rating)
SELECT 11,
       'Kazan Pizza 2',
       4
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