CREATE TABLE Sales (
    Sale_id NUMBER PRIMARY KEY,
    Region VARCHAR2(50),
    Product VARCHAR2(50),
    Year NUMBER(4),
    Quarter VARCHAR2(10),
    Sales NUMBER(10,2)
);

INSERT INTO Sales VALUES (1, 'North', 'Laptop', 2023, 'Q1', 15000);
INSERT INTO Sales VALUES (2, 'North', 'Laptop', 2023, 'Q2', 18000);
INSERT INTO Sales VALUES (3, 'North', 'Mobile', 2023, 'Q1', 12000);
INSERT INTO Sales VALUES (4, 'North', 'Mobile', 2023, 'Q2', 14000);

INSERT INTO Sales VALUES (5, 'South', 'Laptop', 2023, 'Q1', 20000);
INSERT INTO Sales VALUES (6, 'South', 'Laptop', 2023, 'Q2', 22000);
INSERT INTO Sales VALUES (7, 'South', 'Mobile', 2023, 'Q1', 17000);
INSERT INTO Sales VALUES (8, 'South', 'Mobile', 2023, 'Q2', 19000);

INSERT INTO Sales VALUES (9, 'East', 'Laptop', 2023, 'Q1', 13000);
INSERT INTO Sales VALUES (10, 'East', 'Mobile', 2023, 'Q1', 11000);

SELECT Region, Product, SUM(Sales) AS Total_Sales
FROM Sales
GROUP BY ROLLUP (Region, Product);

SELECT Year, Quarter, Region, SUM(Sales) AS Total_Sales
FROM Sales
GROUP BY Year, Quarter, Region
ORDER BY Year, Quarter, Region;

SELECT Region, Product, SUM(Sales) AS Total_Sales
FROM Sales
GROUP BY CUBE (Region, Product);
