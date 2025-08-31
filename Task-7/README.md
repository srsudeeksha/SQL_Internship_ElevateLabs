## Task 7: Creating Views

**Objective:** Learn to create and use views in SQL for abstraction, security, and reusability of complex queries.  

**Tools:** DB Browser for SQLite / MySQL Workbench  

**Deliverables:** View definitions and usage examples  

### Hints / Mini Guide
1. Use `CREATE VIEW` with complex `SELECT` statements.  
2. Use views to simplify repeated queries, hide complex joins, and enhance security.  
3. Views can be queried like tables, but they store no actual data—only the query logic.  

### Outcome
- Understand reusable SQL logic.
- Write cleaner and more maintainable SQL queries.
- Enhance database security by exposing only necessary data.

### Description
In this task, we created multiple SQL views based on our `ecommerce` database:
- **CustomerOrderDetails**: Combines `Customers`, `Orders`, `OrderItems`, and `Products` to show complete order information with product details.  
- **CustomerTotalSpent**: Aggregates each customer's total spending.  
- **TopExpensiveProducts**: Displays the top 2 most expensive products.  
- **CategoryProductCount**: Shows each category with the number of products in it.  

These views allow quick access to commonly used data without rewriting complex `JOIN` and `GROUP BY` queries. We also demonstrated dropping a view using `DROP VIEW IF EXISTS`.

