CREATE PROCEDURE GetMonthlySalesData
    @StartDate DATE,
    @EndDate DATE
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        FORMAT(order_date, 'yyyy-MM') AS MonthYear,
        region,
        product_category,
        SUM(sales_amount) AS TotalSales,
        SUM(quantity_sold) AS TotalQuantity,
        COUNT(DISTINCT customer_id) AS UniqueCustomers,
        AVG(sales_amount) AS AvgSalesPerOrder
    FROM sales_data
    WHERE order_date BETWEEN @StartDate AND @EndDate
    GROUP BY FORMAT(order_date, 'yyyy-MM'), region, product_category
    ORDER BY MonthYear DESC;
END;
