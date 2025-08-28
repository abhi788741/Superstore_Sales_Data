create database superstore;
use superstore;
show tables;
desc sample_superstore;

select *
from sample_superstore;

#Total Sales
select sum(Sales) 
from sample_superstore;

#Total Profit
select sum(Profit)
from sample_superstore;

#Total Customers
select count(Customer_ID) 
from sample_superstore;

#Total Quanity sales
select sum(Quantity) 
from sample_superstore;

#Sales by Region
select Region,sum(Sales)
from sample_superstore 
group by Region;

#Top 10 customers total sales
select Customer_Name,sum(Sales) 
from sample_superstore 
group by Customer_Name 
order by sum(Sales) desc
limit 10;

#customer by ship mode
select Ship_Mode,count(Customer_ID) 
from sample_superstore
group by Ship_Mode;

#highest sales by top 10 state
select State,sum(Sales)
from sample_superstore
group by State 
order by sum(Sales) desc
limit 10;

#loss making sub-category
select Sub_Category,sum(Profit)
from sample_superstore
group by Sub_Category
order by sum(Profit) asc
limit 3;

#Top 10 high loss making products
select Product_Name,Profit
from sample_superstore
where Profit<0
order by Profit asc
limit 10;

#Sales by Category
select Category,sum(Sales)
from sample_superstore
group by Category;

#highest Profit by Sub_category
select Sub_Category,sum(Profit)
from sample_superstore
group by Sub_Category
order by sum(Profit) desc;

#Profit by Region
select Region,sum(Profit)
from sample_superstore
group by Region
order by sum(Profit) desc;

#Average sales by Sub_Category
select Sub_Category,avg(Sales)
from sample_superstore
group by Sub_Category
order by avg(Sales) asc;

#Quantity sold by Category
select Category,sum(Quantity)
from sample_superstore
group by Category;

#highest orders by day or date
select Order_Date,count(Order_ID)
from sample_superstore
group by Order_Date
order by count(Order_ID) desc
limit 20;

#Total customers and Sales by Segment
select Segment,count(Customer_Name),sum(Sales)
from sample_superstore
group by Segment;

#customers with total sales greater than average sales
select Customer_Name,sum(Sales),avg(Sales)
from sample_superstore
group by Customer_Name
having sum(Sales)>(select avg(Sales) from sample_superstore);

#high sales and high profit by City
select City,sum(Sales),sum(Profit)
from sample_superstore
group by City
order by sum(Sales) desc;

#Top 5 profitable cities
select City,sum(Profit)
from sample_superstore
group by City
order by sum(Profit) desc
limit 5;

#Top 5 loss-making states
select State,sum(Profit)
from sample_superstore
group by State
having sum(Profit)<0
order by sum(Profit) asc
limit 5;

#Total sales by ship mode
select Ship_Mode,sum(Sales)
from sample_superstore
group by Ship_Mode;

#Top 10 Product having maximum Discount
select Product_Name,max(Discount)
from sample_superstore
group by Product_Name
order by max(Discount) desc
limit 10;

#Sales of Top 10 Cities with 0 Discount 
select city,sum(sales),Discount 
from sample_superstore
where Discount=0 
group by city 
order by sum(sales) desc
limit 10;

# Average Quantity sold by category
select Category,avg(Quantity)
from sample_superstore group by Category;

# Total Customers by region
select Region,count(Customer_ID)
from sample_superstore
group by Region;

# Second Highest sales by any customer
select Customer_Name,Sales
from sample_superstore
where Sales=(
select max(Sales) 
from sample_superstore 
where Sales<(
select max(Sales) 
from sample_superstore));

# Highest Profitable Product and its name
select Product_Name,Profit
from sample_superstore
where Profit=(
select max(Profit) 
from sample_superstore);

#lowest sales by postal code city and state
select Postal_Code,City,State,Sales
from sample_superstore
where Sales=(
select min(Sales) 
from sample_superstore);

# Customers having sales less than average sales
select Customer_Name,Sales
from sample_superstore
where Sales<(
select avg(Sales)
from sample_superstore)
order by Sales asc;

#Sub-Category sold quantity more than average quantity
select distinct Sub_Category,Quantity
from sample_superstore
where Quantity>(
select avg(Quantity) 
from sample_superstore);
