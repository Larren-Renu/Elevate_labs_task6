# Elevate_labs_task6

TASK 6: Sales Trend Analysis Using Aggregations

Objective: Analyze monthly revenue and order volume.

Tools: PostgreSQL / MySQL / SQLite

Deliverables: SQL script + results table

Hints/Mini Guide:
a.Use EXTRACT(MONTH FROM order_date) for month.
b.GROUP BY year/month.
c.Use SUM() for revenue.
d.COUNT(DISTINCT order_id) for volume.
e.Use ORDER BY for sorting.
f.Limit results for specific time periods.

Dataset: online_sales (orders table with order_date, amount, product_id)
