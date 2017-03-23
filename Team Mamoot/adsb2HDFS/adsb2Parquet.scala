val sqlContext = new org.apache.spark.sql.SQLContext(sc);
val df = sqlContext.read.json("file:///data/tmp/adsbexchange/*.json");
df.repartition(10).write.parquet("/data/flightdata/adsbexchange/parquet/adsbexchange");

print("Files converted to parquet and ingested into HDFS.");
System.exit(0);