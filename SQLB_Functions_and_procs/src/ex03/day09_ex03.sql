DROP TRIGGER IF EXISTS trg_person_insert_audit ON person;
DROP FUNCTION IF EXISTS fnc_trg_person_insert_audit();
DROP TRIGGER IF EXISTS trg_person_update_audit ON person;
DROP FUNCTION IF EXISTS fnc_trg_person_update_audit();
DROP TRIGGER IF EXISTS trg_person_delete_audit ON person;
DROP FUNCTION IF EXISTS fnc_trg_person_delete_audit();

DROP TRIGGER IF EXISTS trg_person_audit ON person;
DROP FUNCTION IF EXISTS fnc_trg_person_audit();
DELETE
FROM person_audit;

/*functions called by trigger*/
CREATE OR REPLACE FUNCTION fnc_trg_person_audit()
    RETURNS trigger AS
$person_audit$
BEGIN
    IF (TG_OP = 'INSERT') THEN
        INSERT INTO person_audit SELECT now(), 'I', NEW.*;
    ELSIF (TG_OP = 'UPDATE') THEN
        INSERT INTO person_audit SELECT now(), 'U', OLD.*;
    ELSIF (TG_OP = 'DELETE') THEN
        INSERT INTO person_audit SELECT now(), 'D', OLD.*;
    END IF;
    RETURN NULL;
END;
$person_audit$ LANGUAGE plpgsql;

/*trigger on modif person*/
CREATE TRIGGER trg_person_audit
    AFTER INSERT OR UPDATE OR DELETE
    ON person
    FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_audit();

/*CHECK TRIGGER*/
BEGIN;
INSERT INTO person(id, name, age, gender, address)
VALUES (10, 'Damir', 22, 'male', 'Irkutsk');
UPDATE person
SET name = 'Bulat'
WHERE id = 10;
UPDATE person
SET name = 'Damir'
WHERE id = 10;
DELETE
FROM person
WHERE id = 10;
COMMIT;