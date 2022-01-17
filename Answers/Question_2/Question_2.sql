-- QUESTION 2

-- Are the conversions in the 'conversions' table stable over time? Any pattern? 

SELECT * FROM conversions;                        -- 16954 result
SELECT DISTINCT(conv_id) FROM conversions;        -- 16938 result 
SELECT DISTINCT(user_id) FROM conversions;        -- 16373 result

-- The difference between conv_id and user_id show that some users has more attended more than one covnersion.
/*
 possible patterns; 
on which day or date the conversions max or min took place.
*/

SELECT DISTINCT(conv_date) FROM conversions
ORDER BY conv_date;  -- FROM 15 - 31 , 17 DAY DATA

SELECT  COUNT(DISTINCT(conv_id)) AS count_conv_id, conv_date, DAYNAME(conv_date) AS DAY_NAME FROM conversions
GROUP BY conv_date
ORDER BY conv_date DESC;

-- There is significance increase in last two day of the month 


