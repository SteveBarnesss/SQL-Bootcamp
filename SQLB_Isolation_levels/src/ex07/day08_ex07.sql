--Session #1 start
BEGIN;
--Session #2 start
BEGIN;

--Session #1 update
UPDATE pizzeria
SET rating = 2
WHERE id = 1;
--Session #2 update
UPDATE pizzeria
SET rating = 3
WHERE id = 2;
--Session #1 update
UPDATE pizzeria
SET rating = 2
WHERE id = 2;
--Session #2 update
UPDATE pizzeria
SET rating = 3
WHERE id = 1;

--session #1
COMMIT;
--session #2
COMMIT;

--Session #1 check
SELECT rating
FROM pizzeria
WHERE id = 1
   OR id = 2;
--Session #2 check
SELECT rating
FROM pizzeria
WHERE id = 1
   OR id = 2;