# Task 8: Stored Procedures and Functions

## Objective
Learn to create reusable SQL blocks for modularizing and reusing logic.

## Tools
- DB Browser for SQLite / MySQL Workbench

## Deliverables
- At least **one stored procedure** and **one function** created and tested in the `ecommerce` database.

## Steps Performed
1. Used `DROP PROCEDURE IF EXISTS` and `DROP FUNCTION IF EXISTS` to ensure clean execution without conflicts.
2. Created a **stored procedure** `GetCustomerOrders` that:
   - Takes a `customer_id` as input.
   - Returns order details for the given customer, joining with the `Customers` table for names.
3. Created a **function** `GetTotalSpent` that:
   - Takes a `cust_id` as input.
   - Returns the total amount spent by that customer.
4. Tested both the procedure and function using example calls.
