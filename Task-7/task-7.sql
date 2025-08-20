USE ecommerce;

-- 1. Create a view to show customer orders with product details
CREATE VIEW CustomerOrderDetails AS
SELECT 
    o.OrderID,
    c.Name AS CustomerName,
    p.Name AS ProductName,
    oi.Quantity,
    oi.Price,
    o.TotalAmount,
    o.OrderDate
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN OrderItems oi ON o.OrderID = oi.OrderID
JOIN Products p ON oi.ProductID = p.ProductID;

-- Check the view
SELECT * FROM CustomerOrderDetails;

-- 2. Create a view for total amount spent by each customer
CREATE VIEW CustomerTotalSpent AS
SELECT 
    c.CustomerID,
    c.Name AS CustomerName,
    SUM(o.TotalAmount) AS TotalSpent
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID;

-- Check the view
SELECT * FROM CustomerTotalSpent;

-- 3. Create a view for top 2 most expensive products
CREATE VIEW TopExpensiveProducts AS
SELECT *
FROM Products
ORDER BY Price DESC
LIMIT 2;

-- Check the view
SELECT * FROM TopExpensiveProducts;

-- 4. Create a view for categories with their product counts
CREATE VIEW CategoryProductCount AS
SELECT 
    cat.CategoryName,
    COUNT(p.ProductID) AS ProductCount
FROM Categories cat
LEFT JOIN Products p ON cat.CategoryID = p.CategoryID
GROUP BY cat.CategoryName;

-- Check the view
SELECT * FROM CategoryProductCount;

-- 5. Drop a view example
DROP VIEW IF EXISTS TopExpensiveProducts;
