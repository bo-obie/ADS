CREATE TABLE Employee (Emp_no INT PRIMARY KEY,Emp_name VARCHAR(100),Dept_no INT,Dept_name VARCHAR(50),Job_Id VARCHAR(50), Salary DECIMAL(10,2),Hiredate DATE);

--vertical fragmentation
-- Fragment 1: Personal and Department details
CREATE TABLE Emp_Personal AS SELECT Emp_no, Emp_name, Dept_no, Dept_name FROM Employee;

-- Fragment 2: Job and Salary details
CREATE TABLE Emp_Job AS SELECT Emp_no, Job_Id, Salary, Hiredate FROM Employee;

--horizontal fragmentaion
-- Fragment 1: Employees in Production
CREATE TABLE Emp_Production AS SELECT * FROM Employee WHERE Dept_name = 'Production';

-- Fragment 2: Employees in Sales
CREATE TABLE Emp_Sales AS SELECT * FROM Employee WHERE Dept_name = 'Sales';


