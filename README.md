# SalesScope

A **PostgreSQL sales analytics project** for exploring revenue trends, customer behaviour, product performance, regional sales and salesperson performance.

SalesScope is designed as a learning-focused portfolio project: a small relational sales database is created from scratch, populated with synthetic data, and analysed with progressively more advanced SQL.

## Business scenario

A fictional software company has sales records spread across customers, products, orders, order items and sales representatives. The goal is to turn those transactional records into useful answers for a sales team.

Questions explored include:

- How is revenue changing month to month?
- Which products generate the most revenue?
- Which customers purchase repeatedly?
- Which customer segments and countries contribute revenue?
- How do sales regions and representatives compare?
- What is the estimated gross profit by product?
- What is the month-over-month sales growth rate?

## Database model

```text
customers ──< orders >── salespeople
                |
                v
           order_items
                |
                v
             products
```

The schema intentionally separates entities instead of storing everything in one spreadsheet-style table. This makes the project useful for practising relational modelling and joins.

## Repository structure

```text
Sales-scope/
├── database/
│   ├── schema.sql
│   └── seed_data.sql
├── analysis/
│   ├── 01_sales_overview.sql
│   ├── 02_product_analysis.sql
│   ├── 03_customer_analysis.sql
│   ├── 04_regional_analysis.sql
│   ├── 05_salesperson_performance.sql
│   └── 06_advanced_analysis.sql
└── README.md
```

## SQL concepts demonstrated

- SELECT, WHERE and ORDER BY
- GROUP BY and HAVING
- aggregate functions
- INNER JOINs
- date aggregation
- Common Table Expressions (CTEs)
- window functions
- LAG for period comparisons
- DENSE_RANK for rankings
- NULLIF for safe calculations
- primary and foreign keys
- CHECK constraints
- indexes

## Run locally

Create a PostgreSQL database:

```sql
CREATE DATABASE salesscope;
```

Then run:

```bash
psql -d salesscope -f database/schema.sql
psql -d salesscope -f database/seed_data.sql
```

You can then execute any file in `analysis/`.

For example:

```bash
psql -d salesscope -f analysis/01_sales_overview.sql
```

## Data

All records in `seed_data.sql` are **synthetic and created for learning purposes**. They do not represent a real company or actual sales performance.

## What I learned

This project practices the full path from business question to SQL analysis:

```text
Business question
      ↓
Relational tables
      ↓
SQL query
      ↓
Metric or trend
      ↓
Business interpretation
```

## Future improvements

- add a Power BI dashboard
- expand the dataset with more dates and products
- add customer cohort and retention analysis
- add reusable database views for reporting
- compare query performance before and after indexing
