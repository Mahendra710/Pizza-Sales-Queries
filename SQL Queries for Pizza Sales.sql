select *
from pizza_sales

-- Total_Revenue

select sum(total_price) as Total_Revenue
from pizza_sales

-- Avg Order Value

select sum(total_price)/count(distinct order_id) As AVG_Order_Value
from pizza_sales

--Total_Pizza_Sold

select sum(quantity) AS Total_Pizza_Sold
from pizza_sales

--Total Order

select count(distinct order_id) as Total_Order
from pizza_sales

--Avg Pizza per order

select (Cast(sum(quantity) as decimal(10,2)))/ (cast(count(distinct order_id) as decimal(10,2))) As AVG_Pizza_per_Order
from pizza_sales

-- Daily Trend 

select datename(DW, order_date) as Order_Day, count(distinct order_id) as Total_order
from pizza_sales
group by datename(DW, order_date)

-- Monthly Trend 

select datename(Month,order_date) as Month_name ,count(distinct order_id) as Total_order
from pizza_sales
group by datename(Month, order_date)
order by Total_order desc

--% of Sales By Categories 

select pizza_category, (sum(total_price) *100)/(select sum(total_price) from pizza_sales) as Percentge_of_Sales_By_Categories
from pizza_sales
group by pizza_category

--% of Sales By Pizza Size
select pizza_size, (sum(total_price) *100)/(select sum(total_price) from pizza_sales) as Percentge_of_Sales_By_Size
from pizza_sales
group by pizza_size

-- TOP 5 Pizza by Revenue

select top 5 pizza_name, Sum(total_price) as Total_revenue
from pizza_sales
group by pizza_name
order by sum(total_price) desc

--Bottom 5 pizza By Revenue

select top 5 pizza_name, Sum(total_price) as Total_revenue
from pizza_sales
group by pizza_name
order by sum(total_price) 

--TOP 5 pizza By Quantity
select top 5 pizza_name, Sum(quantity) as Total_Quantity
from pizza_sales
group by pizza_name
order by sum(Quantity) desc

--Bottom 5 pizza By Quantity

select top 5 pizza_name, Sum(quantity) as Total_Quantity
from pizza_sales
group by pizza_name
order by sum(Quantity)

--TOP 5 pizza By total_order
select top 5 pizza_name, Count(distinct order_id) as Total_Order
from pizza_sales
group by pizza_name
order by count(distinct order_id) desc

-- Bottom 5 Pizza By total_Order

select top 5 pizza_name, Count(distinct order_id) as Total_Order
from pizza_sales
group by pizza_name
order by count(distinct order_id)



