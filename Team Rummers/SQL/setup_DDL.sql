CREATE SCHEMA bootcamp;

DROP TABLE IF EXISTS bootcamp.planes;
CREATE TABLE bootcamp.planes(
tailnum varchar,
year varchar,
type varchar,
manufacturer varchar,
model varchar,
engines varchar,
seats varchar,
speed varchar,
engine varchar
) DISTRIBUTE BY REPLICATION

DROP TABLE IF EXISTS bootcamp.airports;
CREATE TABLE bootcamp.airports(
faa varchar,
name varchar,
lat varchar,
lon varchar,
alt varchar,
tz varchar,
dst varchar,
region varchar
) DISTRIBUTE BY REPLICATION;

DROP TABLE IF EXISTS bootcamp.flights;
CREATE TABLE bootcamp.flights(
Year		varchar,
Quarter		varchar,
Month		varchar,
DayofMonth		varchar,
DayOfWeek		varchar,
FlightDate		varchar,
UniqueCarrier		varchar,
AirlineID		varchar,
Carrier		varchar,
TailNum		varchar,
FlightNum		varchar,
OriginAirportID		varchar,
OriginAirportSeqID		varchar,
OriginCityMarketID		varchar,
Origin		varchar,
OriginCityName		varchar,
OriginState		varchar,
OriginStateFips		varchar,
OriginStateName		varchar,
OriginWac	varchar,
DestAirportID		varchar,
DestAirportSeqID		varchar,
DestCityMarketID		varchar,
Dest		varchar,
DestCityName		varchar,
DestState		varchar,
DestStateFips		varchar,
DestStateName		varchar,
DestWac		varchar,
CRSDepTime		varchar,
DepTime		varchar,
DepDelay		varchar,
DepDelayMinutes		varchar, 
DepDel15		varchar,
DepartureDelayGroups		varchar,
DepTimeBlk		varchar,
TaxiOut		varchar,
WheelsOff		varchar,
WheelsOn		varchar,
TaxiIn		varchar,
CRSArrTime		varchar,
ArrTime		varchar,
ArrDelay		varchar,
ArrDelayMinutes		varchar,
ArrDel15		varchar,
ArrivalDelayGroups		varchar,
ArrTimeBlk		varchar,
Cancelled		varchar,
CancellationCode varchar,		
Diverted		varchar,
CRSElapsedTime		varchar,
ActualElapsedTime		varchar,
AirTime		varchar,
Flights		varchar,
Distance		varchar,
DistanceGroup		varchar,
CarrierDelay		varchar,
WeatherDelay		varchar,
NASDelay		varchar,
SecurityDelay		varchar,
LateAircraftDelay		varchar,
FirstDepTime		varchar,
TotalAddGTime		varchar,
LongestAddGTime		varchar,
DivAirportLandings		varchar,
DivReachedDest		varchar,
DivActualElapsedTime		varchar,
DivArrDelay		varchar,
DivDistance		varchar,
Div1Airport		varchar,
Div1AirportID		varchar,
Div1AirportSeqID		varchar,
Div1WheelsOn		varchar,
Div1TotalGTime		varchar,
Div1LongestGTime		varchar,
Div1WheelsOff		varchar,
Div1TailNum		varchar,
Div2Airport		varchar,
Div2AirportID		varchar,
Div2AirportSeqID		varchar,
Div2WheelsOn		varchar,
Div2TotalGTime		varchar,
Div2LongestGTime		varchar,
Div2WheelsOff		varchar,
Div2TailNum		varchar,
Div3Airport		varchar,
Div3AirportID		varchar,
Div3AirportSeqID		varchar,
Div3WheelsOn		varchar,
Div3TotalGTime		varchar,
Div3LongestGTime		varchar,
Div3WheelsOff		varchar,
Div3TailNum		varchar,
Div4Airport		varchar,
Div4AirportID		varchar,
Div4AirportSeqID		varchar,
Div4WheelsOn		varchar,
Div4TotalGTime		varchar,
Div4LongestGTime		varchar,
Div4WheelsOff		varchar,
Div4TailNum		varchar,
Div5Airport		varchar,
Div5AirportID		varchar,
Div5AirportSeqID		varchar,
Div5WheelsOn		varchar,
Div5TotalGTime		varchar,
Div5LongestGTime		varchar,
Div5WheelsOff		varchar,
Div5TailNum		varchar,
dummy varchar)
DISTRIBUTE BY HASH(carrier);


SELECT COUNT(*) FROM bootcamp.flights;
1 348 838

CREATE TABLE bootcamp.denorm DISTRIBUTE BY HASH(carrier) AS
SELECT a.year, a.quarter, a.month, a.dayofmonth, a.dayofweek, a.flightdate, a.uniquecarrier, a.airlineid, a.carrier, a.tailnum,
flightnum, a.originairportid, a.originairportseqid, a.origincitymarketid, a.origin, a.origincityname, a.originstate, a.originstatefips,
originstatename, a.originwac, a.destairportid, a.destairportseqid, a.destcitymarketid, a.dest, a.destcityname, a.deststate, a.
deststatefips, a.deststatename, a.destwac, a.crsdeptime, a.deptime, a.depdelay, a.depdelayminutes, a.depdel15, a.departuredelaygroups, a.
deptimeblk, a.taxiout, a.wheelsoff, a.wheelson, a.taxiin, a.crsarrtime, a.arrtime, a.arrdelay, a.arrdelayminutes, a.arrdel15, a.
arrivaldelaygroups, a.arrtimeblk, a.cancelled, a.cancellationcode, a.diverted, a.crselapsedtime, a.actualelapsedtime, a.airtime,
flights, a.distance, a.distancegroup, a.carrierdelay, a.weatherdelay, a.nasdelay, a.securitydelay, a.lateaircraftdelay, 
b.name, b.lat, b.lon,b.alt,b.tz, b.dst,b.region, 
c.year yearofmanufacture,c.type,c.manufacturer,c.model,c.engines,c.seats,c.engine	
FROM bootcamp.flights a
JOIN bootcamp.airports b
ON a.origin = b.faa
JOIN bootcamp.planes c
ON a.tailnum = c.tailnum


