USE ecommerce;

-- 1. Select all products
SELECT * FROM Products;

-- 2. Select specific columns: Name and Price from Products
SELECT Name, Price FROM Products;

-- 3. Select customers who live in 'Hyderabad'
SELECT * FROM Customers WHERE Address = 'Hyderabad';

-- 4. Select customers with non-null phone numbers
SELECT * FROM Customers WHERE Phone IS NOT NULL;

-- 5. Select orders placed after '2025-08-01'
SELECT * FROM Orders WHERE OrderDate > '2025-08-01';

-- 6. Select products priced between 1000 and 30000
SELECT * FROM Products WHERE Price BETWEEN 1000 AND 30000;

-- 7. Select products whose name contains 'phone'
SELECT * FROM Products WHERE Name LIKE '%phone%';

-- 8. Select orders by customer ID = 1 and amount more than 5000
SELECT * FROM Orders WHERE CustomerID = 1 AND TotalAmount > 5000;

-- 9. Select all products and order them by price in descending order
SELECT * FROM Products ORDER BY Price DESC;

-- 10. Get top 2 most expensive products
SELECT * FROM Products ORDER BY Price DESC LIMIT 2;

-- 11. Get all categories and count of products in each
SELECT c.CategoryName, COUNT(p.ProductID) AS ProductCount
FROM Categories c
LEFT JOIN Products p ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryName;

-- 12. List all orders with customer names (using JOIN)
SELECT o.OrderID, o.OrderDate, o.TotalAmount, c.Name AS CustomerName
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID;
