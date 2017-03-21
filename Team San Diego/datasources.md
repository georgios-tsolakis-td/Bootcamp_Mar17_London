# Data sources and location

### flight delay data
   supplied parquet files
### FAA flight data
   http://registry.faa.gov/database/ReleasableAircraft.zip 
### flightaware.com
   automatic harvesting explicitly forbidden
### Airline On-Time Performance Data
https://www.transtats.bts.gov/DL_SelectFields.asp?Table_ID=236&DB_Short_Name=On-Time

## Format of the flight delay data

 actualelapsedtime: INT
 airlineid: INT
 airtime: INT
 arrdel15: INT
 arrdelay: INT
 arrdelayminutes: INT
 arrivaldelaygroups: INT
 arrtime: INT
 arrtimeblk: STR
 cancellationcode: STR
 cancelled: INT
 carrier: STR
 carrierdelay: INT
 crsarrtime: INT
 crsdeptime: INT
 crselapsedtime: INT
 dayofmonth: INT
 dayofweek: INT
 departuredelaygroups: INT
 depdel15: INT
 depdelay: INT
 depdelayminutes: INT
 deptime: INT
 deptimeblk: STR
 dest: STR
 destairportid: INT
 destairportseqid: INT
 destcitymarketid: INT
 destcityname: STR
 deststate: STR
 deststatefips: INT
 deststatename: STR
 destwac: INT
 distance: INT
 distancegroup: INT
 diverted: INT
 firstdeptime: INT
 flightdate: STR
 flightnum: INT
 flights: INT
 lateaircraftdelay: INT
 longestaddgtime: INT
 month: INT
 nasdelay: INT
 origin: STR
 originairportid: INT
 originairportseqid: INT
 origincitymarketid: INT
 origincityname: STR
 originstate: STR
 originstatefips: INT
 originstatename: STR
 originwac: INT
 quarter: INT
 securitydelay: INT
 tailnum: STR
 taxiin: INT
 taxiout: INT
 totaladdgtime: INT
 uniquecarrier: STR
 weatherdelay: INT
 wheelsoff: INT
 wheelson: INT
 year: INT
