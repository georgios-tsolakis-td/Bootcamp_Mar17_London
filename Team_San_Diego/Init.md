	// load qarquet-trimmed
	val path="/data/flightdata"
	val trimmed = spark.read.parquet(s"$path/parquet-trimmed")
	trimmed.registerTempTable("trimmed")

	// now we can search with sql spark.sql("real sql command").show
	spark.sql("select count(*) from trimmed").show
