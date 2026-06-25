/*functions called by trigger*/
CREATE OR REPLACE FUNCTION fnc_trg_person_delete_audit()
    RETURNS trigger AS
$person_audit$
BEGIN
    IF (TG_OP = 'DELETE') THEN
        INSERT INTO person_audit SELECT now(), 'D', OLD.*;
    END IF;
    RETURN NULL;
END;
$person_audit$ LANGUAGE plpgsql;

/*trigger on update person*/
CREATE TRIGGER trg_person_delete_audit
    AFTER DELETE
    ON person
    FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_delete_audit();

/*CHECK TRIGGER*/
BEGIN;
DELETE
FROM person
WHERE id = 10;
COMMIT;