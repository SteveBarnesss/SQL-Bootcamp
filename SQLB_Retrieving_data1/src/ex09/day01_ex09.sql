SELECT name
FROM pizzeria
-- если есть хотя бы один NULL,
-- может вернуть пустой результат
WHERE pizzeria.id NOT IN (
    SELECT pizzeria_id
    FROM person_visits
);


SELECT name
FROM pizzeria
-- нет проблемы с NULL
WHERE NOT EXISTS (
    SELECT pizzeria_id
    FROM person_visits pv
    WHERE pizzeria.id = pv.pizzeria_id
);

/*
| `IN`                             | `EXISTS`                             |
| -------------------------------- | ------------------------------------ |
| Сравнивает значение со списком   | Проверяет существование строки       |
| Хорош для маленьких списков      | Хорош для больших таблиц             |
| Сначала строит весь список       | Останавливается на первом совпадении |
| Может ломаться из-за `NULL`      | Безопасен с `NULL`                   |
| Чаще медленнее на больших данных | Обычно быстрее                       |
*/