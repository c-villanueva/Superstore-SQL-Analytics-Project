# 📊 Superstore SQL Analytics Portfolio Project

## Overview
This project showcases **end-to-end SQL analytics** using a public retail dataset.  
It focuses on transforming raw transactional data into **business-ready insights**
through a well-designed semantic layer, KPI engineering, and advanced analytical queries.

The project is structured to mirror **real-world BI and analytics workflows**, where
SQL is used not only for querying but for **data modeling, metric definition, and insight generation**.

---

## Business Questions Addressed
- How do sales, profit, and customer activity trend over time?
- Which products perform best by segment, category, and region?
- How well do customers retain after their first purchase?
- Are there unusual spikes or dips in monthly sales by market?

---

## Data Model & Design Approach
Rather than querying raw tables directly, this project builds a **BI-ready semantic layer**
using SQL views.

Design flow:
Raw Tables → Consolidated Analytical View → KPIs → Insights


Key design principles:
- Centralized business logic in views
- Reusable metrics for BI tools
- Clean, analyst-friendly data structures

---

## Core SQL Views

### `v_export_for_bi`
A consolidated analytical base view that:
- Joins orders, customers, products, geography, and returns
- Standardizes date fields for time-series analysis
- Computes derived fields such as profit margin and return flags

This view serves as the **single source of truth** for downstream analysis.

---

### `v_monthly_kpis`
Calculates monthly performance metrics including:
- Orders and customers
- Sales, profit, and units
- Average order value
- Profit margin
- Return rate

Built with NULL-safe logic to ensure reliable metrics.

---

### `v_topn_per_segment`
Identifies **top-performing products** by:
- Segment
- Category
- Region

Uses window functions (`RANK() OVER`) to rank products based on total sales.

---

### `v_cohort_retention`
Implements **customer cohort analysis** by:
- Assigning customers to cohorts based on first purchase month
- Tracking activity by month since cohort start
- Calculating retention percentages over time

This supports behavioral analysis and long-term customer value assessment.

---

### `v_anomaly_flags`
Detects potential **sales anomalies** by market:
- Flags unusually high sales as **Spikes**
- Flags unusually low sales as **Dips**
- Labels all other periods as **Normal**

Useful for monitoring, data quality checks, and early issue detection.

---

## SQL Skills Demonstrated
- Common Table Expressions (CTEs)
- Window functions (`RANK() OVER`)
- Time-series aggregation
- Cohort and retention analysis
- Business KPI engineering
- NULL-safe calculations
- Analytical data modeling using views

---

## Tools Used
- MySQL
- MySQL Workbench

---

## Data Source
This project uses a **publicly available retail dataset**.

To ensure responsible data sharing:
- Raw data files are not included
- Only SQL logic and analytical views are published

---

## Repository Structure
```
superstore-sql-analytics/
├── README.md
├── sql/
│ ├── v_export_for_bi.sql
│ ├── v_monthly_kpis.sql
│ ├── v_topn_per_segment.sql
│ ├── v_cohort_retention.sql
│ └── v_anomaly_flags.sql
```
---
