USE ecommerce;

-- Drop procedure if it already exists
DROP PROCEDURE IF EXISTS GetCustomerOrders;

DELIMITER //
CREATE PROCEDURE GetCustomerOrders(IN customer_id INT)
BEGIN
    SELECT o.OrderID, o.OrderDate, o.TotalAmount, c.Name AS CustomerName
    FROM Orders o
    JOIN Customers c ON o.CustomerID = c.CustomerID
    WHERE o.CustomerID = customer_id;
END //
DELIMITER ;

-- Drop function if it already exists
DROP FUNCTION IF EXISTS GetTotalSpent;

DELIMITER //
CREATE FUNCTION GetTotalSpent(cust_id INT) 
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);
    SELECT SUM(TotalAmount) INTO total
    FROM Orders
    WHERE CustomerID = cust_id;
    RETURN IFNULL(total, 0.00);
END //
DELIMITER ;

-- Example: Call the stored procedure
CALL GetCustomerOrders(1);

-- Example: Use the function
SELECT GetTotalSpent(1) AS TotalSpentByCustomer1;
