
create database if not exists ${DB};

use ${DB};


create table if not exists parquet_trimmed(
    year int,
    quarter int,
    month int,
    dayofmonth int,
    dayofweek int,
    flightdate string,
    uniquecarrier string,
    airlineid int,
    carrier string,
    tailnum string,
    flightnum int,
    originairportid int,
    originairportseqid int,
    origincitymarketid int,
    origin string,
    origincityname string,
    originstate string,
    originstateips int,
    originstatename string,
    originwac int,
    destairportid int,
    destairportseqid int,
    destcitymarketid int,
    dest string,
    destcityname string,
    deststate string,
    deststateips int,
    deststatename string,
    destwac int,
    crsdeptime int,
    deptime int,
    depdelay int,
    depdelayminutes int,
    depdel15 int,
    departuredelaygroups int,
    deptimeblk string,
    taxiout int,
    wheelsoff int,
    wheelson int,
    taxiin int,
    crsarrtime int,
    arrtime int,
    arrdelay int,
    arrdelayminutes int,
    arrdel15 int,
    arrivaldelaygroups int,
    arrtimeblk string,
    cancelled int,
    cancellationcode string,
    diverted int,
    crselapsedtime int,
    actualelapsedtime int,
    airtime int,
    flights int,
    distance int,
    distancegroup int,
    carrierdelay int,
    weatherdelay int,
    nasdelay int,
    securitydelay int,
    lateaircraftdelay int,
    firstdeptime int,
    totaladdgtime int,
    longestaddgtime int
) stored as parquet location '/data/flightdata/parquet-trimmed';


