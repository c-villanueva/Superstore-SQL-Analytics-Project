CREATE VIEW v_anomaly_flags AS
WITH monthly_sales AS (
    SELECT
        market,
        order_month,
        SUM(sales) AS sales
    FROM v_export_for_bi
    GROUP BY market, order_month
),
market_avg AS (
    SELECT
        market,
        AVG(sales) AS avg_sales
    FROM monthly_sales
    GROUP BY market
)
SELECT
    m.market,
    m.order_month,
    m.sales,
    a.avg_sales,
    CASE
        WHEN m.sales > a.avg_sales * 1.5 THEN 'Spike'
        WHEN m.sales < a.avg_sales * 0.5 THEN 'Dip'
        ELSE 'Normal'
    END AS anomaly_flag
FROM monthly_sales m
JOIN market_avg a ON m.market = a.market
ORDER BY m.market, m.order_month;
