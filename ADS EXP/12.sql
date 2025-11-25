SET SERVEROUTPUT ON;

DECLARE
    num1 NUMBER := 25;
    num2 NUMBER := 40;
    num3 NUMBER := 15;
    largest NUMBER;
BEGIN
    IF num1 >= num2 AND num1 >= num3 THEN
        largest := num1;
    ELSIF num2 >= num1 AND num2 >= num3 THEN
        largest := num2;
    ELSE
        largest := num3;
    END IF;

    DBMS_OUTPUT.PUT_LINE('The largest number is: ' || largest);
END;
/


--CREATE OR REPLACE PROCEDURE find_largest(
    num1 IN NUMBER,
    num2 IN NUMBER,
    num3 IN NUMBER
)
IS
    largest NUMBER;
BEGIN
    IF num1 >= num2 AND num1 >= num3 THEN
        largest := num1;
    ELSIF num2 >= num1 AND num2 >= num3 THEN
        largest := num2;
    ELSE
        largest := num3;
    END IF;

    DBMS_OUTPUT.PUT_LINE('The largest number is: ' || largest);
END;
/

--SET SERVEROUTPUT ON;

--BEGIN
    find_largest(25, 40, 15);  -- user supplies values here
END;
/
