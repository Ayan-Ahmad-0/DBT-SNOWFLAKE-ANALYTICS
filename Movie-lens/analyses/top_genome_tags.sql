-- Top genome tags by average relevance score across movies, for a top-N bar chart / tag cloud visual

SELECT
    tag_name,
    COUNT(*) AS movie_count,
    ROUND(AVG(relevance_score), 3) AS avg_relevance
FROM {{ ref('dim_movies_with_tags') }}
WHERE relevance_score IS NOT NULL
GROUP BY tag_name
HAVING COUNT(*) > 50
ORDER BY avg_relevance DESC
LIMIT 25