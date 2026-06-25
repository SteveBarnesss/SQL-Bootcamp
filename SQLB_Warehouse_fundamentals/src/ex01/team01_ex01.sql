/*BEGIN;
insert into currency
values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency
values (100, 'EUR', 0.79, '2022-01-08 13:29');
COMMIT;*/

CREATE OR REPLACE FUNCTION get_rate(
    currency_id INTEGER,
    balance_updated TIMESTAMP
)
    RETURNS NUMERIC
    LANGUAGE plpgsql
AS
$$
DECLARE
    rate NUMERIC;
BEGIN
    SELECT coalesce(
                   (SELECT rate_to_usd
                    FROM currency
                    WHERE updated <= balance_updated
                      AND id = currency_id
                    ORDER BY updated DESC
                    LIMIT 1),
                   (SELECT rate_to_usd
                    FROM currency
                    WHERE updated > balance_updated
                      AND id = currency_id
                    ORDER BY updated
                    LIMIT 1))
    INTO rate;
    RETURN rate;
END;
$$;

SELECT DISTINCT coalesce(u.name, 'not defined')              AS "name",
                coalesce(u.lastname, 'not defined')          AS lastname,
                c.name                                       AS currency_name,
                b.money * get_rate(b.currency_id, b.updated) AS currency_in_usd
FROM "user" AS u
         FULL JOIN balance AS b
                   ON u.id = b.user_id
         RIGHT JOIN currency AS c
                    ON b.currency_id = c.id
ORDER BY 1 DESC, 2, 3;