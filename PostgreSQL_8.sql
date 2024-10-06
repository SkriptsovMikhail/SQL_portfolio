WITH gorzdrav_orders AS (
    SELECT 
        o.customer_id,
        CONCAT (c.last_name , ' ' , c.first_name , ' ' , c.second_name) AS full_name,
        COUNT(o.order_id) AS order_count
    FROM 
        pharma_orders as o
    JOIN 
        customers as c ON o.customer_id = c.customer_id
    WHERE 
        o.pharmacy_name = 'Горздрав'
    GROUP BY 
        o.customer_id, full_name
    ORDER BY 
        order_count DESC
    LIMIT 10
),
zdravsiti_orders AS (
    SELECT 
        o.customer_id,
        CONCAT (c.last_name , ' ' , c.first_name , ' ' , c.second_name) AS full_name,
        COUNT(o.order_id) AS order_count
    FROM 
        pharma_orders as o
    JOIN 
        customers as c ON o.customer_id = c.customer_id
    WHERE 
        o.pharmacy_name = 'Здравсити'
    GROUP BY 
        o.customer_id, full_name
    ORDER BY 
        order_count DESC
    LIMIT 10
)
SELECT 
    customer_id,
    full_name,
    order_count,
    'Горздрав' AS pharmacy_name
FROM 
    gorzdrav_orders

UNION ALL

SELECT 
    customer_id,
    full_name,
    order_count,
    'Здравсити' AS pharmacy_name
FROM 
    zdravsiti_orders;