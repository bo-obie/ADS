CREATE TABLE Employee (Emp_no INT PRIMARY KEY,Emp_name VARCHAR(100),Dept_no INT,Dept_name VARCHAR(50),Job_Id VARCHAR(50), Salary DECIMAL(10,2),Hiredate DATE);

CREATE TABLE Employee_Range (
    Emp_no NUMBER PRIMARY KEY,
    Emp_name VARCHAR2(100),
    Dept_no NUMBER,
    Dept_name VARCHAR2(50),
    Job_Id VARCHAR2(50),
    Salary NUMBER,
    Hiredate DATE
)
PARTITION BY RANGE (Salary) (
    PARTITION p_low VALUES LESS THAN (30000),
    PARTITION p_mid VALUES LESS THAN (60000),
    PARTITION p_high VALUES LESS THAN (MAXVALUE)
);

CREATE TABLE Employee_List (
    Emp_no NUMBER PRIMARY KEY,
    Emp_name VARCHAR2(100),
    Dept_no NUMBER,
    Dept_name VARCHAR2(50),
    Job_Id VARCHAR2(50),
    Salary NUMBER(10,2),
    Hiredate DATE
)
PARTITION BY LIST (Dept_name) (
    PARTITION p_sales VALUES ('Sales'),
    PARTITION p_prod VALUES ('Production'),
    PARTITION p_hr VALUES ('HR'),
    PARTITION p_it VALUES ('IT')
);

CREATE TABLE Employee_Hash (
    Emp_no INT PRIMARY KEY,
    Emp_name VARCHAR(100),
    Dept_no INT,
    Dept_name VARCHAR(50),
    Job_Id VARCHAR(50),
    Salary DECIMAL(10,2),
    Hiredate DATE
)
PARTITION BY HASH (Emp_no)
PARTITIONS 4;


