use EcommerceDB;
SELECT * FROM customer;
INSERT INTO customer(CustomerID, Name, Email, Phone,Address)
VALUES (1,'indira', 'indira.com', '9876543210','hyd');
INSERT INTO customer(CustomerID, Name, Email, Phone,Address)
VALUES (2,'bharu', 'bharu.com', '9876543211','sdpt');
INSERT INTO customer(CustomerID, Name, Email, Phone,Address)
VALUES (3,'pavvi', 'pavvi.com', '9876543213','duddeda');
INSERT INTO customer(CustomerID, Name, Email, Phone,Address)
VALUES (4,'shambi', 'shambi.com', '9876543214','shelampu');
INSERT INTO customer(CustomerID, Name, Email, Phone,Address)
VALUES (5,'nirma', 'nirma.com', '9876543215','kondapaka');

select * from customer;
-- update query;
update customer
set phone='9848224151' where CustomerID=5;
-- delete query;
delete from customer where CustomerID=4;
-- handle with default
ALTER TABLE customer
ADD COLUMN CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP;
-- handle with null
ALTER TABLE customer
ADD COLUMN Notes TEXT NULL;
select * from customer where Notes is Null;
SELECT * FROM customer
WHERE Phone IS NOT NULL;
SELECT * FROM customer
WHERE Notes IS NOT NULL;
