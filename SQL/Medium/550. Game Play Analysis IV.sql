/* Write your T-SQL query statement below */

-- X TOTAL Number Of Players
-- Y Number of Players that logged in for at least two consecutive days starting from their first login date
--get the Date difference in days = DATEDIFF(DAYS, first_login, event_date)
--or add on event date 1 then check (if consecutive)
-- then Y / X and rounded to 2 decimal places 

DECLARE @X FLOAT, @Y INT, @RESULT FLOAT

SELECT @X = COUNT(DISTINCT A.player_id) 
FROM Activity A;

SELECT @Y = COUNT(DISTINCT A.player_id)
FROM Activity A
WHERE EXISTS(
    SELECT 1 FROM Activity B
    WHERE B.player_id = A.player_id
    AND B.event_date = DATEADD(DAY, 1, A.event_date)
);

SET @RESULT = CASE WHEN @X > 0 THEN ROUND(@Y / @X, 2) ELSE 0 END;
SELECT @RESULT AS fraction;






-- Anoter Solution --
-- JOIN(
--     SELECT player_id, MIN(event_date) AS first_login 
--     FROM Activity 
--     GROUP BY player_id
--     ) AS F
-- ON A.player_id = F.player_id
-- WHERE DATEDIFF(DAY, F.first_login, A.event_date) = 1;