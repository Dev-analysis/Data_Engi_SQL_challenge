/* 
Question 4: Are attribution results consistent? Do you find any conversions
		    where the 'ihc' values don't make sense? 
 */
 
 SELECT *FROM attribution_customer_journey;         -- 22499 result
 SELECT DISTINCT(conv_id) FROM attribution_customer_journey;    -- 7000 result
 SELECT DISTINCT(session_id) FROM attribution_customer_journey;    -- 21631 result
 
 -- * ihc sum equal to be 1 (100%)
 SELECT conv_id, SUM(ihc) AS sum_ihc FROM attribution_customer_journey
 GROUP BY conv_id
 HAVING sum_ihc = 1                           -- Exact 5169 conv_id's ihc sum is 1
 ORDER BY sum_ihc DESC; 
 
 
SELECT conv_id, ROUND(SUM(ihc)) AS sum_ihc FROM attribution_customer_journey
GROUP BY conv_id
HAVING sum_ihc = 1                    -- in round, 6964 conv_id's ihc sum is 1, ELSE 38 has 0 
ORDER BY sum_ihc DESC; 
 
 -- DUPLICATE
 
SELECT conv_id, COUNT(conv_id), session_id, COUNT(session_id)
FROM attribution_customer_journey
GROUP BY conv_id, session_id
HAVING (COUNT(conv_id)) AND (count(session_id))
ORDER BY COUNT(conv_id), COUNT(session_id) DESC;

-- there is not any duplicate combination of 'conv_id' and 'session_id' , each combination is unique




















 
 -- BONUS: what is the range of session required for conversion of a user
 
SELECT conv_id, COUNT(conv_id) AS count_conv_id FROM attribution_customer_journey
GROUP BY conv_id
HAVING count_conv_id >= 1
ORDER BY count_conv_id DESC;

-- The count of maximum number session is 91 and minimum is 1

SELECT conv_id, COUNT(session_id) FROM attribution_customer_journey
GROUP BY conv_id
HAVING COUNT(session_id) >= 1
ORDER BY COUNT(session_id) DESC;

