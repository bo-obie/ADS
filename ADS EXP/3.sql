-- ITEM table
CREATE TABLE ITEM (ID INT PRIMARY KEY,ITEMNAME VARCHAR(100),COMPANY VARCHAR(100),PRICE DECIMAL(10,2));

-- CUSTOMER table
CREATE TABLE CUSTOMER (C_ID INT PRIMARY KEY,CUSTOMER_NAME VARCHAR(100),CITY VARCHAR(100),ID INT,FOREIGN KEY (ID) REFERENCES ITEM(ID));

-- Insert into ITEM
INSERT INTO ITEM (ID, ITEMNAME, COMPANY, PRICE) VALUES(1, 'Pen', 'Cello', 50),(2, 'Notebook', 'Classmate', 80),(3, 'Bag', 'Wildcraft', 1500),(4, 'Shoes', 'Nike', 3000),(5, 'Watch', 'Titan', 2500),(6, 'Bottle', 'Milton', 200),(7, 'Headphones', 'Sony', 2000),(8, 'Keyboard', 'Logitech', 900),(9, 'Mouse', 'HP', 700),(10, 'Charger', 'Samsung', 1200);

-- Insert into CUSTOMER
INSERT INTO CUSTOMER (C_ID, CUSTOMER_NAME, CITY, ID) VALUES(101, 'Alice', 'Delhi', 1),(102, 'Bob', 'Mumbai', 2),(103, 'Charlie', 'Pune', 3),(104, 'David', 'Delhi', 4),(105, 'Eva', 'Chennai', 5),(106, 'Frank', 'Delhi', 6),(107, 'Grace', 'Hyderabad', 7),(108, 'Helen', 'Kolkata', 8),(109, 'Ian', 'Delhi', 9),(110, 'Jack', 'Bangalore', 10);

--STEP 2
SELECT * FROM ITEM WHERE PRICE BETWEEN 40 AND 95;

--STEP 3
SELECT C.CUSTOMER_NAME, C.CITY, I.ITEMNAME, I.PRICE FROM CUSTOMER C JOIN ITEM I ON C.ID = I.ID;

--STEP 4
SELECT ID, ITEMNAME, COMPANY, PRICE + 50.32 AS NEW_PRICE FROM ITEM;

--STEP 5
DELETE FROM CUSTOMER WHERE CITY = 'Delhi';

