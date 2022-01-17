CREATE TABLE IF NOT EXISTS conversions (
                                    conv_id VARCHAR(100) NOT NULL ,
                                    user_id VARCHAR(100) NOT NULL ,
                                    conv_date DATE NOT NULL,
                                    market VARCHAR(200) NOT NULL,
                                    revenue VARCHAR(200) NOT NULL
                                    );
                                    

                                    
CREATE TABLE IF NOT EXISTS conversions_backend (
                                    conv_id VARCHAR(200) NOT NULL,
                                    user_id VARCHAR(200) NOT NULL,
                                    conv_date VARCHAR(200) NOT NULL,
                                    market VARCHAR(200) NOT NULL,
                                    revenue real NOT NULL,
                                    PRIMARY KEY(conv_id,user_id,conv_date)
                                );

CREATE TABLE IF NOT EXISTS api_adwords_costs (
                                    event_date VARCHAR(200) NOT NULL,
                                    campaign_id VARCHAR(200) NOT NULL,
                                    cost real NOT NULL,
                                    clicks integer NOT NULL,
                                    PRIMARY KEY(event_date,campaign_id)
                                );

CREATE TABLE IF NOT EXISTS session_sources (
                                    session_id VARCHAR(200) NOT NULL,
                                    user_id VARCHAR(200) NOT NULL,
                                    event_date VARCHAR(200) NOT NULL,
                                    event_time text NOT NULL,
                                    channel_name text NOT NULL,
                                    campaign_name text NOT NULL,
                                    campaign_id text NOT NULL,
                                    market text NOT NULL,
                                    cpc real NOT NULL
                                    );


CREATE TABLE IF NOT EXISTS attribution_customer_journey (
                                    conv_id VARCHAR(200) NOT NULL,
                                    session_id VARCHAR(200) NOT NULL,
                                    ihc real NOT NULL,
                                    PRIMARY KEY(conv_id,session_id)
                                );

