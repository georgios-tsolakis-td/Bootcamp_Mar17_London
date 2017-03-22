	
	 val path ="/usr/zeppelin/data/aircraft-registrations"


## ACFTREF

    val acftRef=spark.read.option("header", true).option("inferSchema", true).csv(s"$path/ACFTREF.txt")
    acftRef.count // 80663
    acftRef.printSchema

    root
     |-- ﻿CODE: string (nullable = true)
     |-- MFR: string (nullable = true)
     |-- MODEL: string (nullable = true)
     |-- TYPE-ACFT: integer (nullable = true)
     |-- TYPE-ENG: double (nullable = true)
     |-- AC-CAT: integer (nullable = true)
     |-- BUILD-CERT-IND: integer (nullable = true)
     |-- NO-ENG: integer (nullable = true)
     |-- NO-SEATS: integer (nullable = true)
     |-- AC-WEIGHT: string (nullable = true)
     |-- SPEED: integer (nullable = true)
     |-- _c11: string (nullable = true)
     
     
example data
