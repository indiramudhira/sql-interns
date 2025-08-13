use ecommercedb;
-- Customers table
CREATE TABLE Cust(
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    City VARCHAR(50)
);
select * from cust;
-- order table
CREATE TABLE Ord(
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    Amount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
INSERT INTO Cust(CustomerID, Name, City) VALUES
(1, 'Amit', 'Mumbai'),
(2, 'Riya', 'Delhi'),
(3, 'John', 'Bangalore'),
(4, 'Sneha', 'Hyderabad'),
(5, 'Kiran', 'Chennai');
INSERT INTO Ord(OrderID, CustomerID, OrderDate, Amount) VALUES
(101, 1, '2025-07-01', 500.00),
(102, 1, '2025-07-05', 1200.00),
(103, 2, '2025-07-03', 750.00),
(104, 3, '2025-07-10', 200.00),
(105, 1, '2025-07-15', 300.00),
(106, 4, '2025-07-08', 2500.00),
(107, 4, '2025-07-20', 800.00);
select * from ord;
-- scalar subquery count orders for each customer
SELECT 
    Name,
    (SELECT COUNT(*) 
     FROM Ord
     WHERE Ord.CustomerID = Cust.CustomerID) AS TotalOrders
FROM Cust;
-- subquery in where (using in) find the cust who placed ord more than 500
select name from cust 
where CustomerID in (select CustomerID from ord where Amount >500 );
-- subquery in from
SELECT CustomerID, TotalSpent
FROM (
    SELECT CustomerID, SUM(Amount) AS TotalSpent
    FROM Ord
    GROUP BY CustomerID
) AS OrderSummary
WHERE TotalSpent > 1000;

-- correlated subquery with exists
SELECT Name
FROM Cust c
WHERE EXISTS (
    SELECT 1
    FROM Ord o
    WHERE o.CustomerID = c.CustomerID
    AND o.Amount > 1000
);
-- subquery with=(scalar)
SELECT Name
FROM Cust
WHERE CustomerID = (
    SELECT CustomerID
    FROM Ord
    ORDER BY Amount DESC
    LIMIT 1
);