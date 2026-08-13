
SELECT
    release_info_available,
    COUNT(DISTINCT movie_id) AS movie_count,
    COUNT(*) AS rating_count
FROM {{ ref('mart_movie_releases') }}
GROUP BY release_info_available
 
