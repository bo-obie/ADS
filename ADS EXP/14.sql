Set SERVEROUTPUT on;
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


CREATE OR REPLACE TRIGGER emp_salary_diff_trg
AFTER INSERT OR UPDATE OR DELETE
ON Employee
FOR EACH ROW
BEGIN
    -- For UPDATE: show difference between old and new salary
    IF UPDATING THEN
        DBMS_OUTPUT.PUT_LINE('Salary changed from ' || :OLD.Salary || 
                             ' to ' || :NEW.Salary || 
                             '. Difference: ' || (:NEW.Salary - :OLD.Salary));
    END IF;

    -- For INSERT: show new salary
    IF INSERTING THEN
        DBMS_OUTPUT.PUT_LINE('New employee added with salary: ' || :NEW.Salary);
    END IF;

    -- For DELETE: show old salary
    IF DELETING THEN
        DBMS_OUTPUT.PUT_LINE('Employee deleted with salary: ' || :OLD.Salary);
    END IF;
END;
/

-- Insert a new employee
INSERT INTO Employee VALUES (7, 'ea', 107, 'Sales', 'S02', 60000, DATE '2022-02-18');

-- Update salary of employee
UPDATE Employee
SET Salary = 50000
WHERE Emp_no = 7;

-- Delete employee
DELETE FROM Employee
WHERE Emp_no = 7;

