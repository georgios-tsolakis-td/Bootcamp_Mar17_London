# Rummers' Flight Delays
# Integrating Holiday Information

# This file integrates holiday information to the data set. The following attributes
# are added:
#
# * DaysToHoliday - the absolute distance in days to a holiday (tbd)
# * HDAY - (tbd)

# The data source for the holidays is at <tbd>.

# The result is stored as RData and csv file.

# Inputs:
# * `flightdelays1-3.RData`

# Output:
# * `flightdelays-holidays.RData`


library(data.table)

# (1) Read in bound monthly flight delay data #####
load('data/flightdelays1-3.RData') #provides fl

# (2) Setup holiday data #####

# TBD insert code here

# (3) Compute holiday distance ####

# (4) Store results ####
save(fl, file = 'data/flightdelays-holidays.RData')
write.csv(fl, file = 'data/flightdelays-holidays.csv')
