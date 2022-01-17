-- Question_3

-- Double check conversions ('conversions' table) with backend ('conversions_backend' table), any issues?

SELECT * FROM conversions;             -- 16954 results
SELECT DISTINCT(conv_id) FROM conversions;     -- 16938 results  
-- diffrence of 16 is found

-- DUPLICATE

SELECT conv_id, COUNT(conv_id) FROM conversions
GROUP BY conv_id
HAVING COUNT(conv_id)> 1;

-- there are 16 duplicate values in conversions table

SELECT * FROM conversions_backend;  -- 17283 reults
SELECT DISTINCT(conv_id) FROM conversions_backend;  -- 17283 reults


-- 1. conversion table is not up to date

SELECT * FROM conversions AS c
CROSS JOIN
conversions_backend AS cb
ON c.conv_id = cb.conv_id;             -- 16954 data is same in both table

SELECT * FROM conversions AS c
RIGHT JOIN 
conversions_backend AS cb
ON c.conv_id = cb.conv_id
WHERE c.conv_id is null;              -- There are 345 entries which is not in 'conversions' table


/* 
Two issues are found in the conversions table.
1. The conversions tables contain 16 duplicate entries.
2. The conversions table is not up to date, with 345 entries missing.
*/

