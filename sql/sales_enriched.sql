# sales_enriched
  
CREATE OR REPLACE TABLE `focus-storm-497722-d5.saas_sales.sales_enriched` AS

SELECT
    *,

    EXTRACT(YEAR FROM `Order Date`) AS order_year,

    EXTRACT(QUARTER FROM `Order Date`) AS order_quarter,

    EXTRACT(MONTH FROM `Order Date`) AS order_month,

    FORMAT_DATE('%B', `Order Date`) AS month_name,

    SAFE_DIVIDE(Profit, Sales) AS profit_margin,

    CASE
        WHEN Discount = 0 THEN 'No Discount'
        WHEN Discount <= 0.10 THEN 'Low Discount'
        WHEN Discount <= 0.20 THEN 'Medium Discount'
        ELSE 'High Discount'
    END AS discount_bucket

FROM `focus-storm-497722-d5.saas_sales.raw_sales`;
