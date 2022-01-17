-- VARIFICATION OF DATASET statements

USE challenge_db;

-- 1. Conversions table should have revenue and the respective user_id

SELECT * FROM conversions;
SELECT COUNT(*) FROM conversions;
SELECT COUNT(DISTINCT(conv_id)) AS DISTINCT_RECORDS FROM conversions;

-- 2. session_source table 

SELECT * FROM session_sources;
SELECT COUNT(DISTINCT(session_id)) AS DISTINCT_RECORDS FROM session_sources;

-- result: there are no reapeated session

-- 3. How many user made a conversion from session sources : 16373 / 1153719

SELECT DISTINCT(con.user_id), COUNT(ss.session_id) 
FROM conversions AS con
LEFT JOIN
session_sources AS ss
on con.user_id = ss.user_id  
GROUP BY ss/*con*/.user_id;

-- difference of 15 is found when switching the connecting id 
-- and this query also describe that session attended by each user id



-- 4. customer journey is descibed by the 'attribution_cutomer_journey' table

SELECT * FROM attribution_customer_journey;
SELECT DISTINCT(session_id) FROM attribution_customer_journey;
SELECT DISTINCT(conv_id) FROM attribution_customer_journey;

-- max and min sessions in each customer journey

SELECT conv_id, COUNT(session_id) AS count_of_session_id, SUM(ihc) AS SUM_OF_IHC
FROM attribution_customer_journey
GROUP BY CONV_ID
ORDER BY count_of_session_id DESC;

/* THERE ARE TOTAL 7000 USERS AND NUMBER OF SESSION THEY HAVE ATTENDED AND SUM OF IHC 
WHICH IS SUPPOSE TO BE 1 FOR EACH USER.
the hightest attended number of session in a customer journey is 91 and lowest is 1 */


-- 5. ihc sum for each conv_id should be 1

SELECT SUM(ihc) FROM attribution_customer_journey
GROUP BY session_id;


SELECT conv_id, COUNT(session_id) AS count_of_session_id, ROUND(SUM(ihc)) AS SUM_OF_IHC
FROM attribution_customer_journey
GROUP BY CONV_ID
ORDER BY count_of_session_id, SUM_OF_IHC DESC;

/* 
The sum of IHC has different values, but after using the "round" and "order by"
function shows the min and max of sum_ihc are equal to 1.
*/


-- 6. Is the data in both conversions and conversions_backend the same or different?

select * from conversions;
select * from conversions_backend;

SELECT * FROM conversions_backend AS cb
LEFT JOIN
conversions AS c
ON  cb.conv_id = c.conv_id
WHERE c.conv_id IS NULL;

/*The data in the "conversions" table is not up to date.
So further analysis is going to be done with the use of the conversion_backend table.
Because the author has said that "If the data from the conversions differ from the data from
 the "conversion backend," then "conversion backend" data should therefore be assumed to be true."
 */

-- 7. There is an external sources "api_adwords_costs" 

SELECT * FROM api_adwords_costs;
SELECT DISTINCT(campaign_id) FROM api_adwords_costs;
SELECT DISTINCT(event_date) FROM api_adwords_costs
order by event_date desc;


/* There are 109 campaigns in all where the data ranges from 01-07-2021 to 31-07-2021 (31-days ).*/
 
