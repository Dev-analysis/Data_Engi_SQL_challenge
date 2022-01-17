# Data Quality Engineer Challenge

Welcome to the Data Quality Engineer Challenge! This challenge
was created by HAMS to evaluate the ability to analyse the data
in the associated database and identify any data quality issues(https://github.com/haensel-ams/recruitment_challenge/tree/master/Data_Quality_202108).

This repository contains probable answers to the author's queries as well as challenges I encountered during the process.

# Introduction:

Here we are going to analyse the data in the database file challenge.db file. This is a Zipped SQLite database with the following schema.
The data belongs to a company called Company X and contains information of e-commerce purchases that were made with Company X. Each purchase (in 'conversions' table) has a certain revenue attached to it and was made by a given user ('user_id'). In the 'session_souces' table you can find information of what sessions (a session is a set of events) happened on the company's website. Every user who made a conversion, had multiple sessions prior to this purchase which make up his customer journey. The link between conversions and those sessions is made via the 'attribution_customer_journey' table where for each conv_id from the 'conversions' table, you can find all sessions that belong to this customer journey.

The 'conversions_backend' table is exactly the same as the 'conversions' table in terms of format but contains data directly from the company's backend system and is considered true. In case the data in the 'conversions' table differs from the data in the 'conversions_backend' table, this is an issue.
Often there are external data sources (for instance for marketing costs) that come into play. In this case, there is one external data source api_adwords_costs table. This table contains per day and AdWords campaign ID the costs that Company X paid for running this ad. The campaign_id here links to the campaign_id in the 'session_sources' table.


# Tables in the challenge.db file
+ session_sources:

  * session_id: unique identifier of this session
  * user_id: user identifier
  * event_date: date when the session happened
  * event_time: time when the session happened
  *	channel_name: traffic channel that started this session (e.g. 'Email')
  *	campaign_name: advertising campaign name that started this session (e.g. 'adwords_campaign_123')
  *	campaign_id: campaign identifier that started this session (not all sessions have a campaign_id)
  *	market: regional market that this session belongs to (e.g. 'DE' for Germany)
  *	cpc: cost-per-click of this (this is how much was paid for this session, you can assume its in Euro)

* conversions:
  *	conv_id: unique identifier of this conversion
  *	user_id: user identifier
  *	conv_date: date when the conversion happened
  *	market: regional market that this conversion belongs to
  *	revenue: conversion amount (i.e. how much revenue the company earned through this conversion, you can assume                  its in Euro)

* conversions_backend :
  *	conv_id: unique identifier of this conversion
  *	user_id: user identifier
  *	conv_date: date when the conversion happened
  *	market: regional market that this conversion belongs to
  *	revenue: conversion amount

* api_adwords_costs :
  *	event_date: date when the AdWords campaign was running
  *	campaign_id: campaign identifier
  *	cost: amount that was spent on running this campaign on this day (assume its in Euro)
  *	clicks: number of times a user clicked on this ad on the given day

* attribution_customer_journey :
  * conv_id: conversion identifier
  * session_id: session identifier that belonged in the customer journey of the given conv_id
  * ihc: 'value' of the given session in the given customer journey (1 = 100%)
Note: the sum of 'ihc' column in the 'attribution_customer_journey' should be equal to 1 (100%) for each 'conv_id'

# AIM:

* Our primary aim is to find a potential answer to the author's question. 

Questions: 
1. Are the costs in the 'api_adwords_costs' table fully covered in the 'session_sources' table? Any 		campaigns where you see issues?
2. Are the conversions in the 'conversions' table stable over time? Any pattern?
3. Double check conversions ('conversions' table) with backend ('conversions_backend' table), any 		issues?
4. Are attribution results consistent? Do you find any conversions where the 'ihc' values don't make 		sense?
5. (Bonus) Do we have an issue with channelling? Are the number of sessions per channel stable over 		time?


* What challenges can be faced as a beginner?
1. How to open 'DB' file (windows).
2. Load the TEXT files into MySQL.

# Technologies: 

a. Windows Operating System
b. Online SQLite / Microsoft Visual Studio Code 1.6.3
c. MySQL 8.0.26
d. TABLEAU 20.4.2463

[Initially, Online SQLite was used to open the 'db' file, but in finding another possible way to open the 'db' file, curiosity led us to Microsoft Visual Studio Code.
We have to upload the 'challenge_db' file in the programme and download all files in '.txt' format in both applications.]

# Files:

There are three folders in addition to the "schema" and "challenge DB" files:

1. Primary steps:

	a. Load_data file: After opening files in ".txt," the next step is to load data into MySQL.

	b. Verification:  This file contains all SQL queries related to the challenger's statement in the primary 		data introduction. The aim is to cross-check the statement. This stage confirms that we are dealing 		with the same data that the challenger has provided, and it also helps us to create a better 		understanding of the data and become more familiar with it.

2. Answers: All potential Answers to the challenger's questions can be found here.
 The main query is preceded by other queries, which is helpful for understanding the data 	and also a crucial part of the process.

3. Other: 
	structuring.sql file: Here, we can find a query related to modification(*optional).
  In the original file It can be noticed that the primary and foreign keys are prefixed by their column names.
   
  i.e. conv_id_16788, conv_id_8443, 	user_id_569581, user_id_62541 etc. After dealing with data.
	[It is acceptable to prefix the primary key's entries with their column names; it doesn't encroach on the 	properties of the primary key. [Where apart from the prefixed word, the rest of the words follow the Primary 	Key rules.]

If one wants to remove entries with their prefixed "column name", The SQL query can be found in the 		structuring.sql file.