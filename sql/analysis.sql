-- 1. View financial performance
SELECT company, year, revenue, net_income
FROM financials
ORDER BY company, year;

-- 2. Total revenue by year
SELECT year, SUM(revenue) AS total_revenue
FROM financials
GROUP BY year
ORDER BY year;

-- 3. Average revenue by company
SELECT company, AVG(revenue) AS average_revenue
FROM financials
GROUP BY company
ORDER BY average_revenue DESC;

-- 4. Gross profit
SELECT
    company,
    year,
    revenue - cost_of_goods_sold AS gross_profit
FROM financials;

-- 5. Profit margin
SELECT
    company,
    year,
    (net_income / NULLIF(revenue, 0)) * 100 AS profit_margin
FROM financials;

--6. Return on Assets (ROA)
SELECT
    company,
    year,
    net_income / total_assets * 100.0 AS roa
FROM financials;

--7. Return on Equity (ROE)
SELECT
    company,
    year,
    net_income / shareholders_equity * 100.0 AS roe
FROM financials;

-- 8. Current ratio
SELECT
    company,
    year,
    current_assets / NULLIF(current_liabilities, 0) AS current_ratio
FROM financials;

-- 9. Debt-to-equity
SELECT
    company,
    year,
    total_debt / NULLIF(shareholders_equity, 0) AS debt_to_equity
FROM financials;

-- 10. Rank companies by revenue in each year
SELECT
    company,
    year,
    revenue,
    RANK() OVER (PARTITION BY year ORDER BY revenue DESC) AS revenue_rank
FROM financials;

-- 11. Year-over-year revenue using LAG
SELECT
    company,
    year,
    revenue,
    LAG(revenue) OVER (PARTITION BY company ORDER BY year) AS previous_year_revenue,
    ((revenue - LAG(revenue) OVER (PARTITION BY company ORDER BY year))
        / NULLIF(LAG(revenue) OVER (PARTITION BY company ORDER BY year), 0)) * 100
        AS revenue_growth_pct
FROM financials;
