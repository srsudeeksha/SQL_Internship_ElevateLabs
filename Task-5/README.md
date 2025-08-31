# Task 5: SQL Joins (Inner, Left, Right, Full)

## Objective
The goal of Task 5 is to learn how to merge and retrieve related data from multiple tables using SQL joins.

## Tools Used
- DB Browser for SQLite
- MySQL Workbench

## Task Description
In this task, we practiced writing SQL queries using different types of joins to combine data from related tables, such as:
- **INNER JOIN**: Returns only rows where there is a match in both tables.
- **LEFT JOIN**: Returns all rows from the left table and matching rows from the right table (NULL if no match).
- **RIGHT JOIN**: Returns all rows from the right table and matching rows from the left table (NULL if no match).
- **FULL OUTER JOIN**: Returns all rows from both tables, with NULL where there is no match.  
  *Note:* MySQL does not directly support `FULL OUTER JOIN` — we simulate it using `UNION` of a `LEFT JOIN` and `RIGHT JOIN`.

We also applied joins involving more than two tables to merge orders, customers, and products.

## Learning Outcomes
By completing Task 5, we gained the ability to:
- Combine related data from multiple tables efficiently.
- Choose the correct join type based on the requirement.
- Simulate unsupported join types in MySQL using `UNION`.
- Understand how NULL values appear when matches are missing in one of the tables.

## Example Use Cases
- Retrieving a list of customers with their orders.
- Listing all products and their categories, including those without a category.
- Generating a sales report showing orders, customers, and purchased products.

