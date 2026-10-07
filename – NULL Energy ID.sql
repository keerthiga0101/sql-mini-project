BEGIN
DBMS_OUTPUT.PUT_LINE('Result: ' || calculate_energy_balance(NULL)); EXCEPTION
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('Error caught: ' || SQLERRM); END;
/
