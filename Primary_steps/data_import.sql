USE challenge_db;

LOAD DATA
INFILE "D:/Challenge DB/conversion.txt"
INTO TABLE conversions
FIELDS TERMINATED BY ','
enclosed by '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;


SELECT * FROM conversions;

# ISSUE: CAN'T BE PRIMARY KEY CAUSE THERE ARE DUPLICATE ENTRIES

LOAD DATA
INFILE "D:/Challenge DB/conversons_backend.txt"
INTO TABLE conversions_backend 
FIELDS TERMINATED BY ','
enclosed by '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

SELECT * FROM conversions_backend;
# NO NEW CUSTOMIZATION ON TABLE SAME AS PROVIDED schema

LOAD DATA
INFILE "D:/Challenge DB/api_adwards.txt"
INTO TABLE api_adwords_costs 
FIELDS TERMINATED BY ','
enclosed by '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

SELECT * FROM api_adwords_costs;
# NO NEW CUSTOMIZATION ON TABLE SAME AS PROVIDED schema


LOAD DATA
INFILE "D:/Challenge DB/attribution.txt"
INTO TABLE attribution_customer_journey
FIELDS TERMINATED BY ','
enclosed by '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

SELECT * FROM attribution_customer_journey;

# NO NEW CUSTOMIZATION ON TABLE SAME AS PROVIDED schema

LOAD DATA
INFILE "D:/Challenge DB/session.txt"
INTO TABLE session_sources
FIELDS TERMINATED BY ','
enclosed by '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

SELECT * FROM session_sources;

/* 
if getting an error of "Lost connection" then follow these steps
Edit > Preferences > SQL editor >
increase the MySQL session time from 600 to 6000 as well others.
There are some duplicate entries in the data set, so unassign the primary key. 
*/
