SELECT 
        customer_id,
        SUM(sum(price*count)) OVER (PARTITION BY customer_id) AS cumulative_order_value
    FROM 
       pharma_orders
group by customer_id
