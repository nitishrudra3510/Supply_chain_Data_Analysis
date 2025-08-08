use supply_chain;

CREATE TABLE supply_chain_data_2 (
    product_type VARCHAR(50),
    sku VARCHAR(50),
    price DECIMAL(10, 2),
    availability INT,
    number_of_products_sold INT,
    revenue_generated DECIMAL(12, 2),
    customer_demographics VARCHAR(50),
    stock_levels INT,
    lead_times INT,
    order_quantities INT,
    shipping_times INT,
    shipping_carriers VARCHAR(50),
    shipping_costs DECIMAL(10, 2),
    supplier_name VARCHAR(100),
    location VARCHAR(100),
    lead_time INT,
    production_volumes INT,
    manufacturing_lead_time INT,
    manufacturing_costs DECIMAL(10, 2),
    inspection_results VARCHAR(50),
    defect_rates DECIMAL(5, 4),
    transportation_modes VARCHAR(50),
    routes VARCHAR(50),
    costs DECIMAL(10, 2),
    profit DECIMAL(12, 2),
    cost_per_unit DECIMAL(10, 4),
    defect_impact DECIMAL(12, 4)
);

# SHOW THE TABLES;
select * from supply_chain_data_2;


# view of 10 rows;
SELECT * FROM supply_chain_data_2
LIMIT 10;


# count total records;

SELECT COUNT(*) AS Total_rows from supply_chain_data_2;


# view all unique product types;
SELECT DISTINCT `Product type` FROM supply_chain_data_2;


# 4️⃣ Total revenue and total profit

SELECT 
  SUM(`Revenue generated`) AS total_revenue,
  SUM(`Revenue generated` - `Manufacturing costs` - `Shipping costs`) AS total_profit
FROM supply_chain_data_2;

# What is the average shipping cost by transportation mode?

SELECT 
  `Transportation modes`,
  AVG(`Shipping costs`) AS avg_shipping_cost
FROM supply_chain_data_2
GROUP BY `Transportation modes`;


# Units sold per product type:

SELECT 
  `Product type`,
  SUM(`Number of products sold`) AS total_units_sold
FROM supply_chain_data_2
GROUP BY `Product type`
ORDER BY total_units_sold DESC;

# What is the price and revenue of each product type?

select 'Product type', `Price`, `Revenue generated`
FROM supply_chain_data_2;


# What are the top 10 most expensive products by price?

SELECT `SKU`, `Product type`, `Price`
FROM supply_chain_data_2
ORDER BY `Price` DESC
LIMIT 10;


# Which products have a price greater than ₹100?
SELECT `SKU`, `Product type`, `Price`
FROM supply_chain_data_2
WHERE `Price` > 100;


# How many products are there in each product type?

SELECT `Product type`, COUNT(*) AS product_count
FROM supply_chain_data_2
GROUP BY `Product type`;


# What is the total revenue generated from each product type?

SELECT `Product type`, SUM(`Revenue generated`) AS total_revenue
FROM supply_chain_data_2
GROUP BY `Product type`;


# Which supplier has the lowest average defect rate?

SELECT `Supplier name`, ROUND(AVG(`Defect rates`), 4) AS avg_defect
FROM supply_chain_data_2
GROUP BY `Supplier name`
ORDER BY avg_defect ASC
LIMIT 1;


# Which suppliers are located in different cities?
# Which cities (locations) are used by suppliers?
select distinct `Location` from supply_chain_data_2;

# What is the minimum and maximum defect rate?
SELECT 
	MIN(`Defect rates`) as min_defect_rate,
    MAX(`Defect rates`) as Max_defect_rate
from supply_chain_data_2;


# What is the number of records for each shipping carrier?
SELECT `Shipping carriers`, count(*) as shipers
from supply_chain_data_2
GROUP BY `Shipping carriers`;


# Show all products where the availability is less than 100 units.
select `SKU`, `Product type`, `Availability`
from supply_chain_data_2
WHERE `Availability` < 100;


# What is the average manufacturing cost by product type?

SELECT `Product type`, AVG(`Manufacturing costs`) AS avg_mfg_cost
from supply_chain_data_2
group by `Product type`;


# Show all suppliers based in 'Mumbai'.
select * from supply_chain_data_2
where 'Location'