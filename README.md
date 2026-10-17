# Financial Performance & Ratio Analysis Dashboard

## Objective
Analyze financial performance across multiple companies and years using SQL, Python/Pandas and Power BI.

## Dataset
- 15 companies
- 7 years (2019–2025)
- 105 company-year records

## Workflow
Raw financial data → SQL analysis → Python/Pandas cleaning & calculations → Power BI dashboard

## Technologies
- SQL
- Python
- Pandas
- Power BI

## Financial KPIs
- Revenue
- Gross Profit
- Net Income
- Revenue Growth
- Profit Margin
- ROA
- ROE
- Current Ratio
- Debt-to-Equity

## SQL Analysis
The SQL script includes:
- Aggregation with GROUP BY
- Filtering and calculations
- Ranking with RANK()
- Year-over-year analysis using LAG()

## Python/Pandas
The Python script:
- Checks missing values and duplicates
- Cleans data types
- Calculates financial ratios
- Calculates company-level revenue growth
- Exports `financial_metrics.csv` for Power BI

## Power BI Dashboard
Import `data/financial_metrics.csv` and create:
- Revenue KPI card
- Net Income KPI card
- Profit Margin KPI card
- ROE KPI card
- Revenue trend by year
- Profit Margin by company
- ROA / ROE comparison
- Current Ratio comparison
- Debt-to-Equity comparison
- Company and Year slicers


## Project Workflow

financial_data.csv
       |
       |----------------------|
       |                      |
       v                      v
  SQL Analysis          Python / Pandas
                              |
                              v
                   financial_metrics.csv
                              |
                              v
                         Power BI

SQL and Python independently analyze the original dataset. Python generates the processed CSV used by Power BI.



## To run:

1. Install Dependencies:     python -m pip install pandas

2. Run the Python Analysis:  python .\python\analysis.py

3. Run SQL commands by loading the data to DB and then execute it using  SQLite: Run Query.

