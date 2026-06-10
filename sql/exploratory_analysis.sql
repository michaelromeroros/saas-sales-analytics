-- Revenue trend over time

SELECT
    order_year,
    order_month,
    ROUND(SUM(Sales),2) AS total_sales
FROM `focus-storm-497722-d5.saas_sales.sales_enriched`
GROUP BY
    order_year,
    order_month
ORDER BY
    order_year,
    order_month;

-- Revenue and profitability by industry

SELECT
    Industry,
    ROUND(SUM(Sales),2) AS total_sales,
    ROUND(SUM(Profit),2) AS total_profit,
    ROUND(SAFE_DIVIDE(SUM(Profit),SUM(Sales))*100,2) AS profit_margin_pct
FROM `focus-storm-497722-d5.saas_sales.sales_enriched`
GROUP BY Industry
ORDER BY total_sales DESC;

-- Product performance

SELECT
    Product,
    ROUND(SUM(Sales),2) AS total_sales,
    ROUND(SUM(Profit),2) AS total_profit
FROM `focus-storm-497722-d5.saas_sales.sales_enriched`
GROUP BY Product
ORDER BY total_sales DESC;

-- Revenue and profit by segment

SELECT
    Segment,
    ROUND(SUM(Sales),2) AS total_sales,
    ROUND(SUM(Profit),2) AS total_profit,
    COUNT(DISTINCT `Customer ID`) AS customers
FROM `focus-storm-497722-d5.saas_sales.sales_enriched`
GROUP BY Segment
ORDER BY total_sales DESC;

-- Discount impact on profitability
SELECT
    discount_bucket,
    ROUND(SUM(Sales),2) AS total_sales,
    ROUND(SUM(Profit),2) AS total_profit,
    ROUND(
        SAFE_DIVIDE(SUM(Profit),SUM(Sales))*100,
        2
    ) AS margin_pct
FROM `focus-storm-497722-d5.saas_sales.sales_enriched`
GROUP BY discount_bucket
ORDER BY total_sales DESC;

-- Product discount impact

SELECT
    Product,
    discount_bucket,
    ROUND(SUM(Sales),2) AS total_sales,
    ROUND(SUM(Profit),2) AS total_profit
FROM `focus-storm-497722-d5.saas_sales.sales_enriched`
GROUP BY
    Product,
    discount_bucket
ORDER BY
    Product,
    total_sales DESC;
