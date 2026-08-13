L
-- Monthly ratings volume and average rating trend, for a time-series line chart
 
SELECT
    DATE_TRUNC('month', TO_TIMESTAMP(rating_timestamp)) AS rating_month,
    COUNT(*) AS total_ratings,
    ROUND(AVG(rating), 2) AS average_rating
FROM {{ ref('fct_ratings') }}
GROUP BY 1
ORDER BY 1
 