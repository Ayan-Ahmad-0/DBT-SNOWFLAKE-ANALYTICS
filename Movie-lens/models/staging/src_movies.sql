WITH raw_moives AS (
    SELECT * FROM MOVIELENS.RAW.RAW_MOIVES
) 
SELECT 
   movieId AS movie_id,
   title,
   genre
FROM raw_moives