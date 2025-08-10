use ecommercedb;
select * from product;
INSERT INTO product(ProductID, Name, Description, Price, Stock) VALUES
(1, 'Laptop', 'Electronics', 55000, 10),
(2, 'Mouse', 'Electronics', 500, 50),
(3, 'Keyboard', 'Electronics', 1200, 30),
(4, 'Shirt', 'Clothing', 800, 20),
(5, 'Shoes', 'Footwear', 2500, 15),
(6, 'Watch', 'Accessories', 3000, 25),
(7, 'Mobile Phone', 'Electronics', 20000, 18),
(8, 'Jeans', 'Clothing', 1500, 12);
-- select all colums
select * from product;

-- select specific colum
select Name,price from product;
-- apply where ,and
SELECT * 
FROM product
WHERE Description = 'Electronics' AND price > 1000;

-- where with OR
SELECT * 
FROM product
WHERE  Description = 'Clothing' OR  Description = 'Footwear';

-- like
SELECT * 
FROM product
WHERE Name LIKE '%Phone%';

-- between
SELECT * 
FROM  product
WHERE price BETWEEN 1000 AND 5000;


-- order by ascending
SELECT * 
FROM product
ORDER BY Price ASC;
-- order by decending 
SELECT * 
FROM product
ORDER BY Price DESC;

-- limit 
SELECT * 
FROM product
ORDER BY Price DESC
LIMIT 3;

