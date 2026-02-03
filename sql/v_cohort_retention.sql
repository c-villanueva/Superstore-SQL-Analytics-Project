CREATE VIEW v_cohort_retention AS
WITH first_purchase AS (
    SELECT
        customer_id,
        MIN(order_month) AS cohort_month
    FROM v_export_for_bi
    GROUP BY customer_id
),
activity AS (
    SELECT
        e.customer_id,
        f.cohort_month,
        e.order_month,
        TIMESTAMPDIFF(
            MONTH,
            STR_TO_DATE(f.cohort_month, '%Y-%m-%d'),
            STR_TO_DATE(e.order_month, '%Y-%m-%d')
        ) AS m_plus_n
    FROM v_export_for_bi e
    JOIN first_purchase f ON e.customer_id = f.customer_id
),
cohort_sizes AS (
    SELECT
        cohort_month,
        COUNT(DISTINCT customer_id) AS cohort_size
    FROM activity
    GROUP BY cohort_month
),
active_users AS (
    SELECT
        cohort_month,
        m_plus_n,
        COUNT(DISTINCT customer_id) AS active_customers
    FROM activity
    GROUP BY cohort_month, m_plus_n
)
SELECT
    a.cohort_month,
    a.m_plus_n,
    c.cohort_size,
    a.active_customers,
    a.active_customers / NULLIF(c.cohort_size, 0) AS retained_pct
FROM active_users a
JOIN cohort_sizes c ON a.cohort_month = c.cohort_month
ORDER BY a.cohort_month, a.m_plus_n;
