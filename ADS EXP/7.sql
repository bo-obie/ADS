CREATE TABLE dept (
    dept_no NUMBER PRIMARY KEY,
    dept_name VARCHAR2(50)
);

CREATE SEQUENCE dept_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;


INSERT INTO dept (dept_no, dept_name)
VALUES (dept_seq.NEXTVAL, 'Production');

ALTER SEQUENCE dept_seq
INCREMENT BY 5
MAXVALUE 1000
NOCYCLE;


CREATE SYNONYM dept_synonym
FOR dept;


DROP SYNONYM dept_synonym;
