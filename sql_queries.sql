SELECT name FROM sys.databases;

USE [Pizza DB];
GO
SELECT * FROM pizza_sales;
SELECT TOP 5 * FROM pizza_sales;

USE [Pizza DB];
GO

SELECT 
    Pizza_size,
    SUM(total_price) AS Total_Sales,
    CAST(
        SUM(total_price) * 100.0 /
        SUM(SUM(total_price)) OVER ()
    AS DECIMAL(10,2)) AS Sales_Percentage
FROM pizza_sales
GROUP BY Pizza_size
ORDER BY Sales_Percentage DESC;
SELECT 
    SUM(total_price) AS Total_Revenue
FROM pizza_sales;

SELECT 
    COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales;
SELECT 
    SUM(quantity) AS Total_Pizzas_Sold
FROM pizza_sales;
SELECT 
    CAST(
        SUM(total_price) * 1.0 /
        COUNT(DISTINCT order_id)
    AS DECIMAL(10,2)) AS Avg_Order_Value
FROM pizza_sales;
SELECT 
    CAST(
        SUM(quantity) * 1.0 /
        COUNT(DISTINCT order_id)
    AS DECIMAL(10,2)) AS Avg_Pizzas_Per_Order
FROM pizza_sales;
SELECT 
    pizza_size,
    SUM(total_price) AS Total_Sales,
    CAST(
        SUM(total_price) * 100.0 /
        SUM(SUM(total_price)) OVER ()
    AS DECIMAL(10,2)) AS Sales_Percentage
FROM pizza_sales
GROUP BY pizza_size
ORDER BY Sales_Percentage DESC;
SELECT TOP 5
    pizza_name,
    SUM(total_price) AS Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Revenue DESC;
SELECT TOP 5
    pizza_name,
    SUM(total_price) AS Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Revenue ASC;
SELECT 
    pizza_category,
    SUM(total_price) AS Revenue
FROM pizza_sales
GROUP BY pizza_category
ORDER BY Revenue DESC;
SELECT 
    DATENAME(MONTH, order_date) AS Month_Name,
    MONTH(order_date) AS Month_Number,
    SUM(total_price) AS Revenue
FROM pizza_sales
GROUP BY 
    DATENAME(MONTH, order_date),
    MONTH(order_date)
ORDER BY Month_Number;
SELECT 
    pizza_name,
    SUM(total_price) AS Revenue,
    RANK() OVER (ORDER BY SUM(total_price) DESC) AS Revenue_Rank
FROM pizza_sales
GROUP BY pizza_name;