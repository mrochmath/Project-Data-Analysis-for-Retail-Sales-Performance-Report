--Project Data Analysis for Retail: Sales Performance Report--

-- Dataset Brief
SELECT * FROM dqlab_sales_store
LIMIT 5;

-- Overall Perfomance by Year

SELECT
  YEAR(order_date) AS years,
  SUM(sales) AS sales,
  COUNT(*) AS number_of_order
FROM
  dqlab_sales_store
where
  order_status = 'Order Finished'
group by 1
order by 1;

-- Overall Performance by Product Sub Category
SELECT
  YEAR(order_date) AS years,
  product_sub_category,
  SUM(sales) AS sales
FROM 
  dqlab_sales_store
WHERE 
  YEAR(order_date) BETWEEN 2011 AND 2012
  AND order_status = 'Order Finished'
GROUP BY 1, 2
ORDER BY 1, 3 DESC;

-- Promotion Effectiveness and Efficiency by Years
SELECT
  YEAR(order_date) AS years,
  SUM(sales) AS sales,
  SUM(discount_value) AS promotion_value,
  ROUND((SUM(discount_value)/SUM(sales))*100, 2) AS burn_rate_percentage
FROM 
  dqlab_sales_store
WHERE
  order_status = 'Order Finished'
GROUP BY 1
ORDER BY 1;

-- Promotion Effectiveness and Efficiency by Product Sub Category
SELECT
  YEAR(order_date) AS years,
  product_sub_category,
  product_category,
  SUM(sales) AS sales,
  SUM(discount_value) AS promotion_value,
  ROUND((SUM(discount_value)/SUM(sales))*100, 2) AS burn_rate_percentage
FROM 
  dqlab_sales_store
WHERE
  order_status = 'Order Finished'
  AND YEAR(order_date) = 2012
GROUP BY 1, 2, 3  
ORDER BY 4 desc;

-- Customers Transactions per Year
SELECT
  YEAR(order_date) AS years,
  COUNT(DISTINCT customer) AS number_of_customer
FROM 
  dqlab_sales_store
WHERE
  order_status = 'Order Finished'
GROUP BY 1  
ORDER BY 1;