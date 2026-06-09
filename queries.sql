-- Blinkit_Sales_Analysis

SELECT *FROM blinkit_data
LIMIT 10


SELECT COUNT(*) as total_records
FROM blinkit_data


-- Data Cleaning: 
--Find NULL values
SELECT * FROM blinkit_data
WHERE
    item_identifier IS NULL OR
    item_fat_content IS NULL OR
    item_type IS NULL OR
    item_weight IS NULL OR
    item_visibility IS NULL OR
    outlet_identifier IS NULL OR
    outlet_establishment_year IS NULL OR
    outlet_size IS NULL OR
    outlet_location_type IS NULL OR
    outlet_type IS NULL OR
    sales IS NULL OR
    rating IS NULL;

-- Delete rows with NULLs
DELETE FROM blinkit_data
WHERE
    item_identifier IS NULL OR
    item_fat_content IS NULL OR
    item_type IS NULL OR
    item_weight IS NULL OR
    item_visibility IS NULL OR
    outlet_identifier IS NULL OR
    outlet_establishment_year IS NULL OR
    outlet_size IS NULL OR
    outlet_location_type IS NULL OR
    outlet_type IS NULL OR
    sales IS NULL OR
    rating IS NULL;

--UPDATE Item_Fat_Content column
UPDATE blinkit_data
SET Item_Fat_Content =
CASE
WHEN Item_Fat_Content IN ('LF', 'low fat') THEN 'Low Fat'
WHEN Item_Fat_Content = 'reg' THEN 'Regular'
ELSE Item_Fat_Content
END

SELECT DISTINCT(Item_Fat_Content) FROM blinkit_data



-- Data Analysis & Business Key Problems & Answers

-- Q1: Write a query to find the total sales (revenue) from all items.

-- Q2: Write a query to calculate the average sales per item.

-- Q3: Write a query to count the total number of items sold.

-- Q4: Write a query to find the average customer rating of all items.

-- Q5: Write a query to get total sales grouped by item fat content.

-- Q6: Write a query to get total sales grouped by item type.

-- Q7: Write a query to get total sales by outlet location type and item fat content.

-- Q8: Write a query to get total sales by outlet establishment year.

-- Q9: Write a query to find total sales by outlet location type.

-- Q10: Write a query to calculate total sales and percentage contribution by outlet size.

-- Q11: Write a query to calculate total sales and percentage contribution by outlet type.







--Q.1 Write a SQL query to find the Total Sales(revenue) from all items.
--The overall revenue generated from all items sold

SELECT              --here we use cast function for 2 decimal
CAST(SUM(sales) AS DECIMAL (10,2)) AS Total_Sales
FROM blinkit_data;


--Q.2 Write a SQL query to find the Average Sales per item.
--The Average revenue per sale

SELECT 
AVG(sales) AS Avg_Sales
FROM blinkit_data;


--Q.3 Write a SQL query to find total Number of items
--The total count of different items sold

SELECT 
COUNT(*) AS No_Of_Items
FROM blinkit_data;


--Q.4 Write a SQL query to find the Average Rating
--The average customer rating for items sold

SELECT 	
AVG(Rating) AS Avg_Rating
FROM blinkit_data;


-- Q5: Write a query to get total sales grouped by item fat content.

SELECT item_fat_content, SUM(sales) AS total_sales
FROM blinkit_data
GROUP BY item_fat_content
ORDER BY total_sales DESC;


-- Q6: Write a query to get total sales grouped by item type.

SELECT item_Type, SUM(sales) AS total_sales
FROM blinkit_data
GROUP BY item_type
ORDER BY total_sales DESC;


-- Q7: Write a query to get total sales by outlet location type and item fat content.

SELECT Outlet_Location_Type,Item_Fat_Content,
SUM(sales) AS total_sales
FROM blinkit_data
GROUP BY Outlet_Location_Type,Item_Fat_Content
ORDER BY total_sales ASC;

 
-- Q8: Write a query to get total sales by outlet establishment year.

SELECT Outlet_Establishment_Year,
SUM(sales) AS total_sales
FROM blinkit_data
GROUP BY Outlet_Establishment_Year
ORDER BY total_sales DESC;

-- Q9: Write a query to find total sales by outlet location type.

SELECT Outlet_Location_Type,
SUM(sales) AS total_sales
FROM blinkit_data
GROUP BY Outlet_Location_Type
ORDER BY total_sales DESC;


-- Q10: Write a query to calculate total sales and percentage contribution by outlet size.

SELECT Outlet_Size,
SUM(Sales) AS Total_Sales,
(SUM(Sales) * 100.0 / SUM(SUM(Sales)) OVER()) AS Sales_Percentage
FROM blinkit_data
GROUP BY Outlet_Size
ORDER BY Total_Sales DESC;


-- Q11: Write a query to calculate total sales and percentage contribution by outlet type.

SELECT Outlet_Type,
SUM(Sales) AS Total_Sales,
(SUM(Sales) * 100.0 / SUM(SUM(Sales)) OVER()) AS Sales_Percentage
FROM blinkit_data
GROUP BY Outlet_Type
ORDER BY Total_Sales DESC;










