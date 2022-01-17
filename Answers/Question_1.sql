/*
 Question 1: All the costs in the 'api_adwords_costs' table fully covered in the
 'session_sources' table? Any campaigns where you see issues? 
 */
 
 SELECT SUM(cost) FROM api_adwords_costs;
 
 SELECT * FROM api_adwords_costs AS aac
 left join
 session_sources AS ss
 ON aac.campaign_id = ss.campaign_id
 WHERE ss.campaign_id is not null;

 SELECT sum(aac.cost /aac.clicks) AS aac_cpc  , 
sum(ss.cpc) AS ss_cpc FROM api_adwords_costs AS aac
CROSS JOIN
session_sources AS ss
ON aac.campaign_id = ss.campaign_id;

/* All costs of "api_adwords_costs" are covered in the "session_source" table,
 as well as all campaing_ids are covered in the session source table.
The total number of campaign_ids is 107.
*/

