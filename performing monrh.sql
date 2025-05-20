SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS monthly_revenue,
    RANK() OVER (ORDER BY SUM(amount) DESC) AS revenue_rank
FROM 
    online_sales
GROUP BY 
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date)
ORDER BY 
    monthly_revenue DESC
FETCH FIRST 3 ROWS ONLY;
