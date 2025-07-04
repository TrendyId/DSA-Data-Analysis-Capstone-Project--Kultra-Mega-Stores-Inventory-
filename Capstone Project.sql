Create database Capstone_Project

Select * from [dbo].[KMS Sql Case Study]


----1. Which Product Category has the Hghest sales?
Select Product_Category, Sales from [dbo].[KMS Sql Case Study]
Where sales = (select max(sales) from [dbo].[KMS Sql Case Study])

----2. What are the Top 3 and Bottom 3 Region in Terms of Sales?
Select top 3 region, sum(sales) as totalsales from [dbo].[KMS Sql Case Study]
Group by region
Order by totalsales desc

Select top 3 region, sum(sales) as totalsales from [dbo].[KMS Sql Case Study]
Group by region
Order by totalsales asc


-----3. What were the total sales of appliances in Ontario?
select sum(sales) as totalsales from [dbo].[KMS Sql Case Study] as ontario
where region = 'Ontario'


------4. Advise the management of KMS on what to do to increase the revenue from the bottom 10 customers 
Select top 10 * from [dbo].[KMS Sql Case Study]
order by profit desc

Select top 10 * from [dbo].[KMS Sql Case Study]
order by profit asc

-----I will advice management to....


-----5. KMS incurred the most shipping cost using which shipping method?
select * from [dbo].[KMS Sql Case Study]

select (Shipping_Cost),Ship_Mode from [dbo].[KMS Sql Case Study]
Where Shipping_Cost = (select max(Shipping_Cost) as Max_Shipping_Cost from [dbo].[KMS Sql Case Study])



------6. Who are the most valuable customers, and what products or services do they typically purchase?
select * from [dbo].[KMS Sql Case Study]
select top 10 Sales, Product_Name, Customer_Name
from [dbo].[KMS Sql Case Study]
Order by Sales desc

select * from [dbo].[KMS Sql Case Study]
select top 10 Sales, Product_Name, Customer_Name,Profit
from [dbo].[KMS Sql Case Study]
Order by Profit desc


-------7.  Which small business customer had the highest sales?
Select Top 1 Customer_Name, Sum(Sales) As Total_Sales
From [dbo].[KMS Sql Case Study]
Where Customer_Segment = 'small business'
Group by Customer_Name
Order by Total_sales desc

------8.  Which Corporate Customer placed the most number of orders in 2009 – 2012? 
Select * from [dbo].[KMS Sql Case Study]
Select Top 1 Customer_Name, Count(Order_ID) As Order_Count
From [dbo].[KMS Sql Case Study]
Where Customer_Segment = 'Corporate'
Group by Customer_Name
Order by Order_Count desc


-----9. Which consumer customer was the most profitable one? 
Select Top 1 Customer_Name, Sum(Profit) As Total_Profit
From [dbo].[KMS Sql Case Study]
Where Customer_Segment = 'Consumer'
Group by Customer_Name
Order by Total_Profit desc


------10.  Which customers returned items, and what segment do they belong to?
Select * from [dbo].[KMS Sql Case Study]

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


------11. If the delivery truck is the most economical but the slowest shipping method and 
------Express Air is the fastest but the most expensive one, do you think the company 
------appropriately spent shipping costs based on the Order Priority? Explain your answer 

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

------Are low-priority orders (e.g., "Low", "Medium") being shipped via Express Air (expensive)?

------Are critical/high-priority orders being shipped via Delivery Truck (economical but slow)?

------Is there a mismatch between urgency and shipping cost?