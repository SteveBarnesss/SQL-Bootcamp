--Session #1 обновляем рейтинг
BEGIN;
UPDATE pizzeria
SET rating = 5
WHERE name = 'Pizza Hut';

--Session #2 проверяем до COMMIT
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';

COMMIT;

--Session #2 проверяем после COMMIT
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';