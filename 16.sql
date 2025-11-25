CREATE TABLE Employee1 (
    Emp_no NUMBER PRIMARY KEY,
    Emp_name VARCHAR2(100),
    Dept_name VARCHAR2(50),
    Dept_no NUMBER,
    Loc VARCHAR2(50),
    Salary NUMBER(10,2),
    Hiredate DATE
);

INSERT INTO Employee1 VALUES (1, 'Ashish', 'Sales', 101, 'Mumbai', 40000, TO_DATE('2018-01-19', 'YYYY-MM-DD'));
INSERT INTO Employee1 VALUES (2, 'Shreyas', 'Sales', 101, 'Mumbai', 42000, TO_DATE('2019-03-25', 'YYYY-MM-DD'));
INSERT INTO Employee1 VALUES (3, 'Priya', 'Production', 102, 'Pune', 38000, TO_DATE('2020-07-10', 'YYYY-MM-DD'));
INSERT INTO Employee1 VALUES (4, 'Ravi', 'Production', 102, 'Pune', 45000, TO_DATE('2021-11-05', 'YYYY-MM-DD'));
INSERT INTO employee1 VALUES (5, 'Neha', 'IT', 103, 'Bangalore', 50000, TO_DATE('2022-02-18', 'YYYY-MM-DD'));

SELECT *
FROM Employee1
WHERE Salary > (SELECT AVG(Salary) FROM Employee);

SELECT COUNT(*) AS Total_Employees, Loc
FROM Employee1
WHERE Dept_name = 'Sales'
GROUP BY Loc;

SELECT MAX(Salary) AS Max_Salary, MIN(Salary) AS Min_Salary
FROM Employee1;

SELECT Dept_no, Loc, SUM(Salary) AS Total_Salary
FROM Employee1
WHERE Dept_name = 'Production'
GROUP BY Dept_no, Loc;

SELECT Emp_name, TO_CHAR(Hiredate, 'Mon DD YYYY') AS Formatted_Hiredate
FROM Employee1;

SELECT ABS(
    (SELECT Hiredate FROM Employee1 WHERE Emp_name = 'Ashish') -
    (SELECT Hiredate FROM Employee1 WHERE Emp_name = 'Shreyas')
) AS Days_Difference
FROM dual;