USE CHALLENGE_DB;

SELECT * FROM conversions;

select MAX(length(conv_id)), MAX(length(user_id)) from conversions;

SELECT MID(conv_id, 9, 20) AS conv_id, MID(user_id,9,20) AS user_id,
conv_date, market, revenue  FROM CONVERSIONS ;

/*
 Each conv_id and user_id is prefixed with their column name.
>> The "MID" function is used to subtract column_name from the data.
[The 9th digit will not be subtracted from the conv_id; only the first 8 digits will be subtracted.]
*/ 

 
 
 
 -- similarly for api_adwords_costs
 
 SELECT * FROM api_adwords_costs;
 
 select MAX(length(campaign_id)) from api_adwords_costs;
 
 SELECT event_date, MID(campaign_id, 13, 20) AS campaign_id, 
 cost, clicks FROM api_adwords_costs;
 
 
 
 
 
 
 -- for attribution_customer_journey
 SELECT * FROM attribution_customer_journey;
 
 SELECT MAX(length(conv_id)) AS max_length_conv_id, MAX(length(session_id)) as max_length_session_id
 FROM attribution_customer_journey;
 
 SELECT MID(conv_id, 9, 20 ) as conv_id, MID(session_id, 12, 20) AS session_id, ihc 
 FROM attribution_customer_journey;
 
 
 
 
 -- for conconversions_backend
 
 SELECT * FROM conversions_backend;
 
SELECT MAX(length(conv_id)) AS max_len_conv_id, MAX(length(user_id)) AS max_len_user_id
 FROM conversions_backend;
 
 SELECT MID(conv_id, 9, 20) AS conv_id , MID(user_id, 9, 20) AS user_id , 
 conv_date, market, revenue FROM conversions_backend;
 
 
 
-- for session_sources
 
 SELECT * FROM session_sources;
 
 SELECT MAX(length(session_id)) AS max_len_session_id, MAX(length(user_id)) AS max_len_user_id,
MAX(length(campaign_name)) AS max_len_campaign_name
 FROM session_sources;
 
 SELECT MID(session_id, 12 ,20) AS session_id, MID(user_id, 9, 20) AS user_id, 
 event_date, event_time, channel_name, MID(campaign_name, 15, 20), campaign_id, market, cpc
 FROM session_sources;   
 
 
 
 
 