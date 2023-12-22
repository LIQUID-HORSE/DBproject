--9
CREATE OR REPLACE FUNCTION record_builds_history()
RETURNS TRIGGER AS $$
BEGIN
    IF OLD.name IS DISTINCT FROM NEW.name OR OLD.price IS DISTINCT FROM NEW.price THEN
        INSERT INTO BUILDS_HISTORY(build_type, res_type, name_old, price_old)
        VALUES (OLD.build_type, OLD.res_type, OLD.name, OLD.price);
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER builds_update_trigger
AFTER UPDATE ON BUILDS
FOR EACH ROW
EXECUTE FUNCTION record_builds_history();

CREATE OR REPLACE FUNCTION record_warriors_history()
RETURNS TRIGGER AS $$
BEGIN
    IF OLD.name IS DISTINCT FROM NEW.name OR OLD.price IS DISTINCT FROM NEW.price THEN
        INSERT INTO WARRIORS_HISTORY(warrior_type, res_type, name_old, price_old)
        VALUES (OLD.warrior_type, OLD.res_type, OLD.name, OLD.price);
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER warriors_update_trigger
AFTER UPDATE ON WARRIORS
FOR EACH ROW
EXECUTE FUNCTION record_warriors_history();