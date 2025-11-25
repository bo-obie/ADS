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



CREATE OR REPLACE PROCEDURE insert_employee(
    p_emp_no   IN NUMBER,
    p_emp_name IN VARCHAR2,
    p_dept_no  IN NUMBER,
    p_dept_name IN VARCHAR2,
    p_job_id   IN VARCHAR2,
    p_salary   IN NUMBER,
    p_hiredate IN DATE
)
IS
BEGIN
    INSERT INTO Employee (Emp_no, Emp_name, Dept_no, Dept_name, Job_Id, Salary, Hiredate)
    VALUES (p_emp_no, p_emp_name, p_dept_no, p_dept_name, p_job_id, p_salary, p_hiredate);

    DBMS_OUTPUT.PUT_LINE('Employee inserted successfully.');
END;
/

CREATE OR REPLACE PROCEDURE select_employees
IS
BEGIN
    FOR rec IN (SELECT Emp_no, Emp_name, Salary FROM Employee) LOOP
        DBMS_OUTPUT.PUT_LINE('Emp_no: ' || rec.Emp_no || 
                             ', Name: ' || rec.Emp_name || 
                             ', Salary: ' || rec.Salary);
    END LOOP;
END;
/

CREATE OR REPLACE PROCEDURE update_salary(
    p_emp_no IN NUMBER,
    p_increment IN NUMBER
)
IS
BEGIN
    UPDATE Employee
    SET Salary = Salary + p_increment
    WHERE Emp_no = p_emp_no;

    IF SQL%ROWCOUNT > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Salary updated successfully for Emp_no: ' || p_emp_no);
    ELSE
        DBMS_OUTPUT.PUT_LINE('No employee found with Emp_no: ' || p_emp_no);
    END IF;
END;
/



BEGIN
    insert_employee(6, 'dice', 109, 'Production', 'P01', 60000, SYSDATE);
END;
/

BEGIN
    select_employees;
END;
/

BEGIN
    update_salary(3, 1000);  -- Increase Alice’s salary by 5000
END;
/


