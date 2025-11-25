SET SERVEROUTPUT ON;
CREATE TABLE Employee (
    Emp_no NUMBER PRIMARY KEY,
    Emp_name VARCHAR2(100),
    Dept_name VARCHAR2(50),
    Dept_no NUMBER,
    Location VARCHAR2(50),
    Salary NUMBER(10,2),
    Hiredate DATE
);

INSERT INTO Employee VALUES (1, 'Alice', 101, 'Production', 'P01', 40000, DATE '2020-01-15');
INSERT INTO Employee VALUES (2, 'Bob', 102, 'Sales', 'S01', 25000, DATE '2019-03-20');
INSERT INTO Employee VALUES (3, 'Charlie', 101, 'Production', 'P02', 50000, DATE '2021-07-10');
INSERT INTO Employee VALUES (4, 'David', 103, 'HR', 'H01', 35000, DATE '2018-11-05');
INSERT INTO Employee VALUES (5, 'Eva', 102, 'Sales', 'S02', 12000, DATE '2022-02-18');

DECLARE
    -- Define cursor to select employees in IT department
    CURSOR emp_cursor IS
        SELECT Emp_no, Salary
        FROM Employee
        WHERE Dept_name = 'Sales';

    -- Variables to hold fetched values
    v_empno Employee.Emp_no%TYPE;
    v_salary Employee.Salary%TYPE;
BEGIN
    OPEN emp_cursor;
    LOOP
        FETCH emp_cursor INTO v_empno, v_salary;
        EXIT WHEN emp_cursor%NOTFOUND;

        -- Update salary by 15%
        UPDATE Employee
        SET Salary = v_salary + (v_salary * 0.15)
        WHERE Emp_no = v_empno;

        DBMS_OUTPUT.PUT_LINE('Updated salary for Emp_no ' || v_empno ||
                             ' to ' || (v_salary + (v_salary * 0.15)));
    END LOOP;
    CLOSE emp_cursor;
END;
/
