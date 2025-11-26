SHOW PDBS;
ALTER SESSION SET CONTAINER = XEPDB1;
--alter session set "_oracle_script"=true;   --for sqlplus

CREATE USER jyoti IDENTIFIED BY mitpoly;
-- Oracle typically requires also granting CREATE SESSION so user can log in:
CREATE USER john IDENTIFIED BY mitpoly;
GRANT CREATE SESSION TO jyoti;



GRANT CREATE TABLE, CREATE VIEW TO jyoti;

Create table Emp(empno int primary key, empname varchar(50), salary decimal(10,2), phno int);
Create table Dept(deptno int , empno int , deptname varchar(50), location varchar(50), jobtype varchar(50),primary key(deptno,empno),foreign key (empno) references Emp(empno));

GRANT SELECT, INSERT, UPDATE ON Emp TO jyoti;

Insert into Emp(empno,empname,salary,phno) values(3,'hn',5000,9823415567);
Insert into  Dept(deptno ,empno, deptname , location , jobtype )values(3,3,'civil','Kolhapur','Remote');


Select * from emp;
Select * from dept;

GRANT SELECT, UPDATE(deptno, empno) ON Dept TO jyoti;

ALTER USER jyoti IDENTIFIED BY mit;

REVOKE CREATE TABLE, CREATE VIEW FROM jyoti;

REVOKE SELECT, INSERT, UPDATE ON Emp FROM jyoti;

CREATE ROLE emp_pvr;

GRANT CREATE TABLE, CREATE VIEW TO emp_pvr;

GRANT emp_pvr TO jyoti, john;



