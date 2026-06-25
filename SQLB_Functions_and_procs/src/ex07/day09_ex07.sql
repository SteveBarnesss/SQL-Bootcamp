DROP FUNCTION IF EXISTS func_minimum();

CREATE OR REPLACE FUNCTION func_minimum(VARIADIC arr numeric[])
    RETURNS numeric
AS
$$
DECLARE
    i   int;
    min int;
BEGIN
    FOREACH i IN ARRAY arr
        LOOP
            IF min IS NULL OR i < min THEN
                min := i;
            END IF;
        END LOOP;
    RETURN min;
END;
$$ LANGUAGE plpgsql;

--CHECK FUNCTION
SELECT func_minimum(VARIADIC arr => ARRAY [10.0, -1.0, 5.0, 4.4]);

/* ВТОРОЙ ВАРИАНТ РЕШЕНИЯ
 DROP FUNCTION IF EXISTS func_minimum1();
CREATE OR REPLACE FUNCTION func_minimum1(VARIADIC arr numeric[])
    RETURNS numeric
AS
$$
SELECT min(x)
FROM unnest(arr) x;
$$ LANGUAGE sql;
--CHECK FUNCTION
SELECT func_minimum1(VARIADIC arr => ARRAY [10.0, -1.0, 5.0, 4.4]);
ВТОРОЙ ВАРИАНТ РЕШЕНИЯ */