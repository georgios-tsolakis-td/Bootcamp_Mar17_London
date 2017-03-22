# Rummers' Flight Delays
# Integrating delay data

# This file integrates monthly flight delay data retrieved from
# <https://www.transtats.bts.gov/DL_SelectFields.asp?Table_ID=236>

# The result is stored as RData and csv file.

# Inputs:
# * `On_Time_On_Time_Performance_2016_{1-3}.csv`

# Output:
# * `flightdelays1-3.RData`

library(data.table)

# (1) Read in raw csv data files ####
fl1 <- fread('data/On_Time_On_Time_Performance_2016_1.csv')
fl2 <- fread('data/On_Time_On_Time_Performance_2016_2.csv')
fl3 <- fread('data/On_Time_On_Time_Performance_2016_3.csv')


# (2) Bind monthly data together ####
fl <- rbindlist(list(fl1, fl2, fl3))

# (3) Save data to disk ####
save(fl, file = 'data/flightdelays1-3.RData')
write.csv(fl, file = 'data/flightdelays1-3.csv')
