WITH balance AS (SELECT user_id,
                        SUM(b.money) AS volume,
                        type,
                        currency_id
                 FROM public.Balance b
                 GROUP BY user_id, type, currency_id),
     d_currency AS (SELECT DISTINCT id, name FROM public.Currency),
     last_currency_rate AS (SELECT id, rate_to_usd
                            FROM public.Currency c
                                     JOIN (SELECT id AS currency_id, MAX(updated) AS last_update
                                           FROM public.Currency
                                           GROUP BY currency_id) t
                                          ON c.id = t.currency_id AND t.last_update = c.updated)
SELECT COALESCE(u.name, 'not defined')     AS name,
       COALESCE(u.lastname, 'not defined') AS lastname,
       b.type,
       b.volume,
       COALESCE(dc.name, 'not defined')    AS currency_name,
       COALESCE(lcr.rate_to_usd, 1)        AS last_rate_to_usd,
       volume * COALESCE(rate_to_usd, 1)   AS total_volume_in_usd
FROM public.User u
         FULL JOIN balance b ON b.user_id = u.id
         FULL JOIN d_currency dc ON dc.id = b.currency_id
         FULL JOIN last_currency_rate lcr ON lcr.id = b.currency_id
ORDER BY name DESC, lastname, type;