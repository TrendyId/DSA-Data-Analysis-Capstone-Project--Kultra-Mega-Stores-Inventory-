# DSA-Data-Analysis-Capstone-Project--Kultra-Mega-Stores-Inventory-
This project involves Exploratory Data  Analysis (EDA) using SQL Server Database to analyze the data set, and provide insights.

## Overview

This project presents an in-depth inventory and customer analysis for Kultra Mega Stores (KMS), leveraging SQL Server to explore sales trends, shipping behavior, customer profitability, and business performance insights. The goal is to aid data-driven decision-making to optimize revenue and operational efficiency.

The dataset was cleaned and structured in SQL Server before performing various business intelligence queries.

## Tools & Technologies

- Microsoft SQL Server
- T-SQL (Transact-SQL)

## Database

**Database Name:** `Capstone_Project`  
**Table Used:** `[dbo].[KMS Sql Case Study]`

```sql
CREATE DATABASE Capstone_Project;
USE Capstone_Project;
SELECT * FROM [dbo].[KMS Sql Case Study];

```
 
# Key Business Questions & Insights

## 1. Which Product Category Has the Highest Sales?

```SQL
SELECT Product_Category, Sales
FROM [dbo].[KMS Sql Case Study]
WHERE Sales = (SELECT MAX(Sales) FROM [dbo].[KMS Sql Case Study]);
```

![image](https://github.com/user-attachments/assets/baa5c14b-0094-467b-8c8a-62868a031651)

Technology product category has the highest sales.


## 2. Top 3 and Bottom 3 Regions by Sales
-- Top 3 Regions

```SQL
SELECT TOP 3 Region, SUM(Sales) AS TotalSales
FROM [dbo].[KMS Sql Case Study]
GROUP BY Region
ORDER BY TotalSales DESC;
```

![image](https://github.com/user-attachments/assets/81d6b4ce-ea6d-4c9d-a9d6-f80e34a61d02)

Foe the top 3 regions, West has total sales of $3597549.41, Ontario has total sales of $3063212.60, and Prairie has total sales of $2837304


-- Bottom 3 Regions
```SQL
SELECT TOP 3 Region, SUM(Sales) AS TotalSales
FROM [dbo].[KMS Sql Case Study]
GROUP BY Region
ORDER BY TotalSales A
```

![image](https://github.com/user-attachments/assets/46eb7cc4-6cc8-4edd-97da-df72de67d428)

For the bottom 3 regions, Nunavut has total sales of $116376.47, Northwest Territories has total sales of $800847.35, and Yukon has total sales of $975867.39


## 3. Total Sales of Appliances in Ontario

```SQL
SELECT SUM(Sales) AS TotalSales
FROM [dbo].[KMS Sql Case Study]
WHERE Region = 'Ontario' AND Product_Category = 'Appliances';
```

![image](https://github.com/user-attachments/assets/d557da9b-a4db-463c-be01-9b6148ca49fd)

The total sales of appliances in Ontario is $3063212.60


## 4. How to Improve Revenue from Bottom 10 Customers
-- Bottom 10 by Profit

```SQL
SELECT TOP 10 *
FROM [dbo].[KMS Sql Case Study]
ORDER BY Profit ASC;
```

Recommendation: Focus on personalized offers, better product recommendations, and flexible payment terms for underperforming customers to improve their lifetime value.


## 5.  Shipping Method with Highest Cost

```SQL
SELECT Shipping_Cost, Ship_Mode
FROM [dbo].[KMS Sql Case Study]
WHERE Shipping_Cost = (
  SELECT MAX(Shipping_Cost)
  FROM [dbo].[KMS Sql Case Study]
);
```

![image](https://github.com/user-attachments/assets/b7994074-1d53-40df-a5b0-b2ae79d18ad5)

Delivery Truck is the shipping method with the highest cost.


## 6. Most Valuable Customers by Sales & Profit
-- Top 10 by Sales

```SQL
SELECT TOP 10 Sales, Product_Name, Customer_Name
FROM [dbo].[KMS Sql Case Study]
ORDER BY Sales DESC;
```

-- Top 10 by Profit

```SQL
SELECT TOP 10 Profit, Product_Name, Customer_Name
FROM [dbo].[KMS Sql Case Study]
ORDER BY Profit DESC;
```

![image](https://github.com/user-attachments/assets/46e473ba-8bf9-49f2-9c0d-35d39a2ea848)


## 7.  Small Business Customer with Highest Sales

```SQL
SELECT TOP 1 Customer_Name, SUM(Sales) AS Total_Sales
FROM [dbo].[KMS Sql Case Study]
WHERE Customer_Segment = 'Small Business'
GROUP BY Customer_Name
ORDER BY Total_Sales DESC;
```

![image](https://github.com/user-attachments/assets/881fcd7e-3356-4d6a-bbf2-e454c0a6bf95)

Dennis Kane is the small business customer with the highest sales.


## 8. Corporate Customer with Most Orders (2009–2012)

```SQL
SELECT TOP 1 Customer_Name, COUNT(Order_ID) AS Order_Count
FROM [dbo].[KMS Sql Case Study]
WHERE Customer_Segment = 'Corporate'
GROUP BY Customer_Name
ORDER BY Order_Count DESC;
```

![image](https://github.com/user-attachments/assets/f978aa0b-800b-4a81-8905-e6b79d185d7a)

Adam Hart is the corporate customer with the most orders


## 9. Most Profitable Consumer Customer

```SQL
SELECT TOP 1 Customer_Name, SUM(Profit) AS Total_Profit
FROM [dbo].[KMS Sql Case Study]
WHERE Customer_Segment = 'Consumer'
GROUP BY Customer_Name
ORDER BY Total_Profit DESC;
```




## 10. Customers Who Returned Items

```SQL
SELECT 
    Customer_Name, 
    Customer_Segment, 
    Product_Name, 
    Profit, 
    Sales, 
    Order_ID
FROM 
    [dbo].[KMS Sql Case Study]
WHERE 
    Profit < 0
ORDER BY 
    Profit ASC;
```

![image](https://github.com/user-attachments/assets/6a89baaa-7ed6-4087-8aba-9f3bd5d93afd)



## 11. Shipping Cost vs Order Priority — Was It Justified?

```SQL
SELECT 
    Ship_Mode, 
    Order_Priority, 
    Shipping_Cost, 
    Order_Date, 
    Ship_Date
FROM 
    [dbo].[KMS Sql Case Study]
ORDER BY 
    Shipping_Cost DESC;
```

```SQL
SELECT 
    Ship_Mode, 
    Order_Priority, 
    COUNT(*) AS Orders
FROM 
   [dbo].[KMS Sql Case Study]
GROUP BY 
    Ship_Mode, Order_Priority
ORDER BY 
    Order_Priority, Ship_Mode;
```

Analysis: If high-cost shipping methods like "Express Air" were used for low-priority orders, this indicates inefficiencies. Match order urgency with shipping mode to control logistics expenses.

## Summary
This capstone project demonstrates advanced SQL querying techniques to analyze:

- Regional and category sales performance
- Customer profitability
- Operational costs (shipping)
- Segment-based targeting
- Data-driven strategy for boosting underperforming segments

