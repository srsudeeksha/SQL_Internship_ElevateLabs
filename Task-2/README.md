Task 2: Data Insertion and Handling Nulls

Insert
- Added sample rows into `Customers`, `Categories`, `Products`, `Orders`, and `OrderItems`.
- Used `NULL` for optional fields like:
  - `Phone` in `Customers`
  - `Address` in `Customers`
  - `Price` in `Products`

Update
- Updated product prices and customer addresses.
- Replaced `NULL` values (e.g., assigning a default price to a product with `NULL` price).

Delete
- Removed specific rows using `DELETE` with `WHERE`.
  - Example: Deleted customers with `NULL` addresses.
  - Deleted out-of-stock products.
