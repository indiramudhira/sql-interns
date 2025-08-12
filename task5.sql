use ecommercedb;
create table customers(
customerID int primary key,
name varchar(50),
city varchar(50)
);
insert into customers(customerID,name,city)values
(1,'indu','siddipet'),
(2,'bhargavi','hyderabad'),
(3,'ramu','chennai'),
(4,'girii','nellore');
select * from customers;
create table orderss(
orderID int primary key,
customerID int,
product varchar(50),
foreign key(customerID) references customers(customerID)
);
insert into orderss(orderID,customerID,product)values
(101,1,'laptop'),
(102,1,'monitor'),
(103,2,'keyboard'),
(104,4,'mouse');
INSERT INTO orderss (orderID, customerID, product)
VALUES (105, 5, 'printer');
select * from orderss;
-- inner join means matching records in both tables
select customers.name,orderss.product from customers
inner join orderss on customers.customerID=orderss.customerID;


select * from customers
inner join orderss on customers.customerID=orderss.customerID;
-- left join 
select  customers.name,orderss.product from customers
left join orderss on customers.customerID=orderss.customerID;
select * from customers
left join orderss on customers.customerID=orderss.customerID;

-- right join
select  customers.name,orderss.product from customers
right join orderss on customers.customerID=orderss.customerID;
select * from customers
right join orderss on customers.customerID=orderss.customerID;

-- my sql does not support full join but you can simulate it using UNION of LEFT JOIN and RIGHT JOIN
SELECT customers.Name, orderss.Product
FROM customers
left JOIN orderss
ON customers.customerID = orderss.customerID
union
SELECT customers.Name, orderss.Product
FROM customers
RIGHT JOIN orderss
ON customers.customerID = orderss.customerID;








