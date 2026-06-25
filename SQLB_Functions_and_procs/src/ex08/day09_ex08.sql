DROP FUNCTION fnc_fibonacci(pstop integer);
-- RECURSIVE
CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop integer default 10)
    RETURNS TABLE
            (
                fibonacci BIGINT
            )
AS
$$
WITH RECURSIVE fib AS (SELECT 0 AS a, 1 AS b
                       UNION ALL
                       SELECT b, a + b
                       FROM fib
                       WHERE b < pstop)

SELECT a AS fibonacci
FROM fib;
$$
    LANGUAGE sql;

--cycle
-- CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop integer default 10)
--     RETURNS TABLE
--             (
--                 a bigint
--             )
-- AS
-- $$
-- DECLARE
--     b    bigint = 1;
--     temp bigint;
-- BEGIN
--     a := 0;
--     WHILE b < pstop
--         LOOP
--             RETURN NEXT;
--             temp := b + a;
--             a := b;
--             b := temp;
--         END LOOP;
--     RETURN NEXT;
-- END;
-- $$ LANGUAGE plpgsql;

/*CHECK FUNCTION*/
select *
from fnc_fibonacci(100);

select *
from fnc_fibonacci(20);