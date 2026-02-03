CREATE VIEW v_topn_per_segment AS
WITH prod_perf AS (
    SELECT
        segment,
        category,
        region,
        product_id,
        product_name,
        SUM(sales) AS total_sales,
        SUM(profit) AS total_profit,
        COUNT(DISTINCT order_id) AS order_count,
        SUM(quantity) AS units
    FROM v_export_for_bi
    GROUP BY segment, category, region, product_id, product_name
),
ranked AS (
    SELECT *,
        RANK() OVER (
            PARTITION BY segment, category, region
            ORDER BY total_sales DESC
        ) AS sales_rank
    FROM prod_perf
)
SELECT *
FROM ranked
WHERE sales_rank <= 5
ORDER BY segment, category, region, sales_rank;
