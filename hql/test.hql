set hive.execution.engine=mr;

CREATE EXTERNAL TABLE test (
  id STRING,
  val INT
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
location '/data/test_csv/';


set hive.execution.engine=tez;
set tez.am.log.level=debug;
set hive.tez.log.level=debug;

CREATE TABLE test_orc STORED AS ORC AS
select * from test;
