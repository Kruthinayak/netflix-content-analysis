CREATE DATABASE netflix_db;
use netflix_db;
CREATE TABLE netflix (
    show_id VARCHAR(10),
    type VARCHAR(20),
    title TEXT,
    director TEXT,
    cast TEXT,
    country TEXT,
    date_added TEXT,
    release_year INT,
    rating VARCHAR(10),
    duration VARCHAR(20),
    listed_in TEXT,
    description TEXT
);
select * from netflix;
#TOTAL CONTENT
select count(*) as total_titles from netflix;
#MOVIES vs TV SHOWS
SELECT type, COUNT(*) AS count
FROM netflix
GROUP BY type;

#CONTENT BY RATING
SELECT rating, COUNT(*) AS total
FROM netflix
GROUP BY rating
ORDER BY total DESC;

#RELEASE YEAR TREND
SELECT release_year, COUNT(*) AS total
FROM netflix
GROUP BY release_year
ORDER BY release_year;

#TOP COUNTRIES
SELECT country, COUNT(*) AS total
FROM netflix
GROUP BY country
ORDER BY total DESC
LIMIT 10;

-- The 'country' column contains multiple countries in a single row
-- Example: "United States, India"
-- This makes analysis difficult because one row belongs to multiple countries
-- To simplify, we extract only the first (main) country using SUBSTRING_INDEX
SELECT 
    SUBSTRING_INDEX(country, ',', 1) AS main_country,
    COUNT(*) AS total
FROM netflix
WHERE country IS NOT NULL
GROUP BY main_country
ORDER BY total DESC;

-- The 'country' column contains multiple countries in a single row
-- Example: "United States, India"
-- This makes analysis difficult because one row belongs to multiple countries
-- To simplify, we extract only the first (main) country using SUBSTRING_INDEX
SELECT 
    SUBSTRING_INDEX(country, ',', 1) AS main_country,
    COUNT(*) AS total
FROM netflix
WHERE country IS NOT NULL
GROUP BY main_country
ORDER BY total DESC;

-- The 'date_added' column is stored as text (e.g., "September 2021")
-- It is not in proper DATE format, so we cannot directly use date functions
-- We extract the year using RIGHT() for trend analysis
SELECT 
    RIGHT(date_added, 4) AS year_added,
    COUNT(*) AS total
FROM netflix
WHERE date_added IS NOT NULL
GROUP BY year_added
ORDER BY year_added;


