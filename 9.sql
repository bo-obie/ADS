CREATE TABLE Employee (
    Emp_no NUMBER PRIMARY KEY,
    Emp_name VARCHAR2(100),
    Dept_no NUMBER,
    Dept_name VARCHAR2(50),
    Job_Id VARCHAR2(50),
    Salary NUMBER(10,2),
    Hiredate DATE
);

INSERT INTO Employee VALUES (1, 'Alice', 101, 'Production', 'P01', 40000, DATE '2020-01-15');
INSERT INTO Employee VALUES (2, 'Bob', 102, 'Sales', 'S01', 25000, DATE '2019-03-20');
INSERT INTO Employee VALUES (3, 'Charlie', 101, 'Production', 'P02', 50000, DATE '2021-07-10');
INSERT INTO Employee VALUES (4, 'David', 103, 'HR', 'H01', 35000, DATE '2018-11-05');
INSERT INTO Employee VALUES (5, 'Eva', 102, 'Sales', 'S02', 12000, DATE '2022-02-18');

CREATE OR REPLACE FUNCTION update_salary_all
RETURN NUMBER
IS
    rows_updated NUMBER;
BEGIN
    UPDATE Employee
    SET Salary = Salary + 5000;

    rows_updated := SQL%ROWCOUNT;  -- number of rows affected
    RETURN rows_updated;
END;
/

SET SERVEROUTPUT ON;

DECLARE
    result NUMBER;
BEGIN
    result := update_salary_all;
    DBMS_OUTPUT.PUT_LINE('Rows updated: ' || result);
END;
/

