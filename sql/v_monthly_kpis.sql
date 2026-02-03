CREATE VIEW v_monthly_kpis AS
SELECT
    order_month,
    COUNT(DISTINCT order_id) AS orders,
    COUNT(DISTINCT customer_id) AS customers,
    SUM(sales) AS sales,
    SUM(profit) AS profit,
    SUM(quantity) AS units,
    AVG(discount) AS avg_discount_rate,
    AVG(shipping_cost) AS avg_shipping_cost,
    SUM(sales) / NULLIF(COUNT(DISTINCT order_id), 0) AS avg_order_value,
    SUM(profit) / NULLIF(SUM(sales), 0) AS profit_margin,
    SUM(CASE WHEN is_returned = 1 THEN 1 ELSE 0 END)
        / NULLIF(COUNT(DISTINCT order_id), 0) AS return_rate
FROM v_export_for_bi
GROUP BY order_month
ORDER BY order_month;
