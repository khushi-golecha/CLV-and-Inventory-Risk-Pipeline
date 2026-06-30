SELECT * FROM customers;

SELECT * FROM orders;

SELECT * FROM order_items;

-- customers count
SELECT COUNT(*) FROM customers;

--Total Orders
SELECT COUNT(*) FROM orders

--Revenue
SELECT SUM(payment_value)
FROM order_payments;

--Total orders per city
SELECT customer_city, COUNT(order_id) AS Orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY customer_city;

--Top Customers
SELECT customer_id, SUM(payment_value) Revenue
FROM orders o
JOIN order_payments p ON o.order_id = p.order_id
GROUP BY customer_id
ORDER BY Revenue DESC;

--Best Selling Products
SELECT product_id, COUNT(*) Sales
FROM order_items
GROUP BY product_id
ORDER BY Sales DESC;

--Monthly Revenue 
SELECT MONTH(order_purchase_timestamp) AS Month, SUM(payment_value) Revenue
FROM orders o
JOIN order_payments p
ON o.order_id=p.order_id
GROUP BY MONTH(order_purchase_timestamp)
ORDER BY Month

--CTE
WITH Revenue AS(
SELECT customer_id,
SUM(payment_value) Revenue
FROM  orders o
JOIN order_payments p ON o.order_id = p.order_id
GROUP BY customer_id
)
SELECT *
FROM Revenue
ORDER BY Revenue DESC;

-- Rolling Average
WITH DailySales AS
(
    SELECT
        CAST(o.order_purchase_timestamp AS DATE) AS sale_date,
        SUM(oi.price) AS daily_sales
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    GROUP BY CAST(o.order_purchase_timestamp AS DATE)
)

SELECT
    sale_date,
    daily_sales,
    AVG(daily_sales) OVER (
        ORDER BY sale_date
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS rolling_avg_7days
FROM DailySales
ORDER BY sale_date;

-- Updating null values
UPDATE products
SET product_category_name = 'Unknown'
WHERE product_category_name IS NULL;