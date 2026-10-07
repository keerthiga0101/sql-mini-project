BEGIN
DBMS_OUTPUT.PUT_LINE('Result: ' || calculate_energy_balance(9999)); EXCEPTION
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('Error caught: ' || SQLERRM); END;
/
