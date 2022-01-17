/* 
Question 5: 
Do we have an issue with channeling? 
Are the number of sessions per channel stable over time?
 */
 
SELECT COUNT(session_id), COUNT(channel_name) FROM session_sources;

SELECT channel_name, COUNT(channel_name) FROM session_sources
GROUP BY channel_name;
 
SELECT COUNT(session_id), COUNT(channel_name) FROM session_sources;
 
 
 