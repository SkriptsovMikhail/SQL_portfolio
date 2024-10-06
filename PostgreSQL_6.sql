WITH customer_orders AS (
    SELECT 
        c.customer_id,
        SUM(o.price * o.count) AS total_order_value
    FROM 
        pharma_orders o
    JOIN 
        customers c ON o.customer_id = c.customer_id
    GROUP BY 
        c.customer_id
),
ranked_customers AS (
    SELECT 
        customer_id,
        total_order_value,
        ROW_NUMBER() OVER (ORDER BY total_order_value DESC) AS rnk
    FROM 
        customer_orders
)
SELECT 
    customer_id,
    total_order_value
FROM 
    ranked_customers
WHERE 
    rnk <= 10
ORDER BY 
    total_order_value DESC;