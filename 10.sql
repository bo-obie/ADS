CREATE OR REPLACE PROCEDURE find_square(num IN NUMBER)
IS
    result NUMBER;
BEGIN
    result := num * num;
    DBMS_OUTPUT.PUT_LINE('Square of ' || num || ' is: ' || result);
END;
/

CREATE OR REPLACE PROCEDURE find_cube(num IN NUMBER)
IS
    result NUMBER;
BEGIN
    result := num * num * num;
    DBMS_OUTPUT.PUT_LINE('Cube of ' || num || ' is: ' || result);
END;
/

SET SERVEROUTPUT ON;

BEGIN
    find_square(5);  -- Example: Square of 5
    find_cube(5);    -- Example: Cube of 5
END;
/


