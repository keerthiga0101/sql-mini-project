CREATE OR REPLACE PROCEDURE daily_energy_report IS
v_count NUMBER := 0; BEGIN
DBMS_OUTPUT.PUT_LINE('DAILY ENERGY REPORT');
DBMS_OUTPUT.PUT_LINE(RPAD('DATE', 14) || RPAD('GENERATED', 12) || 'CONSUMED');
FOR r IN (SELECT energy_date,
SUM(generated_energy) AS total_generated, SUM(consumed_energy) AS total_consumed
FROM energy_data GROUP BY energy_date ORDER BY energy_date)
LOOP
v_count := v_count + 1; DBMS_OUTPUT.PUT_LINE(RPAD(TO_CHAR(r.energy_date, 'DD-MON-YYYY'),
14) ||
RPAD(r.total_generated, 12) || r.total_consumed);
END LOOP;
IF v_count = 0 THEN
RAISE_APPLICATION_ERROR(-20003, 'No energy data available.'); END IF;
END daily_energy_report;
/
