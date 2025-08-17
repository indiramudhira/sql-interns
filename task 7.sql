use ecommercedb;
CREATE TABLE Customerss(
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    City VARCHAR(50)
);
CREATE TABLE Ordersss (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
CREATE TABLE Productss(
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10,2)
);
CREATE TABLE OrderDetailss(
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Ordersss(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Productss(ProductID)
);
INSERT INTO Customerss VALUES
(1, 'Indira', 'indira@email.com', 'Hyderabad'),
(2, 'Bharu', 'bharu@email.com', 'Delhi'),
(3, 'Ravi', 'ravi@email.com', 'Chennai');
INSERT INTO Ordersss VALUES
(101, 1, '2025-08-01', 5000),
(102, 2, '2025-08-05', 2000),
(103, 1, '2025-08-10', 3000);
INSERT INTO Productss VALUES
(201, 'Laptop', 40000),
(202, 'Mouse', 500),
(203, 'Keyboard', 1500);
INSERT INTO OrderDetailss VALUES
(301, 101, 201, 1),
(302, 101, 202, 2),
(303, 102, 203, 1),
(304, 103, 202, 3);
-- create views
-- view customerss ordersss
CREATE VIEW CustomerOrders AS
SELECT c.Name, c.City, o.OrderID, o.OrderDate, o.TotalAmount
FROM Customerss c
JOIN Ordersss o ON c.CustomerID = o.CustomerID;
 
select * from CustomerOrders;
-- order with product details
CREATE VIEW OrderProductDetailss AS
SELECT o.OrderID, c.Name AS CustomerName, p.ProductName, od.Quantity, (p.Price * od.Quantity) AS SubTotal
FROM Ordersss o
JOIN Customerss c ON o.CustomerID = c.CustomerID
JOIN OrderDetailss od ON o.OrderID = od.OrderID
JOIN Productss p ON od.ProductID = p.ProductID;
select * from OrderProductDetailss;
-- view:total sale per customer
CREATE VIEW CustomerSales AS
SELECT c.Name, SUM(o.TotalAmount) AS TotalSpent
FROM Customerss c
JOIN Ordersss o ON c.CustomerID = o.CustomerID
GROUP BY c.Name;
select * from CustomerSales;