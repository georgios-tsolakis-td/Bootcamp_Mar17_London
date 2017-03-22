
fl<-read.csv("flightdelays1-3.csv")
planes<- read.csv("planes.csv")
airports <- read.csv("airports.csv")


library(dplyr)

#Drop the Div variables
fl<-select(fl, which(!grepl("Div",names(fl))))
#Remove variables that have a NA percantage of 20% and above
nav<-sapply(fl, function(y) sum(length(which(is.na(y)))))/nrow(fl)
toremove<-names(which(nav>0.2))
fl<-fl[,!(names(fl) %in% toremove)]

#Remove examples with NAs
fl<-na.omit(fl)

holidays <- c('2016-01-01','2016-01-18','2016-02-15','2016-04-15')
holidayDates <- as.Date(holidays)


DaysToHoliday <- function(month, day){ 
  currDate <- as.Date(paste(2016,month,day,sep = '-')) 
  numDays <- as.numeric(min(abs(currDate-holidayDates))) 
  return(numDays)
}

InputDays <- function(month,day){
  finalDays <- datesOfYear$HDAYS[datesOfYear$Month == month & datesOfYear$DayofMonth == day]
  return(finalDays)
}


datesOfYear <- unique(fl[,c("Month","DayofMonth")])
datesOfYear$HDAYS <- mapply(DaysToHoliday, datesOfYear$Month, datesOfYear$DayofMonth) 

fl$DaysToHoliday <- mapply(InputDays, fl$Month, fl$DayofMonth)

drop<-c("X","Quarter","Year","Month","DayofMonth","DayOfWeek","FlightDate","UniqueCarrier","AirlineID","OriginAirportID","OriginAirportSeqID",
        "DestAirportID", "DestAirportSeqID","OriginCityMarketID", "OriginStateFips", "OriginWac","DestCityMarketID","DestStateFips", "DestWac",
        "DepTime", "DepDelayMinutes", "DepDel15", "DepartureDelayGroups", "DepTimeBlk", "WheelsOff", "WheelsOn",
        "ArrTime", "ArrDelayMinutes", "ArrDel15", "ArrivalDelayGroups", "ArrTimeBlk", "Cancelled", "CancellationCode","DistanceGroup","Flights")


fl<-fl[,-which(names(fl) %in% drop)]


firstjoin<-inner_join(fl,planes,by=c("TailNum"="tailnum"))
secondjoin<-inner_join(firstjoin,airports,by=c("Origin"="faa"))

dataset<-secondjoin

write.csv(dataset,file="ADS.csv")
