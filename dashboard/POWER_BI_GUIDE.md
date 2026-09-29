# Power BI Dashboard

This folder documents the Power BI layer for SalesScope.

The actual `.pbix` file should be created in Power BI Desktop after loading the PostgreSQL data. A binary dashboard has intentionally not been committed without building and validating it in Power BI.

## 1. Prepare the reporting view

After running the database schema and seed data, execute:

```bash
psql -d salesscope -f dashboard/powerbi_view.sql
```

Connect Power BI Desktop to PostgreSQL and load `vw_sales_dashboard`.

## 2. Recommended measures

Create these measures in Power BI:

```DAX
Net Revenue =
CALCULATE(
    SUM(vw_sales_dashboard[net_sales]),
    vw_sales_dashboard[status] = "Completed"
)

Completed Orders =
CALCULATE(
    DISTINCTCOUNT(vw_sales_dashboard[order_id]),
    vw_sales_dashboard[status] = "Completed"
)

Units Sold =
CALCULATE(
    SUM(vw_sales_dashboard[quantity]),
    vw_sales_dashboard[status] = "Completed"
)

Average Order Value =
DIVIDE([Net Revenue], [Completed Orders])

Estimated Gross Profit =
CALCULATE(
    SUM(vw_sales_dashboard[estimated_gross_profit]),
    vw_sales_dashboard[status] = "Completed"
)
```

## 3. Dashboard layout

Build one overview page:

```text
+----------------------------------------------------------+
|                    SALES OVERVIEW                        |
+-------------+-------------+-------------+----------------+
| Net Revenue | Orders      | Units Sold  | Avg Order Value|
+-------------+-------------+-------------+----------------+
|                                                          |
|          Monthly Revenue Trend (line chart)               |
|                                                          |
+----------------------------+-----------------------------+
| Revenue by Product         | Revenue by Region           |
| (bar chart)                | (bar chart)                 |
+----------------------------+-----------------------------+
| Top Customers              | Salesperson Performance     |
| (bar/table)                | (bar chart)                 |
+----------------------------+-----------------------------+
| Filters: Month | Segment | Region | Category              |
+----------------------------------------------------------+
```

## 4. Visual mappings

**KPI cards**
- Net Revenue
- Completed Orders
- Units Sold
- Average Order Value

**Monthly Revenue Trend**
- Axis: `sales_month`
- Value: `Net Revenue`
- Visual: line chart

**Revenue by Product**
- Axis: `product_name`
- Value: `Net Revenue`
- Visual: horizontal bar chart

**Revenue by Region**
- Axis: `region`
- Value: `Net Revenue`
- Visual: bar chart

**Top Customers**
- Axis/Rows: `customer_name`
- Value: `Net Revenue`

**Salesperson Performance**
- Axis: `salesperson_name`
- Value: `Net Revenue`

**Slicers**
- `sales_month`
- `customer_segment`
- `region`
- `category`

## 5. Portfolio evidence

After building the report in Power BI Desktop:

1. Save it as `dashboard/SalesScope.pbix`.
2. Export or screenshot the overview page as `dashboard/sales_overview.png`.
3. Commit both files if appropriate.
4. Add the screenshot to the main README.

This keeps the repository honest: the README only claims a Power BI dashboard once the report has actually been created and tested.
