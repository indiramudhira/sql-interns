use ecommercedb;
select * from product;
-- no of products on each Description
SELECT Description, COUNT(*) AS TotalProducts
FROM product
GROUP BY Description;

-- total stock for each description
SELECT Description, SUM(Stock) AS TotalStock
FROM product
GROUP BY Description; 

-- average price per description 
SELECT Description, AVG(Price) AS AvgPrice
FROM product
GROUP BY Description;

-- total value per Description(sum+count)
SELECT Description, SUM(Price * Stock) AS TotalStockValue, COUNT(*) AS NumProducts
FROM product
GROUP BY Description;

-- show only description with total stock > 40 
SELECT Description, SUM(Stock) AS TotalStock
FROM product
GROUP BY Description
HAVING SUM(Stock) > 40;




