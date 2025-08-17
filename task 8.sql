use ecommercedb;

select * from ord;
DELIMITER //

CREATE PROCEDURE GetCustomerOrders(IN cust_id INT)
BEGIN
    SELECT OrderID, OrderDate, Amount
    FROM Ord
    WHERE CustomerID = cust_id;
END //
DELIMITER ;
CALL GetCustomerOrders(1);
-- insert a new order
DELIMITER //
CREATE PROCEDURE AddNewOrder(IN cust_id INT, IN order_date DATE, IN amount DECIMAL(10,2))
BEGIN
    INSERT INTO Ord(CustomerID, OrderDate, Amount)
    VALUES (cust_id, order_date, amount);
END //
DELIMITER ;

-- Function: Get Total Amount Spent by a Customer

DELIMITER //
CREATE FUNCTION GetCustomerSpending(cust_id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total_spent DECIMAL(10,2);

    SELECT SUM(Amount)
    INTO total_spent
    FROM Ord
    WHERE CustomerID = cust_id;

    RETURN IFNULL(total_spent, 0);
END //

DELIMITER ;
SELECT GetCustomerSpending(1);



