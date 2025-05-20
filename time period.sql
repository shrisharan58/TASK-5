SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS monthly_revenue,
    COUNT(DISTINCT order_id) AS order_volume,
    ROUND(SUM(amount) / COUNT(DISTINCT order_id), 2) AS avg_order_value
FROM 
    online_sales
WHERE 
    order_date BETWEEN TO_DATE('2023-01-01', 'YYYY-MM-DD') 
    AND TO_DATE('2023-03-31', 'YYYY-MM-DD')
GROUP BY 
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date)
ORDER BY 
    year ASC,
    month ASC;
