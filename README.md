# Customer Shopping Behavior Analysis

An end-to-end data analytics project that takes raw retail customer data from ingestion through cleaning, SQL-based analysis, and an interactive Power BI dashboard to uncover insights on customer purchasing patterns.

## Overview

This project analyzes customer shopping behavior to understand purchasing trends across demographics, product categories, and time. It follows a complete analytics workflow: data cleaning and exploration in Python, further transformation and trend analysis using SQL Server, and visualization through an interactive Power BI dashboard — mirroring the process used in real-world business analytics roles.

**Key questions explored:**
- How does purchase amount vary by age group, category, and gender?
- Which factors (discounts, promo codes, subscriptions) influence purchase frequency?
- How does revenue trend month-over-month, and by city?
- Are orders increasing or decreasing period-over-period?

## Dataset

- **File:** `customer_shopping_behavior.csv`
- **Size:** ~3,900 customer records
- **Fields include:** Customer ID, Age, Gender, Item Purchased, Category, Purchase Amount (USD), Location, Size, Color, Season, Review Rating, Subscription Status, Shipping Type, Discount Applied, Promo Code Used, Previous Purchases, Payment Method, Frequency of Purchases

## Tools & Workflow

### 1. Data Loading & Exploration (Python / Jupyter Notebook)
- Loaded the raw dataset using `pandas`
- Performed exploratory data analysis (EDA) with `.info()`, `.describe()`, and null-value checks
- Reviewed data distributions and identified data quality issues

### 2. Data Cleaning (Python)
- Filled missing `Review Rating` values using the median rating per product category
- Standardized column names (lowercase, underscores, renamed ambiguous fields)
- Engineered new features:
  - `age_group` — binned customers into Young Adult, Adult, Middle-aged, and Senior segments
  - `purchase_frequency_days` — converted categorical purchase frequency (e.g., Weekly, Monthly) into numeric day intervals
- Identified and removed the redundant `promo_code_used` column after confirming it duplicated `discount_applied`

### 3. Database Integration (Python → SQL Server)
- Connected to Microsoft SQL Server using `SQLAlchemy` and `pyodbc`
- Loaded the cleaned dataset into a SQL Server table for downstream querying

### 4. SQL Analysis (MS SQL Server)
Using window functions to extract business insights, including:
- **Month-over-month revenue trend** by city using `LAG()`
- **Month-over-month order growth** using `LAG()` to compare current vs. previous period
- **Order trend direction** (Increased / Decreased / No Change) using `LEAD()` to compare current vs. next period

### 5. Dashboard (Power BI)
- Built an interactive dashboard (`customer_behavior_dashboard.pbix`) connected to the cleaned data
- Visualizes key metrics: revenue trends, customer segments, category performance, and purchase behavior patterns
- Enables filtering by demographics, location, and time period for deeper drill-down

## Result

The analysis surfaces actionable insights into customer behavior, including which age groups and categories drive the most revenue, how discounts and promotions affect purchase patterns, and how order volume trends over time. These findings can support decisions around targeted marketing, inventory planning, and customer retention strategies.

## Project Files

| File | Description |
|------|--------------|
| `customer_shopping_behavior.csv` | Raw dataset |
| `Customer_shopping_behaviour_analysis.ipynb` | Python notebook for EDA, cleaning, and SQL Server integration |
| `customer_behavior.sql` | SQL queries for trend and growth analysis |
| `customer_behavior_dashboard.pbix` | Power BI dashboard file |

## Tech Stack

- **Python:** pandas, SQLAlchemy, pyodbc
- **Database:** Microsoft SQL Server
- **Visualization:** Power BI
- **Environment:** Jupyter Notebook
