SET SERVEROUTPUT ON;

CREATE OR REPLACE FUNCTION factorial(n IN NUMBER)
RETURN NUMBER
IS
    result NUMBER := 1;
BEGIN
    -- Handle edge cases
    IF n < 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Factorial is not defined for negative numbers');
    ELSIF n = 0 THEN
        RETURN 1;
    ELSE
        FOR i IN 1..n LOOP
            result := result * i;
        END LOOP;
        RETURN result;
    END IF;
END;
/

-- Example: Find factorial of 5
DECLARE
    ans NUMBER;
BEGIN
    ans := factorial(5);
    DBMS_OUTPUT.PUT_LINE('Factorial of 5 is: ' || ans);
END;
/
