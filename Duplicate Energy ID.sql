BEGIN
INSERT INTO energy_data
VALUES (1, DATE '2026-02-01', 'Solar', 100, 80, 'Chennai'); EXCEPTION
WHEN DUP_VAL_ON_INDEX THEN
DBMS_OUTPUT.PUT_LINE('Duplicate energy ID not allowed.'); END;
/
