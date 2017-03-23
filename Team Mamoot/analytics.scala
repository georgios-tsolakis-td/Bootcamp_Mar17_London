val  skynetData = spark.read.parquet("/data/flightdata/parquet-trimmed/*");
val adsbData = spark.read.parquet("/data/flightdata/adsbexchange/parquet/*/*");

val sqlContext = new org.apache.spark.sql.hive.HiveContext(sc);

val masterData = sqlContext.sql("FROM master SELECT *");
adsbData.createOrReplaceTempView("adsbexchange");
skynetData.createOrReplaceTempView("skynetparquet");
masterData.createOrReplaceTempView("master");

val noAdsB = spark.sql("SELECT count(Id) FROM adsbexchange WHERE Trt < 2");
noAdsB.show();
val master_count = spark.sql("SELECT count(*) from master");
master_count.show();

val merged_data = spark.sql("select * from master m inner join adsbexchange a on m.SERIAL_NUMBER=a.Id where m.COUNTRY='US'");
merged_data.createOrReplaceTempView("merged_data");
val master_res = spark.sql("select count(*) as total_aircrafts, TYPE_AIRCRAFT from merged_data group by TYPE_AIRCRAFT");
master_res.createOrReplaceTempView("master_res");

val companies = spark.sql("select * from merged_data md inner join master_res mr on mr.TYPE_AIRCRAFT = md.TYPE_AIRCRAFT order by total_aircrafts desc");

System.exit(0);