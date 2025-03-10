/* Write your T-SQL query statement below */
-- # at least 3 million km (>=)
-- # at least 25 million population(>=) 

SELECT name, population, area
FROM World 
WHERE area >= 3000000 OR population >= 25000000
