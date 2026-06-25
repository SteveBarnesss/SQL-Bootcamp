--Session #1 start
BEGIN;
--Session #2 start
BEGIN;

--Session #1 check rating
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';

--Session #2 check rating
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';

--Session #1 update rating
UPDATE pizzeria
SET rating = 4
WHERE name = 'Pizza Hut';

--Session #2 update rating
UPDATE pizzeria
SET rating = 3.6
WHERE name = 'Pizza Hut';

--Session #1
COMMIT;

--Session #2
COMMIT;

--Session #1
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';

--Session #2
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';