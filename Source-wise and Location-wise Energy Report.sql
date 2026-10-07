CREATE OR REPLACE PROCEDURE energy_source_location_report IS
v_count NUMBER := 0; 
BEGIN
DBMS_OUTPUT.PUT_LINE('SOURCE-WISE AND LOCATION-WISE ENERGY REPORT');
DBMS_OUTPUT.PUT_LINE(RPAD('SOURCE', 10) || RPAD('LOCATION', 14) || 'TOTAL GENERATED');
FOR r IN (SELECT energy_source, location, SUM(generated_energy) AS total_generated
FROM  energy_data
GROUP BY energy_source, location ORDER BY energy_source, location)
LOOP
v_count := v_count + 1;
DBMS_OUTPUT.PUT_LINE(RPAD(r.energy_source, 10) || RPAD(r.location, 14) || r.total_generated);
END LOOP;
IF v_count = 0 THEN
RAISE_APPLICATION_ERROR(-20004, 'No energy data available.'); END IF;
END energy_source_location_report;
/
