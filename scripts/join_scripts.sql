-- ** Movie Database project. See the file movies_erd for table\column info. **

-- 1. Give the name, release year, and worldwide gross of the lowest grossing movie.
-- SELECT film_title, release_year, worldwide_gross
-- FROM specs
-- INNER JOIN revenue
-- USING(movie_id)
-- ORDER BY worldwide_gross

-- Semi-Tough was the lowest grossing movie.
	
-- 2. What year has the highest average imdb rating?
-- SELECT release_year, avg(imdb_rating) as avg_rating
-- FROM specs
-- INNER JOIN rating
-- USING(movie_id)
-- GROUP BY release_year
-- ORDER BY avg_rating DESC

-- 1991

-- 3. What is the highest grossing G-rated movie? Which company distributed it?
-- SELECT film_title, company_name, worldwide_gross
-- FROM specs
-- INNER JOIN revenue
-- USING(movie_id)
-- INNER JOIN distributors
-- ON specs.domestic_distributor_id = distributors.distributor_id
-- WHERE mpaa_rating = 'G'
-- ORDER BY worldwide_gross DESC

-- Toy Story 4

-- 4. Write a query that returns, for each distributor in the distributors table, the distributor name and the number of movies associated with that distributor in the movies 
-- table. Your result set should include all of the distributors, whether or not they have any movies in the movies table.

-- SELECT company_name, count(film_title)
-- FROM specs
-- RIGHT JOIN distributors
-- ON specs.domestic_distributor_id = distributors.distributor_id
-- GROUP BY company_name

-- 5. Write a query that returns the five distributors with the highest average movie budget.
-- SELECT company_name, avg(film_budget) AS avg_film_budget
-- FROM specs
-- INNER JOIN revenue
-- USING(movie_id)
-- INNER JOIN distributors
-- ON specs.domestic_distributor_id = distributors.distributor_id
-- GROUP BY company_name
-- ORDER BY avg_film_budget DESC
-- LIMIT 5

-- "Walt Disney "
-- "Sony Pictures"
-- "Lionsgate"
-- "DreamWorks"
-- "Warner Bros."

-- 6. How many movies in the dataset are distributed by a company which is not headquartered in California? Which of these movies has the highest imdb rating?
-- SELECT company_name, headquarters, film_title, imdb_rating
-- FROM specs
-- INNER JOIN rating
-- USING(movie_id)
-- INNER JOIN distributors
-- ON specs.domestic_distributor_id = distributors.distributor_id
-- WHERE headquarters NOT LIKE '%CA'

-- 2 results, Dirty Dancing has the highest rating with 7.0

-- 7. Which have a higher average rating, movies which are over two hours long or movies which are under two hours?
-- SELECT avg(imdb_rating) AS avg_rating
-- FROM specs
-- INNER JOIN rating
-- USING(movie_id)
-- 	WHERE length_in_min < 120
-- UNION
-- SELECT avg(imdb_rating) AS avg_rating
-- FROM specs
-- INNER JOIN rating
-- USING(movie_id)
-- 	WHERE length_in_min >= 120

--OR

-- SELECT (length_in_min<120) AS movies_under_2hr, (length_in_min>=120) AS movies_over_2hr, avg(imdb_rating)
-- FROM specs
-- INNER JOIN rating
-- USING(movie_id)
-- group by (length_in_min<120), (length_in_min>=120)

-- Movies with length over 2 hours have higher average ratings.