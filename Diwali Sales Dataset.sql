-- The MySQL project is focused on analyzing sales data from a dataset named "Diwali Sales Dataset."
-- The dataset contains transactional records related to purchases made during the Diwali season. The SQL script includes queries for data cleaning, revenue analysis, customer segmentation, and product performance evaluation.
-- The project is structured to help businesses understand customer behavior, revenue trends, and product performance during Diwali sales using SQL queries.


-- Selecting the owe Table 
SELECT * FROM diwali.`diwali sales data`;

-- Trim Extra Spaces in Text Columns
UPDATE diwali.`diwali sales data`
SET Cust_name = TRIM(Cust_name),
    Product_ID = TRIM(Product_ID),
    State = TRIM(State);

-- To remove duplicates and keep only the first occurrence
SELECT User_ID, Product_ID, Orders, COUNT(*) AS duplicate_count
FROM diwali.`diwali sales data`
GROUP BY User_ID, Product_ID, Orders
HAVING COUNT(*) > 1;


-- Check for missing values
SELECT * FROM diwali.`diwali sales data`
WHERE User_ID IS NULL OR Product_ID IS NULL OR Amount IS NULL;

-- Total Revenue generated 
SELECT SUM(CAST(REPLACE(Amount, '$', '') AS DECIMAL(10,2))) AS Total_Sales FROM diwali.`diwali sales data`;

-- Top 5 Highest Spending Customers
SELECT User_ID, Cust_name, SUM(CAST(REPLACE(Amount, '$', '') AS DECIMAL(10,2))) AS Total_Spent
FROM diwali.`diwali sales data`
GROUP BY User_ID, Cust_name
ORDER BY Total_Spent DESC
LIMIT 5;

-- Find which category was purchased the most
SELECT Product_Category, COUNT(*) AS Purchase_Count
FROM diwali.`diwali sales data`
GROUP BY Product_Category
ORDER BY Purchase_Count DESC
LIMIT 1;

-- Compare total sales between male and female customers
SELECT Gender, SUM(CAST(REPLACE(Amount, '$', '') AS DECIMAL(10,2))) AS Total_Spent
FROM diwali.`diwali sales data`
GROUP BY Gender;

-- Find which state contributed the most to sales
SELECT State, SUM(CAST(REPLACE(Amount, '$', '') AS DECIMAL(10,2))) AS Total_Sales
FROM diwali.`diwali sales data`
GROUP BY State
ORDER BY Total_Sales DESC;

-- Determine which Age spent the most
SELECT Age, SUM(CAST(REPLACE(Amount, '$', '') AS DECIMAL(10,2))) AS Total_Spent
FROM diwali.`diwali sales data`
GROUP BY Age
ORDER BY Total_Spent DESC;

-- Total Sales by Occupation
SELECT Occupation, SUM(CAST(REPLACE(Amount, '$', '') AS DECIMAL(10,2))) AS Total_Sales
FROM diwali.`diwali sales data`
GROUP BY Occupation
ORDER BY Total_Sales DESC;

-- Most Frequent Buyers (Top 5 by Number of Orders)
SELECT User_ID, Cust_name, SUM(Orders) AS Total_Orders
FROM diwali.`diwali sales data`
GROUP BY User_ID, Cust_name
ORDER BY Total_Orders DESC
LIMIT 5;

-- Calculate the average amount spent per order
SELECT AVG(CAST(REPLACE(Amount, '$', '') AS DECIMAL(10,2))) AS Avg_Order_Value
FROM diwali.`diwali sales data`;

-- Determine which zone had the highest sales and order count
SELECT Zone, SUM(Orders) AS Total_Orders, SUM(CAST(REPLACE(Amount, '$', '') AS DECIMAL(10,2))) AS Total_Revenue
FROM diwali.`diwali sales data`
GROUP BY Zone
ORDER BY Total_Revenue DESC;





