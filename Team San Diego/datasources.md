# Data sources and location

## Links
https://en.wikipedia.org/wiki/List_of_airlines_of_the_United_States

http://www.airfleets.net/recherche/list-country-USA_0.htm

http://www.fi-aeroweb.com/US-Commercial-Aircraft-Fleet.html

### flight delay data
   supplied parquet files
### FAA flight data
   http://registry.faa.gov/database/ReleasableAircraft.zip 
### flightaware.com
ADS-B flight data feed

For access to the API: https://uk.flightaware.com/commercial/flightxml/key

#### Example
```
epoch_time,mode_s_code,flight_level,latitude,longitude,groundspeed,heading,air_ground_flag,ident,registration,flight_id
1404940425,73806E,350,51.191913,7.420654,453,134,A,ELY336,,ELY336-1404711592-airline-0128:0
1404940425,73806E,350,51.191913,7.420654,453,134,A,ELY336,,ELY336-1404711592-airline-0128
1404940425,3C49A6,173,51.017203,7.603073,362,44,A,BER7727,,BER7727-1404711272-airline-0176:0
1404940425,AB64B8,236,26.65114,-80.58466,412,356,A,AAL1599,,AAL1599-1404711241-airline-0388
```

### airframes.org
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
