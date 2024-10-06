SELECT 
    pharmacy_name,
    SUM(SUM(price * count)) OVER (PARTITION BY pharmacy_name) AS cumulative_sales
FROM 
    pharma_orders
GROUP BY 
    pharmacy_name
ORDER BY 
    cumulative_sales DESC;