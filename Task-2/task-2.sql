-- Insert into Categories
INSERT INTO Categories (CategoryName) VALUES
('Electronics'),
('Clothing'),
('Books');

-- Insert into Products
INSERT INTO Products (Name, Price, Stock, CategoryID) VALUES
('Smartphone', 19999.99, 50, 1),
('T-shirt', 499.00, 100, 2),
('Novel', 299.00, 30, 3),
('Laptop', NULL, 25, 1);  -- Example with NULL price

-- Insert into Customers
INSERT INTO Customers (Name, Email, Phone, Address) VALUES
('Alice Johnson', 'alice@example.com', '9876543210', 'Hyderabad'),
('Bob Smith', 'bob@example.com', NULL, 'Delhi'), -- NULL phone
('Charlie Brown', 'charlie@example.com', '9988776655', NULL); -- NULL address

-- Insert into Orders
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount) VALUES
(1, '2025-08-01', 20298.99),
(2, '2025-08-02', 499.00);

-- Insert into OrderItems
INSERT INTO OrderItems (OrderID, ProductID, Quantity, Price) VALUES
(1, 1, 1, 19999.99),
(1, 3, 1, 299.00),
(2, 2, 1, 499.00);

-- Update product price
UPDATE Products SET Price = 18999.99 WHERE Name = 'Smartphone';

-- Update customer address
UPDATE Customers SET Address = 'Chennai' WHERE CustomerID = 2;

-- Update NULL price (Laptop) to default value
UPDATE Products SET Price = 49999.00 WHERE Name = 'Laptop' AND Price IS NULL;

-- Delete an order item
DELETE FROM OrderItems WHERE OrderItemID = 3;

-- Delete a customer with no address
DELETE FROM Customers WHERE Address IS NULL;

-- Delete products out of stock (example: manually set)
UPDATE Products SET Stock = 0 WHERE Name = 'T-shirt';
DELETE FROM Products WHERE Stock = 0;

