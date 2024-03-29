SET search_path TO "stats_db";


BEGIN TRANSACTION;

CREATE SEQUENCE METRIC_GAUGE_SEQUENCE START WITH 1 INCREMENT BY 1;

CREATE TABLE METRIC_GAUGE (
                              ID BIGINT DEFAULT nextval('METRIC_GAUGE_SEQUENCE') PRIMARY KEY,
                              SOURCE VARCHAR(255) NOT NULL,
                              TIMESTAMP BIGINT NOT NULL,
                              NAME VARCHAR(255) NOT NULL,
                              VALUE VARCHAR(100) NOT NULL
);

CREATE SEQUENCE METRIC_COUNTER_SEQUENCE START WITH 1 INCREMENT BY 1;

CREATE TABLE METRIC_COUNTER (
                                ID BIGINT DEFAULT nextval('METRIC_COUNTER_SEQUENCE') PRIMARY KEY,
                                SOURCE VARCHAR(255) NOT NULL,
                                TIMESTAMP BIGINT NOT NULL,
                                NAME VARCHAR(255) NOT NULL,
                                COUNT BIGINT NOT NULL
);

CREATE SEQUENCE METRIC_METER_SEQUENCE START WITH 1 INCREMENT BY 1;

CREATE TABLE METRIC_METER (
                              ID BIGINT DEFAULT nextval('METRIC_METER_SEQUENCE') PRIMARY KEY,
                              SOURCE VARCHAR(255) NOT NULL,
                              TIMESTAMP BIGINT NOT NULL,
                              NAME VARCHAR(255) NOT NULL,
                              COUNT BIGINT NOT NULL,
                              MEAN_RATE NUMERIC(25,20) NOT NULL,
                              M1_RATE NUMERIC(25,20) NOT NULL,
                              M5_RATE NUMERIC(25,20) NOT NULL,
                              M15_RATE NUMERIC(25,20) NOT NULL,
                              RATE_UNIT VARCHAR(50) NOT NULL
);

CREATE SEQUENCE METRIC_HISTOGRAM_SEQUENCE START WITH 1 INCREMENT BY 1;

CREATE TABLE METRIC_HISTOGRAM (
                                  ID BIGINT DEFAULT nextval('METRIC_HISTOGRAM_SEQUENCE') PRIMARY KEY,
                                  SOURCE VARCHAR(255) NOT NULL,
                                  TIMESTAMP BIGINT NOT NULL,
                                  NAME VARCHAR(255) NOT NULL,
                                  COUNT BIGINT NOT NULL,
                                  MAX NUMERIC(25,20) NOT NULL,
                                  MEAN NUMERIC(25,20) NOT NULL,
                                  MIN NUMERIC(25,20) NOT NULL,
                                  STDDEV NUMERIC(25,20) NOT NULL,
                                  P50 NUMERIC(25,20) NOT NULL,
                                  P75 NUMERIC(25,20) NOT NULL,
                                  P95 NUMERIC(25,20) NOT NULL,
                                  P98 NUMERIC(25,20) NOT NULL,
                                  P99 NUMERIC(25,20) NOT NULL,
                                  P999 NUMERIC(25,20) NOT NULL
);

CREATE SEQUENCE METRIC_TIMER_SEQUENCE START WITH 1 INCREMENT BY 1;

CREATE TABLE METRIC_TIMER (
                              ID BIGINT DEFAULT nextval('METRIC_TIMER_SEQUENCE') PRIMARY KEY,
                              SOURCE VARCHAR(255) NOT NULL,
                              TIMESTAMP BIGINT NOT NULL,
                              NAME VARCHAR(255) NOT NULL,
                              COUNT BIGINT NOT NULL,
                              MAX NUMERIC(25,20) NOT NULL,
                              MEAN NUMERIC(25,20) NOT NULL,
                              MIN NUMERIC(25,20) NOT NULL,
                              STDDEV NUMERIC(25,20) NOT NULL,
                              P50 NUMERIC(25,20) NOT NULL,
                              P75 NUMERIC(25,20) NOT NULL,
                              P95 NUMERIC(25,20) NOT NULL,
                              P98 NUMERIC(25,20) NOT NULL,
                              P99 NUMERIC(25,20) NOT NULL,
                              P999 NUMERIC(25,20) NOT NULL,
                              MEAN_RATE NUMERIC(25,20) NOT NULL,
                              M1_RATE NUMERIC(25,20) NOT NULL,
                              M5_RATE NUMERIC(25,20) NOT NULL,
                              M15_RATE NUMERIC(25,20) NOT NULL,
                              RATE_UNIT VARCHAR(50) NOT NULL,
                              DURATION_UNIT VARCHAR(50) NOT NULL
);

CREATE INDEX IDX_TIMESTAMP_GAUGE ON METRIC_GAUGE (TIMESTAMP);
CREATE INDEX IDX_TIMESTAMP_COUNTER ON METRIC_COUNTER (TIMESTAMP);
CREATE INDEX IDX_TIMESTAMP_METER ON METRIC_METER (TIMESTAMP);
CREATE INDEX IDX_TIMESTAMP_HISTOGRAM ON METRIC_HISTOGRAM (TIMESTAMP);
CREATE INDEX IDX_TIMESTAMP_TIMER ON METRIC_TIMER (TIMESTAMP);

CREATE TABLE IF NOT EXISTS AM_USAGE_UPLOADED_FILES (
                            FILE_NAME varchar(255) NOT NULL,
                            FILE_TIMESTAMP TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP,
                            FILE_PROCESSED smallint DEFAULT 0,
                            FILE_CONTENT BYTEA DEFAULT NULL,
                            PRIMARY KEY (FILE_NAME, FILE_TIMESTAMP)
);


commit;