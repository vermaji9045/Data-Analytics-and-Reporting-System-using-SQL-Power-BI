CREATE VIEW SalesSummary AS
SELECT 
    FORMAT(order_date, 'yyyy-MM') AS MonthYear,
    region,
    product_category,
    SUM(sales_amount) AS TotalSales,
    SUM(quantity_sold) AS TotalQuantity,
    COUNT(DISTINCT customer_id) AS UniqueCustomers,
    MAX(sales_amount) AS MaxSales,
    MIN(sales_amount) AS MinSales
FROM sales_data
GROUP BY FORMAT(order_date, 'yyyy-MM'), region, product_category;
