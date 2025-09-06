-- Creating database

create database personalfinancetracter

-- Use DataBase

use personalfinancetracker

-- User Table

CREATE TABLE users (
    user_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    full_name VARCHAR(100) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Categories table

CREATE TABLE categories (
    category_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(50) NOT NULL UNIQUE,
    category_type VARCHAR(20) NOT NULL CHECK (category_type IN ('income', 'expense')),
    description TEXT
);

-- Income table

CREATE TABLE income (
    income_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    user_id INTEGER NOT NULL,
    category_id INTEGER NOT NULL,
    amount DECIMAL(10, 2) NOT NULL CHECK (amount > 0),
    description TEXT,
    transaction_date DATE NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

-- Expenses table

CREATE TABLE expenses (
    expense_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    user_id INTEGER NOT NULL,
    category_id INTEGER NOT NULL,
    amount DECIMAL(10, 2) NOT NULL CHECK (amount > 0),
    description TEXT,
    transaction_date DATE NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

-- 2. INSERT DATA
-- =============================================

-- Insert users

INSERT INTO users (user_id, username, email, full_name) VALUES
(1, 'john_doe', 'john.doe@email.com', 'John Doe'),
(2, 'jane_smith', 'jane.smith@email.com', 'Jane Smith'),
(3, 'mike_wilson', 'mike.wilson@email.com', 'Mike Wilson');

-- Insert categories

INSERT INTO categories (category_id, category_name, category_type, description) VALUES

-- Income categories

(1, 'Salary', 'income', 'Regular monthly salary'),
(2, 'Freelance', 'income', 'Freelance work income'),
(3, 'Investment', 'income', 'Investment returns and dividends'),
(4, 'Business', 'income', 'Business revenue'),

-- Expense categories

(5, 'Housing', 'expense', 'Rent, mortgage, utilities'),
(6, 'Food', 'expense', 'Groceries and dining out'),
(7, 'Transportation', 'expense', 'Gas, public transport, car maintenance'),
(8, 'Healthcare', 'expense', 'Medical bills and insurance'),
(9, 'Entertainment', 'expense', 'Movies, games, hobbies'),
(10, 'Shopping', 'expense', 'Clothing, electronics, misc purchases'),
(11, 'Education', 'expense', 'Courses, books, training'),
(12, 'Savings', 'expense', 'Money moved to savings accounts');

-- Insert income data (past 6 months)

INSERT INTO income (user_id, category_id, amount, description, transaction_date) VALUES

-- John Doe income

(1, 1, 5000.00, 'Monthly salary', '2024-08-01'),
(1, 1, 5000.00, 'Monthly salary', '2024-07-01'),
(1, 1, 5000.00, 'Monthly salary', '2024-06-01'),
(1, 2, 1200.00, 'Website development project', '2024-08-15'),
(1, 2, 800.00, 'Logo design project', '2024-07-20'),
(1, 3, 150.00, 'Stock dividends', '2024-08-10'),

-- Jane Smith income

(2, 1, 4500.00, 'Monthly salary', '2024-08-01'),
(2, 1, 4500.00, 'Monthly salary', '2024-07-01'),
(2, 1, 4500.00, 'Monthly salary', '2024-06-01'),
(2, 4, 2000.00, 'Consulting work', '2024-08-20'),
(2, 3, 200.00, 'Investment returns', '2024-07-15'),

-- Mike Wilson income

(3, 1, 3800.00, 'Monthly salary', '2024-08-01'),
(3, 1, 3800.00, 'Monthly salary', '2024-07-01'),
(3, 2, 600.00, 'Part-time tutoring', '2024-08-25');

-- Insert expense data (past 6 months)

INSERT INTO expenses (user_id, category_id, amount, description, transaction_date) VALUES
(1, 5, 1200.00, 'Rent payment', '2024-08-01'),
(1, 5, 1200.00, 'Rent payment', '2024-07-01'),
(1, 5, 1200.00, 'Rent payment', '2024-06-01'),
(1, 6, 400.00, 'Groceries', '2024-08-05'),
(1, 6, 450.00, 'Groceries', '2024-07-05'),
(1, 6, 380.00, 'Groceries', '2024-06-05'),
(1, 6, 120.00, 'Restaurant dinner', '2024-08-12'),
(1, 7, 300.00, 'Gas and car maintenance', '2024-08-08'),
(1, 7, 280.00, 'Gas', '2024-07-10'),
(1, 8, 150.00, 'Health insurance', '2024-08-01'),
(1, 8, 150.00, 'Health insurance', '2024-07-01'),
(1, 9, 80.00, 'Movie tickets and popcorn', '2024-08-18'),
(1, 10, 250.00, 'New headphones', '2024-08-22'),
(1, 12, 1000.00, 'Emergency fund contribution', '2024-08-30'),
(2, 5, 1800.00, 'Mortgage payment', '2024-08-01'),
(2, 5, 1800.00, 'Mortgage payment', '2024-07-01'),
(2, 6, 350.00, 'Groceries', '2024-08-03'),
(2, 6, 320.00, 'Groceries', '2024-07-03'),
(2, 7, 200.00, 'Public transport pass', '2024-08-01'),
(2, 8, 200.00, 'Health insurance', '2024-08-01'),
(2, 9, 150.00, 'Gym membership', '2024-08-01'),
(2, 10, 400.00, 'Professional clothing', '2024-08-15'),
(2, 11, 300.00, 'Online course', '2024-07-20'),
(2, 12, 1500.00, 'Retirement savings', '2024-08-30'),
(3, 5, 900.00, 'Rent payment', '2024-08-01'),
(3, 5, 900.00, 'Rent payment', '2024-07-01'),
(3, 6, 300.00, 'Groceries', '2024-08-04'),
(3, 6, 280.00, 'Groceries', '2024-07-04'),
(3, 7, 150.00, 'Gas', '2024-08-10'),
(3, 8, 100.00, 'Health insurance', '2024-08-01'),
(3, 9, 60.00, 'Netflix and Spotify', '2024-08-01'),
(3, 10, 180.00, 'Groceries and household items', '2024-08-20');

-- 3. BUDGET QUERIES AND ANALYSIS
-- =============================================

-- Query 1: Monthly expense summary by user

SELECT 
    u.full_name,
    DATE_FORMAT(e.transaction_date, '%Y-%m') as month_year,
    SUM(e.amount) as total_expenses
FROM users u
JOIN expenses e ON u.user_id = e.user_id
GROUP BY u.user_id, u.full_name, DATE_FORMAT(e.transaction_date, '%Y-%m')
ORDER BY u.full_name, month_year;

-- Query 2: Category-wise spending analysis

SELECT 
    c.category_name,
    COUNT(e.expense_id) as transaction_count,
    SUM(e.amount) as total_amount,
    AVG(e.amount) as average_amount,
    MIN(e.amount) as min_amount,
    MAX(e.amount) as max_amount
FROM categories c
JOIN expenses e ON c.category_id = e.category_id
WHERE c.category_type = 'expense'
GROUP BY c.category_id, c.category_name
ORDER BY total_amount DESC;

-- Query 3: Monthly income vs expenses comparison


SELECT 
    u.full_name,
    DATE_FORMAT(COALESCE(i.transaction_date, e.transaction_date), '%Y-%m') as month_year,
    COALESCE(monthly_income.total_income, 0) as total_income,
    COALESCE(monthly_expenses.total_expenses, 0) as total_expenses,
    COALESCE(monthly_income.total_income, 0) - COALESCE(monthly_expenses.total_expenses, 0) as net_balance
FROM users u
LEFT JOIN (
    SELECT user_id, DATE_FORMAT(transaction_date, '%Y-%m') as month_year, SUM(amount) as total_income
    FROM income 
    GROUP BY user_id, DATE_FORMAT(transaction_date, '%Y-%m')
) monthly_income ON u.user_id = monthly_income.user_id
LEFT JOIN (
    SELECT user_id, DATE_FORMAT(transaction_date, '%Y-%m') as month_year, SUM(amount) as total_expenses
    FROM expenses 
    GROUP BY user_id, DATE_FORMAT(transaction_date, '%Y-%m')
) monthly_expenses ON u.user_id = monthly_expenses.user_id 
    AND monthly_income.month_year = monthly_expenses.month_year
LEFT JOIN income i ON u.user_id = i.user_id
LEFT JOIN expenses e ON u.user_id = e.user_id
WHERE monthly_income.month_year IS NOT NULL OR monthly_expenses.month_year IS NOT NULL
GROUP BY u.user_id, u.full_name, month_year, monthly_income.total_income, monthly_expenses.total_expenses
ORDER BY u.full_name, month_year;

-- Query 4: Top spending categories by user

SELECT 
    u.full_name,
    c.category_name,
    SUM(e.amount) as total_spent,
    COUNT(e.expense_id) as transaction_count
FROM users u
JOIN expenses e ON u.user_id = e.user_id
JOIN categories c ON e.category_id = c.category_id
GROUP BY u.user_id, u.full_name, c.category_id, c.category_name
ORDER BY u.full_name, total_spent DESC;

-- Query 5: Daily average spending by category

SELECT 
    c.category_name,
    ROUND(AVG(daily_spending.daily_total), 2) as avg_daily_spending,
    COUNT(DISTINCT daily_spending.transaction_date) as active_days
FROM categories c
JOIN (
    SELECT 
        category_id, 
        transaction_date, 
        SUM(amount) as daily_total
    FROM expenses
    GROUP BY category_id, transaction_date
)
daily_spending ON c.category_id = daily_spending.category_id
WHERE c.category_type = 'expense'
GROUP BY c.category_id, c.category_name
ORDER BY avg_daily_spending DESC;

-- 4. CREATE VIEWS FOR BALANCE TRACKING
-- =============================================

-- View 1: Current balance summary by user

CREATE VIEW user_balance_summary AS
SELECT 
    u.user_id,
    u.full_name,
    COALESCE(income_summary.total_income, 0) as total_income,
    COALESCE(expense_summary.total_expenses, 0) as total_expenses,
    COALESCE(income_summary.total_income, 0) - COALESCE(expense_summary.total_expenses, 0) as current_balance,
    COALESCE(income_summary.income_transactions, 0) as income_transactions,
    COALESCE(expense_summary.expense_transactions, 0) as expense_transactions
FROM users u
LEFT JOIN (
    SELECT 
        user_id, 
        SUM(amount) as total_income,
        COUNT(*) as income_transactions
    FROM income 
    GROUP BY user_id
) 
income_summary ON u.user_id = income_summary.user_id
LEFT JOIN (
    SELECT 
        user_id, 
        SUM(amount) as total_expenses,
        COUNT(*) as expense_transactions
    FROM expenses 
    GROUP BY user_id
) 
expense_summary ON u.user_id = expense_summary.user_id;

-- View 2: Monthly budget tracking

CREATE VIEW monthly_budget_tracking AS
SELECT 
    u.full_name,
    DATE_FORMAT(all_dates.month_date, '%Y-%m') as month_year,
    COALESCE(i_summary.monthly_income, 0) as monthly_income,
    COALESCE(e_summary.monthly_expenses, 0) as monthly_expenses,
    COALESCE(i_summary.monthly_income, 0) - COALESCE(e_summary.monthly_expenses, 0) as monthly_balance,
    CASE 
        WHEN COALESCE(i_summary.monthly_income, 0) > COALESCE(e_summary.monthly_expenses, 0) THEN 'Surplus'
        WHEN COALESCE(i_summary.monthly_income, 0) < COALESCE(e_summary.monthly_expenses, 0) THEN 'Deficit'
        ELSE 'Balanced'
    END as budget_status
FROM users u
CROSS JOIN (
    SELECT DISTINCT DATE_FORMAT(transaction_date, '%Y-%m-01') as month_date
    FROM (
        SELECT transaction_date FROM income
        UNION ALL
        SELECT transaction_date FROM expenses
    ) all_transactions
) all_dates
LEFT JOIN (
    SELECT 
        user_id, 
        DATE_FORMAT(transaction_date, '%Y-%m') as month_year,
        SUM(amount) as monthly_income
    FROM income
    GROUP BY user_id, DATE_FORMAT(transaction_date, '%Y-%m')
) i_summary ON u.user_id = i_summary.user_id 
    AND DATE_FORMAT(all_dates.month_date, '%Y-%m') = i_summary.month_year
LEFT JOIN (
    SELECT 
        user_id, 
        DATE_FORMAT(transaction_date, '%Y-%m') as month_year,
        SUM(amount) as monthly_expenses
    FROM expenses
    GROUP BY user_id, DATE_FORMAT(transaction_date, '%Y-%m')
) e_summary ON u.user_id = e_summary.user_id 
    AND DATE_FORMAT(all_dates.month_date, '%Y-%m') = e_summary.month_year
WHERE i_summary.monthly_income IS NOT NULL OR e_summary.monthly_expenses IS NOT NULL
ORDER BY u.full_name, month_year;

-- View 3: Category performance view

CREATE VIEW category_performance AS
SELECT 
    c.category_name,
    c.category_type,
    COUNT(
        CASE WHEN c.category_type = 'income' THEN i.income_id 
             ELSE e.expense_id END
    ) as transaction_count,
    SUM(
        CASE WHEN c.category_type = 'income' THEN i.amount 
             ELSE e.amount END
    ) as total_amount,
    AVG(
        CASE WHEN c.category_type = 'income' THEN i.amount 
             ELSE e.amount END
    ) as average_amount,
    MIN(
        CASE WHEN c.category_type = 'income' THEN i.transaction_date 
             ELSE e.transaction_date END
    ) as first_transaction,
    MAX(
        CASE WHEN c.category_type = 'income' THEN i.transaction_date 
             ELSE e.transaction_date END
    ) as last_transaction
FROM categories c
LEFT JOIN income i ON c.category_id = i.category_id AND c.category_type = 'income'
LEFT JOIN expenses e ON c.category_id = e.category_id AND c.category_type = 'expense'
GROUP BY c.category_id, c.category_name, c.category_type
HAVING transaction_count > 0
ORDER BY c.category_type, total_amount DESC;


-- 5. MONTHLY REPORTS QUERIES
-- =============================================

-- Report 1: Detailed Monthly Financial Report (August 2024)

SELECT 
    'MONTHLY FINANCIAL REPORT - AUGUST 2024' as report_title;

SELECT 
    u.full_name as "User",
    COALESCE(income_aug.total_income, 0) as "August Income",
    COALESCE(expense_aug.total_expenses, 0) as "August Expenses",
    COALESCE(income_aug.total_income, 0) - COALESCE(expense_aug.total_expenses, 0) as "Net Balance"
FROM users u
LEFT JOIN (
    SELECT user_id, SUM(amount) as total_income
    FROM income 
    WHERE DATE_FORMAT(transaction_date, '%Y-%m') = '2024-08'
    GROUP BY user_id
) income_aug ON u.user_id = income_aug.user_id
LEFT JOIN (
    SELECT user_id, SUM(amount) as total_expenses
    FROM expenses 
    WHERE DATE_FORMAT(transaction_date, '%Y-%m') = '2024-08'
    GROUP BY user_id
) expense_aug ON u.user_id = expense_aug.user_id
ORDER BY "Net Balance" DESC;

-- Report 2: Category breakdown for August 2024

SELECT 
    c.category_name as "Category",
    c.category_type as "Type",
    COUNT(*) as "Transactions",
    SUM(
        CASE WHEN c.category_type = 'income' THEN i.amount 
             ELSE e.amount END
    ) as "Total Amount"
FROM categories c
LEFT JOIN income i ON c.category_id = i.category_id 
    AND DATE_FORMAT(i.transaction_date, '%Y-%m') = '2024-08'
LEFT JOIN expenses e ON c.category_id = e.category_id 
    AND DATE_FORMAT(e.transaction_date, '%Y-%m') = '2024-08'
WHERE (i.income_id IS NOT NULL OR e.expense_id IS NOT NULL)
GROUP BY c.category_id, c.category_name, c.category_type
ORDER BY c.category_type, "Total Amount" DESC;


-- 6. BUDGET ANALYSIS AND INSIGHTS
-- =============================================

-- Query: Users exceeding average spending

SELECT 
    u.full_name,
    user_spending.total_expenses,
    avg_spending.average_expenses,
    user_spending.total_expenses - avg_spending.average_expenses as "Above Average By"
FROM users u
JOIN (
    SELECT user_id, SUM(amount) as total_expenses
    FROM expenses
    GROUP BY user_id
) user_spending ON u.user_id = user_spending.user_id
CROSS JOIN (
    SELECT AVG(user_totals.total_expenses) as average_expenses
    FROM (
        SELECT user_id, SUM(amount) as total_expenses
        FROM expenses
        GROUP BY user_id
    ) user_totals
) avg_spending
WHERE user_spending.total_expenses > avg_spending.average_expenses
ORDER BY "Above Average By" DESC;

-- Query: Savings rate analysis

SELECT 
    u.full_name,
    COALESCE(totals.total_income, 0) as total_income,
    COALESCE(totals.total_expenses, 0) as total_expenses,
    COALESCE(totals.total_income, 0) - COALESCE(totals.total_expenses, 0) as net_savings,
    CASE 
        WHEN COALESCE(totals.total_income, 0) > 0 THEN 
            ROUND(((COALESCE(totals.total_income, 0) - COALESCE(totals.total_expenses, 0)) / totals.total_income) * 100, 2)
        ELSE 0
    END as savings_rate_percent
FROM users u
LEFT JOIN (
    SELECT 
        u.user_id,
        SUM(i.amount) as total_income,
        SUM(e.amount) as total_expenses
    FROM users u
    LEFT JOIN income i ON u.user_id = i.user_id
    LEFT JOIN expenses e ON u.user_id = e.user_id
    GROUP BY u.user_id
) totals ON u.user_id = totals.user_id
ORDER BY savings_rate_percent DESC;


-- 7. DATA EXPORT QUERIES
-- =============================================

-- Export query for monthly summary report

SELECT 
    'Monthly Summary Export' as export_type,
    u.full_name,
    DATE_FORMAT(months.month_date, '%Y-%m') as month,
    COALESCE(i.monthly_income, 0) as income,
    COALESCE(e.monthly_expenses, 0) as expenses,
    COALESCE(i.monthly_income, 0) - COALESCE(e.monthly_expenses, 0) as balance
FROM users u
CROSS JOIN (
    SELECT DISTINCT DATE_FORMAT(transaction_date, '%Y-%m-01') as month_date
    FROM (
        SELECT transaction_date FROM income
        UNION ALL 
        SELECT transaction_date FROM expenses
    ) all_dates
) months
LEFT JOIN (
    SELECT user_id, DATE_FORMAT(transaction_date, '%Y-%m') as month, SUM(amount) as monthly_income
    FROM income GROUP BY user_id, DATE_FORMAT(transaction_date, '%Y-%m')
) i ON u.user_id = i.user_id AND DATE_FORMAT(months.month_date, '%Y-%m') = i.month
LEFT JOIN (
    SELECT user_id, DATE_FORMAT(transaction_date, '%Y-%m') as month, SUM(amount) as monthly_expenses
    FROM expenses GROUP BY user_id, DATE_FORMAT(transaction_date, '%Y-%m')
) e ON u.user_id = e.user_id AND DATE_FORMAT(months.month_date, '%Y-%m') = e.month
WHERE i.monthly_income IS NOT NULL OR e.monthly_expenses IS NOT NULL
ORDER BY u.full_name, month;

-- Sample queries to test the views

SELECT * FROM user_balance_summary;
SELECT * FROM monthly_budget_tracking;
SELECT * FROM category_performance;