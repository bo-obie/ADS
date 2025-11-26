show pdbs;
ALTER SESSION SET CONTAINER = XEPDB1;
--alter session set "_oracle_script"=true;   --for sqlplus

CREATE USER vaishnav IDENTIFIED BY johnpwd;
GRANT CREATE SESSION TO vaishnav;

Create table Emp(empno int primary key, empname varchar(50), salary decimal(10,2), phno int);
Create table Dept(deptno int , empno int , deptname varchar(50), location varchar(50), jobtype varchar(50),primary key(deptno,empno),foreign key (empno) references Emp(empno));


GRANT SELECT, INSERT, DELETE ON Emp TO vaishnav;
GRANT SELECT, INSERT, DELETE ON Dept TO vaishnav;

GRANT UPDATE (empno, salary) ON Emp TO vaishnav;

REVOKE SELECT, INSERT, DELETE, UPDATE  ON Emp FROM vaishnav;
REVOKE SELECT, INSERT, DELETE ON Dept FROM vaishnav;

CREATE ROLE dept_pvr;

GRANT CREATE TABLE, CREATE VIEW TO dept_pvr;
GRANT dept_pvr TO jyoti, vaishnav;

CREATE ROLE dept_pvr1;
GRANT SELECT, INSERT, DELETE ON Emp TO dept_pvr1;
GRANT SELECT, INSERT, DELETE ON Dept TO dept_pvr1;

GRANT dept_pvr1 TO jyoti, john;


