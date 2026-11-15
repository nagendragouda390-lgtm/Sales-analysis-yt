-- Spends and rating per gender

SELECT
    gender,
    COUNT(*) AS customers,
    SUM(amount) AS spends,
    ROUND(AVG(amount),2) AS spend_per_head,
    ROUND(AVG(review_rating),2) AS avr_rating
FROM data
GROUP BY gender
ORDER BY spends DESC;

-- Categorical analysis

SELECT
    category,
    COUNT(*) AS orders,
    SUM(amount) AS revenue,
    ROUND(AVG(amount),2) AS avg_revenue,
    ROUND(AVG(review_rating),2) AS rating,
    ROUND(SUM(amount)*100.0/(
                    SELECT SUM(amount) FROM data
                     ),2) AS perc_sales
FROM data
GROUP BY category
ORDER BY revenue DESC;

-- Payment method analysis

SELECT
    payment_method,
    COUNT(*) AS pays,
    SUM(amount) AS revenue,
    ROUND(AVG(amount),2) AS avg_revenue
FROM data
GROUP BY payment_method
ORDER BY revenue DESC;

-- Frequency of purchase 

SELECT
    frequency_of_purchases,
    COUNT(*) AS no_of_customers,
    SUM(amount) AS revenue
FROM data
GROUP BY frequency_of_purchases
ORDER BY no_of_customers DESC;

-- Affect of discount

SELECT 
    discount_applied,
    COUNT(*) AS orders,
    SUM(amount) AS revenue,
    ROUND(AVG(amount),2) AS avg_revenue,
    ROUND(AVG(review_rating),2) AS avg_rating,
   ROUND(COUNT(*)*100.0/(
                          SELECT COUNT(*) FROM data
                        ),2) AS distribution
FROM data
GROUP BY discount_applied;

-- Subscription analysis

SELECT
     subscription_status,
     COUNT(*) AS no_of_customers,
     SUM(amount) AS revenue,
     ROUND(AVG(amount),2) AS avg_revenue,
     ROUND(AVG(review_rating),2) AS avg_rating
FROM data
GROUP BY subscription_status
ORDER BY revenue;
  
-- color analysis

SELECT
    color,
    COUNT(*) AS orders,
    SUM(amount) AS revenue,
    ROUND(AVG(amount),2) AS avg_revenue,
    ROUND(AVG(review_rating),2) AS avg_rating 
FROM data
GROUP BY color
ORDER BY revenue DESC;








