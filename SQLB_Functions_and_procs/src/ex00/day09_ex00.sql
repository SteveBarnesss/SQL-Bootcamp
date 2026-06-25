CREATE TABLE person_audit
(
    created    timestamp with time zone not null default now(),
    type_event char(1)                  not null default 'I',
    row_id     bigint                   NOT NULL,
    name       varchar,
    age        integer,
    gender     varchar,
    address    varchar,
    constraint ch_type_event
        CHECK (type_event IN ('I', 'U', 'D'))
);

/*functions called by trigger*/
CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit()
    RETURNS trigger AS
$person_audit$
BEGIN
    IF (TG_OP = 'INSERT') THEN
        INSERT INTO person_audit SELECT now(), 'I', NEW.*;
    END IF;
    RETURN NULL;
END;
$person_audit$ LANGUAGE plpgsql;

/*trigger on insert into person*/
CREATE TRIGGER trg_person_insert_audit
    AFTER INSERT
    ON person
    FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_insert_audit();

/*CHECK TRIGGER*/
BEGIN;
INSERT INTO person(id, name, age, gender, address)
VALUES (10, 'Damir', 22, 'male', 'Irkutsk');
COMMIT;