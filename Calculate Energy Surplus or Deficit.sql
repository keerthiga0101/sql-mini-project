CREATE OR REPLACE FUNCTION calculate_energy_balance (p_energy_id IN NUMBER)
RETURN NUMBER IS
v_generated energy_data.generated_energy%TYPE; v_consumed energy_data.consumed_energy%TYPE;
BEGIN
IF p_energy_id IS NULL THEN
RAISE_APPLICATION_ERROR(-20002, 'Energy ID cannot be NULL.'); END IF;
SELECT generated_energy, consumed_energy INTO v_generated, v_consumed
FROM  energy_data
WHERE energy_id = p_energy_id; RETURN v_generated - v_consumed;
EXCEPTION
WHEN NO_DATA_FOUND THEN RAISE_APPLICATION_ERROR(-20001, 'Energy ID not found');
END calculate_energy_balance;
/
