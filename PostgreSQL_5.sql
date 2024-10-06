SELECT 
    po.pharmacy_name,
    COUNT(DISTINCT po.customer_id) AS unique_customer_count
FROM 
    pharma_orders as po
JOIN 
    customers as c ON po.customer_id = c.customer_id
GROUP BY 
    po.pharmacy_name
ORDER BY 
    unique_customer_count DESC;