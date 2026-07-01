/*
=========================================================
Business Queries
Project: Customer Lifetime Value (CLV) Analysis
Database: Olist E-commerce
Author: Khushi Jain
=========================================================
*/

---------------------------------------------------------
-- 1. Total Revenue
---------------------------------------------------------
SELECT
    ROUND(SUM(payment_value), 2) AS Total_Revenue
FROM order_payments;


---------------------------------------------------------
-- 2. Monthly Revenue Trend
---------------------------------------------------------
SELECT
    CONVERT(char(7), o.order_purchase_timestamp, 120) AS [Month],
    ROUND(SUM(op.payment_value), 2) AS Revenue
FROM orders o
JOIN order_payments op
    ON o.order_id = op.order_id
GROUP BY CONVERT(char(7), o.order_purchase_timestamp, 120)
ORDER BY [Month];


---------------------------------------------------------
-- 3. Monthly Orders
---------------------------------------------------------
SELECT
    CONVERT(char(7), order_purchase_timestamp, 120) AS [Month],
    COUNT(order_id) AS Total_Orders
FROM orders
GROUP BY CONVERT(char(7), order_purchase_timestamp, 120)
ORDER BY [Month];


---------------------------------------------------------
-- 4. Top 10 Customers by Revenue
---------------------------------------------------------
SELECT TOP 10
    c.customer_unique_id,
    ROUND(SUM(op.payment_value), 2) AS Total_Spent
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_payments op
    ON o.order_id = op.order_id
GROUP BY c.customer_unique_id
ORDER BY Total_Spent DESC;


---------------------------------------------------------
-- 5. Average Order Value
---------------------------------------------------------
SELECT
    ROUND(AVG(payment_value), 2) AS Average_Order_Value
FROM order_payments;


---------------------------------------------------------
-- 6. Revenue by Product Category
---------------------------------------------------------
SELECT
    pct.product_category_name_english AS Category,
    ROUND(SUM(op.payment_value), 2) AS Revenue
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
JOIN product_category_name_translation pct
    ON p.product_category_name = pct.product_category_name
JOIN order_payments op
    ON oi.order_id = op.order_id
GROUP BY pct.product_category_name_english
ORDER BY Revenue DESC;


---------------------------------------------------------
-- 7. Top 10 Product Categories by Items Sold
---------------------------------------------------------
SELECT TOP 10
    pct.product_category_name_english,
    COUNT(*) AS Items_Sold
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
JOIN product_category_name_translation pct
    ON p.product_category_name = pct.product_category_name
GROUP BY pct.product_category_name_english
ORDER BY Items_Sold DESC;


---------------------------------------------------------
-- 8. Average Delivery Time
---------------------------------------------------------
SELECT
    ROUND(AVG(DATEDIFF(DAY,
        order_purchase_timestamp,
        order_delivered_customer_date)),2) AS Avg_Delivery_Days
FROM orders
WHERE order_delivered_customer_date IS NOT NULL;


---------------------------------------------------------
-- 9. Delivery Time Distribution
---------------------------------------------------------
SELECT
CASE
    WHEN DATEDIFF(DAY, order_purchase_timestamp, order_delivered_customer_date) <= 5
        THEN '0-5 Days'

    WHEN DATEDIFF(DAY, order_purchase_timestamp, order_delivered_customer_date) <= 10
        THEN '6-10 Days'

    WHEN DATEDIFF(DAY, order_purchase_timestamp, order_delivered_customer_date) <= 15
        THEN '11-15 Days'

    ELSE '15+ Days'
END AS Delivery_Time,

COUNT(*) AS Orders

FROM orders

WHERE order_delivered_customer_date IS NOT NULL

GROUP BY

CASE
    WHEN DATEDIFF(DAY, order_purchase_timestamp, order_delivered_customer_date) <= 5
        THEN '0-5 Days'

    WHEN DATEDIFF(DAY, order_purchase_timestamp, order_delivered_customer_date) <= 10
        THEN '6-10 Days'

    WHEN DATEDIFF(DAY, order_purchase_timestamp, order_delivered_customer_date) <= 15
        THEN '11-15 Days'

    ELSE '15+ Days'
END

ORDER BY Orders DESC;


---------------------------------------------------------
-- 10. Review Score Distribution
---------------------------------------------------------
SELECT
    review_score,
    COUNT(*) AS Total_Reviews
FROM order_reviews
GROUP BY review_score
ORDER BY review_score;


---------------------------------------------------------
-- 11. Customer Purchase Frequency
---------------------------------------------------------
SELECT
    customer_unique_id,
    COUNT(o.order_id) AS Total_Orders
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY customer_unique_id
ORDER BY Total_Orders DESC;


---------------------------------------------------------
-- 12. Repeat vs One-Time Customers
---------------------------------------------------------
SELECT
    CASE
        WHEN Total_Orders = 1 THEN 'One-Time'
        ELSE 'Repeat'
    END AS Customer_Type,

    COUNT(*) AS Customers

FROM
(
    SELECT
        c.customer_unique_id,
        COUNT(o.order_id) AS Total_Orders
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    GROUP BY c.customer_unique_id
) t

GROUP BY
CASE
    WHEN Total_Orders = 1 THEN 'One-Time'
    ELSE 'Repeat'
END;


---------------------------------------------------------
-- 13. Customer Lifetime Value
---------------------------------------------------------
SELECT TOP 10
    c.customer_unique_id,
    ROUND(SUM(op.payment_value),2) AS Customer_Lifetime_Value
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_payments op
    ON o.order_id = op.order_id
GROUP BY c.customer_unique_id
ORDER BY Customer_Lifetime_Value DESC;


---------------------------------------------------------
-- 14. Revenue by State
---------------------------------------------------------
SELECT
    c.customer_state,
    ROUND(SUM(op.payment_value),2) AS Revenue
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_payments op
    ON o.order_id = op.order_id
GROUP BY c.customer_state
ORDER BY Revenue DESC;


---------------------------------------------------------
-- 15. Revenue by City
---------------------------------------------------------
SELECT TOP 10
    c.customer_city,
    ROUND(SUM(op.payment_value),2) AS Revenue
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_payments op
    ON o.order_id = op.order_id
GROUP BY c.customer_city
ORDER BY Revenue DESC;


---------------------------------------------------------
-- 16. Payment Method Analysis
---------------------------------------------------------
SELECT
    payment_type,
    COUNT(*) AS Transactions,
    ROUND(SUM(payment_value),2) AS Revenue
FROM order_payments
GROUP BY payment_type
ORDER BY Revenue DESC;