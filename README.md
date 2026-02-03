# 📊 Superstore SQL Analytics Portfolio Project

## Overview
This project demonstrates end-to-end SQL analytics using a **public retail dataset**.  
The goal is to transform raw transactional data into **business-ready insights** by designing
a semantic layer, defining KPIs, and performing advanced analytical techniques such as
cohort analysis, ranking, and anomaly detection.

The database is structured to support **BI tools and executive reporting**, following
real-world analytics engineering practices.

---

## Business Questions Answered
- How do sales, profit, and customer activity trend over time?
- Which products perform best by segment, category, and region?
- How well do customers retain after their first purchase?
- Are there unusual spikes or dips in monthly sales by market?

---

## Data Model & Design
Instead of querying raw tables directly, this project creates a **BI-ready semantic layer**
using SQL views:

- `v_export_for_bi` – Consolidated analytical base view
- `v_monthly_kpis` – Monthly performance metrics
- `v_topn_per_segment` – Top-performing products by segment
- `v_cohort_retention` – Customer retention analysis
- `v_anomaly_flags` – Monthly sales anomaly detection

This mirrors a real-world flow:
> Raw tables → Semantic View → KPIs → Insights

---

## Key Features
- BI-ready consolidated dataset
- Monthly KPI engineering
- Top-N product ranking using window functions
- Customer cohort retention analysis
- Sales anomaly detection logic

---

## SQL Skills Demonstrated
- Common Table Expressions (CTEs)
- Window functions (`RANK() OVER`)
- Aggregations & KPI calculations
- NULL-safe computations
- Date normalization and time-series analysis
- Business logic embedded in SQL views

---

## Tools Used
- MySQL
- MySQL Workbench

---

## Data Source
This project uses a **publicly available retail dataset**.

To ensure responsible data sharing:
- Raw data files are **not included**
- Only SQL views, logic, and screenshots are published

---

## Repository Structure
Superstore-SQL-Analytics-Project/
├── README.md
├── sql/
│ ├── v_export_for_bi.sql
│ ├── v_monthly_kpis.sql
│ ├── v_topn_per_segment.sql
│ ├── v_cohort_retention.sql
│ └── v_anomaly_flags.sql
└── screenshots/
├── export_for_bi_view.png
├── monthly_kpis_results.png
├── top_products_ranking.png
├── cohort_retention_table.png
└── anomaly_flags_output.png


---

## Notes
This project is designed as a **SQL Data Analyst portfolio project**, focusing on
business-driven analytics.
