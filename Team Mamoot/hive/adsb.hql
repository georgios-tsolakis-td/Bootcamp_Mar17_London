use ${DB};

ADD JAR hive-json-serde-0.3.jar;
ADD JAR json-path-0.5.4.jar;
ADD JAR json-smart-1.0.6.3.jar;

CREATE EXTERNAL TABLE IF NOT EXISTS adsbexchange (
    id string,
    transponder_type int
)
ROW FORMAT SERDE "org.apache.hadoop.hive.contrib.serde2.JsonSerde"
WITH SERDEPROPERTIES (
    "id"="$.acList.Id",
    "transponder_type"="$.acList.Trt"
)
LOCATION '/vagrant/adsbexchange';

#Transponder type - 0=Unknown, 1=Mode-S, 2=ADS-B (unknown version), 3=ADS-B 1, 4=ADS-B 2.
select id
from adsbexchange
where transponder_type < 2;