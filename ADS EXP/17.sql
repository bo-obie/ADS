CREATE TABLE Demo_Employee (
    Emp_id NUMBER PRIMARY KEY,
    Emp_name VARCHAR2(100),
    Dept_name VARCHAR2(50),
    Hiredate DATE
);

-- Insert sample data
INSERT INTO Demo_Employee VALUES (1, 'Ashish', 'Sales', TO_DATE('2018-01-19', 'YYYY-MM-DD'));
INSERT INTO Demo_Employee VALUES (2, 'Shreyas', 'Production', TO_DATE('2019-03-25', 'YYYY-MM-DD'));
INSERT INTO Demo_Employee VALUES (3, 'Priy0a', 'IT', TO_DATE('2020-07-10', 'YYYY-MM-DD'));
INSERT INTO Demo_Employee VALUES (4, 'Ravi', 'HR', TO_DATE('2021-11-05', 'YYYY-MM-DD'));
INSERT INTO Demo_Employee VALUES (5, 'Neha', 'Finance', TO_DATE('2022-02-18', 'YYYY-MM-DD'));

SELECT Emp_name, UPPER(Emp_name) AS Upper_Name
FROM Demo_Employee;

SELECT Emp_name, LENGTH(Emp_name) AS Name_Length
FROM Demo_Employee;
    
SELECT Emp_name, SUBSTR(Emp_name, 1, 3) AS First_Three_Chars
FROM Demo_Employee;

SELECT Emp_name,
       Hiredate,
       SYSDATE - Hiredate AS Days_Worked
FROM Demo_Employee;

SELECT SYSDATE AS Current_Date
FROM dual;
