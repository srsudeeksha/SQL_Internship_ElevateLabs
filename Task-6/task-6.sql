USE ecommerce;

USE ecommerce;

-- 1. Scalar Subquery: Product with the highest price
SELECT Name AS ProductName
FROM Products
WHERE Price = (
    SELECT MAX(Price) 
    FROM Products
);

-- 2. Subquery with IN: Customers who placed an order
SELECT Name AS CustomerName
FROM Customers
WHERE CustomerID IN (
    SELECT DISTINCT CustomerID 
    FROM Orders
);

-- 3. Correlated Subquery: Products more expensive than average price in their category
SELECT Name AS ProductName, Price, CategoryID
FROM Products p
WHERE Price > (
    SELECT AVG(Price)
    FROM Products
    WHERE CategoryID = p.CategoryID
);

-- 4. Subquery in SELECT: Show each order with total number of items
SELECT OrderID,
       (SELECT COUNT(*)
        FROM OrderItems
        WHERE OrderItems.OrderID = Orders.OrderID) AS TotalItems
FROM Orders;

-- 5. Nested Subquery in FROM: Top 3 most expensive products
SELECT *
FROM (
    SELECT Name AS ProductName, Price
    FROM Products
    ORDER BY Price DESC
    LIMIT 3
) AS TopProducts;

-- 6. EXISTS: Customers who ordered at least one product over ₹500
SELECT Name AS CustomerName
FROM Customers c
WHERE EXISTS (
    SELECT 1
    FROM Orders o
    JOIN OrderItems oi ON o.OrderID = oi.OrderID
    JOIN Products p ON oi.ProductID = p.ProductID
    WHERE c.CustomerID = o.CustomerID
      AND p.Price > 500
);

-- 7. Multi-level Subquery: Category with the product having the highest price
SELECT CategoryName
FROM Categories
WHERE CategoryID = (
    SELECT CategoryID
    FROM Products
    WHERE Price = (
        SELECT MAX(Price)
        FROM Products
    )
);

-- 8. ALL operator: Products priced higher than all products in CategoryID = 2
SELECT Name AS ProductName, Price
FROM Products
WHERE Price > ALL (
    SELECT Price
    FROM Products
    WHERE CategoryID = 2
);
