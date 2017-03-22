## How do we find out which planes lack the ads-b transponder?

Prerequisites:
 - Airplane data from ADS-B as well as data indicating it was produced by non-ADS-B transponders. Both datasources should exhibit information on airframe type
 - Data which will link an airframe to the make (type) of airplane (this is found in e.g. http://airframes.org)
 - Data which shows the number of airplane types operated by all US commercial airlines

Order of operation:
 - Getting the airframe type from the transponder data and inferring airplane type from looking up airframes with airplane types
 - Listing airlines that have the most of these airplane types