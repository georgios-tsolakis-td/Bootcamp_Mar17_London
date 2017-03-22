# Rummers' Flight Delays
# Adding airport and aircraft information

# This file adds data on airports (keyed by the IACA three letter codes) and
# airplanes (keyed by their tail numbers).

# The data sources can be found at <tbd> and <tbd>.

# The result is stored as RData and csv file.

# Inputs:
# * `flightdelays-holidays-red.RData`
# * `tbd` (airport data)
# * `tbd` (aircraft data)

# Output:
# * `fl.RData` (master analytical data set)


library(data.table)

# (1) Read in bound monthly flight delay data with holidays #####
load('data/flightdelays-holidays-red.RData') #provides fl

# (2) Read in airports data #####

# TBD insert code here

# (3) Read in airplane data #####

# TBD insert code here

# (4) Merge (join) delay, airport and airplane data ####

# TBD insert code here

# (3) Store results ####
save(fl, file = 'data/fl.RData')
write.csv(fl, file = 'data/fl.csv')
\