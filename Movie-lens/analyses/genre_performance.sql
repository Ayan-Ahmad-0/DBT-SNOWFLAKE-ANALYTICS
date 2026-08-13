-- Rating volume and average rating by genre, for a bar chart / treemap visual
-- Splits genre_array (one movie can have multiple genres) via LATERAL FLATTEN

WITH exploded_genres AS (
    SELECT
        r.movie_id,
        r.rating,
        g.value::STRING AS genre
    FROM {{ ref('fct_ratings') }} r
    JOIN {{ ref('dim_movies') }} m ON m.movie_id = r.movie_id
    , LATERAL FLATTEN(input => m.genre_array) g
)

SELECT
    genre,
    COUNT(*) AS total_ratings,
    ROUND(AVG(rating), 2) AS average_rating
FROM exploded_genres
GROUP BY genre
ORDER BY total_ratings DESC