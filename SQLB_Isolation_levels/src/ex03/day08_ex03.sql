--Session #1 start
BEGIN;
SHOW TRANSACTION ISOLATION LEVEL;

--Session #2 start
BEGIN;
SHOW TRANSACTION ISOLATION LEVEL;

--Session #1 check rating
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';

--Session #2 обновляем рейтинг
UPDATE pizzeria
SET rating = 3.6
WHERE name = 'Pizza Hut';
COMMIT;

--Session #1 check rating
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';
COMMIT;

--Session #1 check rating
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';

--Session #2 check rating
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';