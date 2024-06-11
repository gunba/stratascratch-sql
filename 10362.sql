SELECT seller_id, total_sales, product_category, market_place, month
FROM sales_data sd1
WHERE month = '2024-01'
AND (SELECT COUNT(*) 
     FROM sales_data sd2 
     WHERE sd2.product_category = sd1.product_category 
     AND sd2.total_sales > sd1.total_sales 
     AND sd2.month = '2024-01') < 3
ORDER BY product_category, total_sales DESC;
