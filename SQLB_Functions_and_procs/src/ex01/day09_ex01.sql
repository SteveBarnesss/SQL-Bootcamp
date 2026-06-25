/*functions called by trigger*/
CREATE OR REPLACE FUNCTION fnc_trg_person_update_audit()
    RETURNS trigger AS
$person_audit$
BEGIN
    IF (TG_OP = 'UPDATE') THEN
        INSERT INTO person_audit SELECT now(), 'U', OLD.*;
    END IF;
    RETURN NULL;
END;
$person_audit$ LANGUAGE plpgsql;

/*trigger on update person*/
CREATE TRIGGER trg_person_update_audit
    AFTER UPDATE
    ON person
    FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_update_audit();

/*CHECK TRIGGER*/
BEGIN;
UPDATE person
SET name = 'Bulat'
WHERE id = 10;
UPDATE person
SET name = 'Damir'
WHERE id = 10;
COMMIT;