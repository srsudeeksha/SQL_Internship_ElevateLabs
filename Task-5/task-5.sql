USE ecommerce;

-- INNER JOIN: Customers with orders
SELECT c.CustomerID, c.Name AS CustomerName, o.OrderID, o.TotalAmount
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID;

-- LEFT JOIN: All customers with orders if they exist
SELECT c.CustomerID, c.Name AS CustomerName, o.OrderID, o.TotalAmount
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID;

-- RIGHT JOIN: All orders with their customers
SELECT c.CustomerID, c.Name AS CustomerName, o.OrderID, o.TotalAmount
FROM Customers c
RIGHT JOIN Orders o ON c.CustomerID = o.CustomerID;

-- FULL OUTER JOIN simulation for MySQL (using UNION of LEFT and RIGHT)
SELECT c.CustomerID, c.Name AS CustomerName, o.OrderID, o.TotalAmount
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
UNION
SELECT c.CustomerID, c.Name AS CustomerName, o.OrderID, o.TotalAmount
FROM Customers c
RIGHT JOIN Orders o ON c.CustomerID = o.CustomerID;

-- INNER JOIN with multiple tables
SELECT o.OrderID, c.Name AS CustomerName, p.Name AS ProductName, oi.Quantity, oi.Price
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN OrderItems oi ON o.OrderID = oi.OrderID
JOIN Products p ON oi.ProductID = p.ProductID;

-- LEFT JOIN: Products with categories
SELECT p.ProductID, p.Name AS ProductName, cat.CategoryName
FROM Products p
LEFT JOIN Categories cat ON p.CategoryID = cat.CategoryID;