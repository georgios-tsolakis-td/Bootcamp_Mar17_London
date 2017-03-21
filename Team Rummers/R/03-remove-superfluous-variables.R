# Rummers' Flight Delays
# Removing superfluous variables

# This file removes variables from the data set that are not useful for
# modelling and/or visualization.

# The result is stored as RData and csv file.

# Inputs:
# * `flightdelays-holidays-red.RData`

# Output:
# * `flightdelays-holidays-red.RData`


library(data.table)

# (1) Read in bound monthly flight delay data with holidays #####
load('data/flightdelays-holidays.RData') #provides fl

# (2) Remove superfluous variables #####

# TBD insert code here

# (3) Store results ####
save(fl, file = 'data/flightdelays-holidays-red.RData')
write.csv(fl, file = 'data/flightdelays-holidays-red.csv')
